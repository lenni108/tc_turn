package com.turnskiing.tcturn;

import android.Manifest;
import android.app.Activity;
import android.app.ListActivity;
import android.bluetooth.*;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanFilter;
import android.bluetooth.le.ScanResult;
import android.bluetooth.le.ScanSettings;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelUuid;
import android.support.annotation.RequiresApi;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Adapter;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.UUID;

import static android.bluetooth.BluetoothAdapter.STATE_DISCONNECTED;
import static android.content.ContentValues.TAG;

@RequiresApi(api = Build.VERSION_CODES.M)

public class BLEConnection extends AppCompatActivity{

    public TextView tv_log;
    public ImageView boot_connected;
    public TextView tv_pressure_bar;

    private BleThreadAsync asyncTask;

    private static final String TAG = "TC-App: ";
    private static final String left = "88:3F:4A:E5:EE:93";
    private static final String right = "4C:3F:D3:02:CC:8F";
    private static final UUID SERVICE_TURN_UUID = UUID.fromString("0000ffe0-0000-1000-8000-00805f9b34fb");
    private static final UUID CHARACTERISTIC_TURN_UUID = UUID.fromString("0000ffe1-0000-1000-8000-00805f9b34fb");
    private static final int SCAN_PERIOD = 1000;

    private long heelR = 0;
    private long front1R = 0;
    private long front2R = 0;

    private Handler mHandler;
    private BluetoothGatt mGattLeft;
    private BluetoothGatt mGattRight;
    private boolean mConnectedLeft;
    private boolean mConnectedRight;
    private boolean mInitializedLeft;
    private boolean mInitializedRight;
    private BluetoothManager mBluetoothManager;
    private BluetoothAdapter mBluetoothAdapter;
    private boolean mScanning;
    private Map<String, BluetoothDevice> mScanResults;
    private BluetoothGattCharacteristic characteristicRight;
    private BluetoothGattCharacteristic characteristicLeft;
    private BluetoothLeScanner mBluetoothLeScanner;
    private DataStorage dataStorage;
    private ScanCallback mScanCallback = new ScanCallback() {
        @Override
        public void onScanResult(int callbackType, ScanResult result) {
            tv_log.append("result!\n");
        }
    };

    public BLEConnection (TextView tv, ImageView boot_connected, TextView tv_pressure_bar, BluetoothManager bluetoothManager, BluetoothAdapter bluetoothAdapter, DataStorage dataStorage, BleThreadAsync asyncTask) {
        tv_log = tv;
        this.mBluetoothManager = bluetoothManager;
        this.mBluetoothAdapter = bluetoothAdapter;
        this.dataStorage = dataStorage;
        this.asyncTask = asyncTask;
        this.boot_connected = boot_connected;
        this.tv_pressure_bar = tv_pressure_bar;

        //Looper.prepare();
    }

    public boolean startScan() {

        List<ScanFilter> filters = new ArrayList<>();
        ScanFilter scanFilter = new ScanFilter.Builder()
                //.setServiceUuid(new ParcelUuid(SERVICE_UUID))
                //.setDeviceAddress("4C:3F:D3:02:CC:8F")
                .setDeviceAddress(left)
                .build();
        //filters.add(scanFilter);
        scanFilter = new ScanFilter.Builder()
                .setDeviceAddress(right)
                .build();
        filters.add(scanFilter);

        ScanSettings settings = new ScanSettings.Builder()
                .setScanMode(ScanSettings.SCAN_MODE_LOW_POWER)
                .build();

        mScanResults = new HashMap<>();
        mScanCallback = new BtleScanCallback();
        mBluetoothLeScanner = mBluetoothAdapter.getBluetoothLeScanner();
        mBluetoothLeScanner.startScan(filters, settings, mScanCallback);
        mScanning = true;
        mHandler = new Handler();
        mHandler.postDelayed(new Runnable() {
        //new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
            @Override
            public void run() {
                stopScan();
            }
        }, SCAN_PERIOD);

        return true;
    }

    public void reconnectLeft() {
        if (mConnectedLeft) {
            Log.d(TAG,"left already connected!!!\n");
            disconnectLeft();
            Log.d(TAG,"attempting reconnection on left...\n");
            startScan();
        } else {
            Log.d(TAG,"attempting reconnection on left...\n");
            startScan();
        }
    }

    public void reconnectRight() {
        if (mConnectedRight) {
            Log.d(TAG,"right already connected!!!\n");
            disconnectRight();
            Log.d(TAG,"attempting reconnection on right...\n");
            startScan();
        } else {
            Log.d(TAG,"attempting reconnection on right...\n");
            startScan();
        }
    }

    public void disconnectLeft() {
        mConnectedLeft = false;
        if (mGattLeft != null) {
            mGattLeft.disconnect();
            mGattLeft.close();
        }
        asyncTask.statusChange(2);
    }

    public void disconnectRight() {
        mConnectedRight = false;
        if (mGattRight != null) {
            mGattRight.disconnect();
            mGattRight.close();
        }
        asyncTask.statusChange(4);
    }

    private void stopScan() {
        if (mScanning && mBluetoothAdapter != null && mBluetoothAdapter.isEnabled() && mBluetoothLeScanner != null) {
            mBluetoothLeScanner.stopScan(mScanCallback);
            scanComplete();
        }

        mScanCallback = null;
        mScanning = false;
        mHandler = null;
    }

    private void scanComplete() {
        if (mScanResults.isEmpty()) {
            return;
        }
        for (String deviceAddress : mScanResults.keySet()) {
            Log.d(TAG, "Found device: " + deviceAddress);
            Log.d(TAG,"Found device: " + deviceAddress + "\n");
        }
    }

    private class BtleScanCallback extends ScanCallback {

        public BtleScanCallback() {

        }

        @Override
        public void onScanResult(int callbackType, ScanResult result) {
            addScanResult(result);
        }

        @Override
        public void onBatchScanResults(List<ScanResult> results) {
            for (ScanResult result : results) {
                addScanResult(result);
            }
        }
        @Override
        public void onScanFailed(int errorCode) {
            Log.e(TAG, "BLE Scan Failed with code " + errorCode);
        }

        private void addScanResult(ScanResult result) {
            //Nur deaktivieren falls nur ein mögliches ergebnis
            //completed: connect to more than one device!

            if (mScanResults.size() >= 2) {

                stopScan();

            } else if (result.getDevice().getAddress().equals(left)){

                BluetoothDevice device = result.getDevice();
                String deviceAddress = device.getAddress();

                mScanResults.put(deviceAddress, device);
                connectLeftDevice(device);

            } else if (result.getDevice().getAddress().equals(right)){

                BluetoothDevice device = result.getDevice();
                String deviceAddress = device.getAddress();

                mScanResults.put(deviceAddress, device);
                connectRightDevice(device);
            }

        }
    };

    private void connectLeftDevice(BluetoothDevice device) {
        GattClientCallbackLeft gattClientCallback = new GattClientCallbackLeft();
        mGattLeft = device.connectGatt(this, false, gattClientCallback);
    }

    private void connectRightDevice(BluetoothDevice device) {
        GattClientCallbackRight gattClientCallback = new GattClientCallbackRight();
        mGattRight = device.connectGatt(this, false, gattClientCallback);
    }

    private class GattClientCallbackLeft extends BluetoothGattCallback {
        @Override
        public void onConnectionStateChange(BluetoothGatt gatt, int status, int newState) {
            super.onConnectionStateChange(gatt, status, newState);
            if (status == BluetoothGatt.GATT_FAILURE) {
                disconnectLeftGattServer();
                Log.d(TAG,"disconnected left! - Gatt failure\n");
                asyncTask.statusChange(2);
                return;
            } else if (status != BluetoothGatt.GATT_SUCCESS) {
                disconnectLeftGattServer();
                Log.d(TAG,"disconnected left! - Unsuccessfull binding " + status + "\n");
                asyncTask.statusChange(2);
                reconnectLeft();
                return;
            }
            if (newState == BluetoothProfile.STATE_CONNECTED) {
                mConnectedLeft = true;
                gatt.discoverServices();


                asyncTask.statusChange(1);

            } else if (newState == BluetoothProfile.STATE_DISCONNECTED) {
                disconnectLeftGattServer();
                Log.d(TAG,"disconnected left! - regular disconnect\n");
                asyncTask.statusChange(2);
            }
        }

        public void disconnectLeftGattServer() {
            mConnectedLeft = false;
            if (mGattLeft != null) {
                mGattLeft.disconnect();
                mGattLeft.close();
            }
        }

        public void onServicesDiscovered(BluetoothGatt gatt, int status) {
            super.onServicesDiscovered(gatt, status);
            if (status != BluetoothGatt.GATT_SUCCESS) {
                return;
            }

            final BluetoothGatt mgatt = gatt;

            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override
                public void run() {
                    Log.d(TAG,"discovered services left!\n");
                    BluetoothGattService service = mGattLeft.getService(SERVICE_TURN_UUID);
                    characteristicLeft = service.getCharacteristic(CHARACTERISTIC_TURN_UUID);
                    characteristicLeft.setWriteType(BluetoothGattCharacteristic.WRITE_TYPE_DEFAULT);
                    mInitializedLeft = mGattLeft.setCharacteristicNotification(characteristicLeft, true);
                    Log.d(TAG,"LEFT DEVICE READY!\n");
                }
            }, 500);

            if (mInitializedLeft) {
                //sendMessage("A");
            }
        }

        public void onCharacteristicChanged(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic) {
            super.onCharacteristicChanged(gatt, characteristic);

            byte[] messageBytes = characteristic.getValue();
            String messageString = null;
            try {
                messageString = new String(messageBytes, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                Log.e(TAG, "Unable to convert message bytes to string");
            }
            Log.d(TAG,"Received message left: " +  messageString);

            messageString = messageString.substring(0, messageString.length() - 2);
            long i = Long.parseLong(messageString);
            long front = i / 10000;
            long heel = i - (front * 10000);

            dataStorage.storePressuredata(heel, front, heelR,front1R);
            updatePressureBar((int) (front + front1R));
        }
    }

    private class GattClientCallbackRight extends BluetoothGattCallback {
        @Override
        public void onConnectionStateChange(BluetoothGatt gatt, int status, int newState) {
            super.onConnectionStateChange(gatt, status, newState);
            if (status == BluetoothGatt.GATT_FAILURE) {
                disconnectRightGattServer();
                Log.d(TAG,"disconnected right! - Gatt failure\n");
                asyncTask.statusChange(4);
                return;
            } else if (status != BluetoothGatt.GATT_SUCCESS) {
                disconnectRightGattServer();
                Log.d(TAG,"disconnected right! - Unsuccessfull binding " + status + "\n");
                asyncTask.statusChange(4);
                reconnectRight();
                return;
            }
            if (newState == BluetoothProfile.STATE_CONNECTED) {
                mConnectedRight = true;
                gatt.discoverServices();
                asyncTask.statusChange(3);

            } else if (newState == BluetoothProfile.STATE_DISCONNECTED) {
                disconnectRightGattServer();
                Log.d(TAG,"disconnected right! - regular disconnect\n");
                asyncTask.statusChange(4);
            }
        }

        public void disconnectRightGattServer() {
            mConnectedRight = false;
            if (mGattRight != null) {
                mGattRight.disconnect();
                mGattRight.close();
            }
        }

        public void onServicesDiscovered(BluetoothGatt gatt, int status) {
            super.onServicesDiscovered(gatt, status);
            if (status != BluetoothGatt.GATT_SUCCESS) {
                return;
            }

            final BluetoothGatt mgatt = gatt;

            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override
                public void run() {
                    Log.d(TAG,"discovered services on right!\n");
                    BluetoothGattService service = mGattRight.getService(SERVICE_TURN_UUID);
                    characteristicRight = service.getCharacteristic(CHARACTERISTIC_TURN_UUID);
                    characteristicRight.setWriteType(BluetoothGattCharacteristic.WRITE_TYPE_DEFAULT);
                    mInitializedRight = mGattRight.setCharacteristicNotification(characteristicRight, true);
                    Log.d(TAG,"RIGHT DEVICE READY!\n");
                }
            }, 500);

            if (mInitializedRight) {
                //sendMessage("A");
            }
        }

        public void onCharacteristicChanged(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic) {
            super.onCharacteristicChanged(gatt, characteristic);

            //todo: preprocess right pressure data

            byte[] messageBytes = characteristic.getValue();
            String messageString = "";
            try {
                messageString = new String(messageBytes, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                Log.e(TAG, "Unable to convert message bytes to string");
            }
            Log.d(TAG,"Received message right: " +  messageString);

            messageString = messageString.substring(0, messageString.length() - 2);
            long i = Long.parseLong(messageString);
            front1R = i / 10000;
            heelR = i - (front1R * 10000);
            //dataStorage.storePressuredata(i,i,i,i,i,i);
            updatePressureBar((int) (front1R));
        }
    }

    public void sendMessageLeft(String message) {
        if (!mConnectedLeft || !mInitializedLeft) {
            return;
        }

        byte[] messageBytes = new byte[0];
        try {
            messageBytes = message.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            Log.e(TAG, "Failed to convert message string to byte array");
        }
        characteristicLeft.setValue(messageBytes);
        boolean success = mGattLeft.writeCharacteristic(characteristicLeft);
        Log.d(TAG,"sent to left: " + message + "\n");
    }

    public void sendMessageRight(String message) {
        if (!mConnectedRight || !mInitializedRight) {
            return;
        }

        byte[] messageBytes = new byte[0];
        try {
            messageBytes = message.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            Log.e(TAG, "Failed to convert message string to byte array");
        }
        characteristicRight.setValue(messageBytes);
        boolean success = mGattRight.writeCharacteristic(characteristicRight);
        Log.d(TAG,"sent to right: " + message + "\n");
    }

    public void updateDataStorage(DataStorage ds) {
        dataStorage = ds;
    }

    public void updatePressureBar(int front){
        asyncTask.updatePressureBar(Integer.toString(front));
    }


}
