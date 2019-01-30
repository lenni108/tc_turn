package com.turnskiing.tcturn;

import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.media.Image;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.*;

import org.w3c.dom.Text;

import java.util.ArrayList;

import static android.view.View.GONE;
import static android.view.View.VISIBLE;

@RequiresApi(api = Build.VERSION_CODES.M)
public class ConnectActivity extends AppCompatActivity {

    private static final String TAG = "APP: ";
    private static final int BLUETOOTH_PERMISSION = 2;
    private static final int STORAGE_PERMISSION = 1;

    private Button btn_start_recording;
    private Button btn_export_data;
    private EditText input_export_filename;
    private TextView tv_log;
    private Button btn_analyze;
    private ImageView iv_analyze;
    private TextView tv_pressure_bar;

    private DataStorage currentDataStorage;
    private ArrayList<DataStorage> allData;
    private boolean recordingStarted = false;
    private boolean recPaused = false;
    private boolean connectedLeft = false;
    private boolean connectedRight = false;
    private DataExport dataExport;
    private BluetoothAdapter bluetoothAdapter;
    private BluetoothManager bluetoothManager;
    private BLEConnection bleConnection;
    private SensorManager sensorManager;
    private Sensor gyro;
    private Sensor accel;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_connection_test);
        allData = new ArrayList<>();
        sensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        gyro = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        accel = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        currentDataStorage = new DataStorage(sensorManager, gyro, accel);

        btn_analyze = (Button) findViewById(R.id.btn_start_analyze);
        iv_analyze = (ImageView) findViewById(R.id.iv_analyze);
        tv_pressure_bar = (TextView) findViewById(R.id.tv_pressure_test);

        btn_start_recording = (Button) findViewById(R.id.btn_start_recording);
        btn_start_recording.setOnClickListener(new View.OnClickListener() {
            public void onClick (View v) {
                if (!connectedRight || !connectedLeft) {
                    Log.d(TAG,"NOT CONNECTED!!!\n");
                    return;
                }

                if (recordingStarted && recPaused) {
                    currentDataStorage.stop();
                    currentDataStorage = new DataStorage(sensorManager, gyro, accel);
                    bleConnection.updateDataStorage(currentDataStorage);
                    bleConnection.sendMessageLeft("A");
                    bleConnection.sendMessageRight("A");
                    btn_start_recording.setText("Stop Recording");
                    Log.d(TAG,"start recording new run\n");
                    recPaused = false;
                    btn_analyze.setVisibility(GONE);
                    iv_analyze.setVisibility(GONE);

                } else if (recordingStarted && !recPaused) {
                    stopRecording();
                    recPaused = true;
                    btn_start_recording.setText("Record new Run");
                    Log.d(TAG,"stop recording\n");
                    btn_analyze.setVisibility(VISIBLE);
                    iv_analyze.setVisibility(VISIBLE);
                } else {
                    startRecording();
                    btn_start_recording.setText("Stop Recording");
                    Log.d(TAG,"start recording\n");
                    btn_analyze.setVisibility(GONE);
                    iv_analyze.setVisibility(GONE);
                }
            }
        });

//        btn_export_data = (Button) findViewById(R.id.btn_export_data);
//        btn_export_data.setOnClickListener(new View.OnClickListener() {
//            public void onClick (View v) {
//                //stopRecording();
//                EditText et = (EditText) findViewById(R.id.et_filename);
//                exportLastRunData("TURN-" + et.getText());
//            }
//        });

        findViewById(R.id.btn_reconnectL).setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View v) {
                 bleConnection.reconnectLeft();
                 connectedLeft = true;
                 Log.d(TAG,"start reconnection left\n");
             }
         });

//        findViewById(R.id.btn_disconnect).setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                bleConnection.disconnectLeft();
//                connectedLeft = false;
//                tv_log.setText("disconnection left successfull\n" + tv_log.getText());
//                bleConnection.disconnectRight();
//                connectedRight = false;
//                tv_log.setText("right disconnection successfull\n" + tv_log.getText());
//            }
//        });

        findViewById(R.id.btn_connect).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                connectLeft();
                connectRight();
                Log.d(TAG,"initiate right conncetion\n");
                Log.d(TAG,"initiate left conncetion\n");
            }
        });

        findViewById(R.id.btn_reconnectR).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                bleConnection.reconnectRight();
                connectedRight = true;
                Log.d(TAG,"start reconnection on right\n");
            }
        });

        findViewById(R.id.btn_start_analyze).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                analyze();
            }
        });

        Log.d(TAG,"initialized!\n");
    }

    @Override
    protected void onResume() {
        super.onResume();

        btn_start_recording = (Button) findViewById(R.id.btn_start_recording);
        btn_start_recording.setOnClickListener(new View.OnClickListener() {
            public void onClick (View v) {
                if (!connectedRight || !connectedLeft) {
                    Log.d(TAG,"NOT CONNECTED!!!\n");
                    return;
                }
                //todo: include support for right device
                if (recordingStarted && recPaused) {
                    currentDataStorage.stop();
                    currentDataStorage = new DataStorage(sensorManager, gyro, accel);
                    bleConnection.updateDataStorage(currentDataStorage);
                    bleConnection.sendMessageLeft("A");
                    bleConnection.sendMessageRight("A");
                    btn_start_recording.setText("Stop Recording");
                    Log.d(TAG,"start recording new run\n");
                    recPaused = false;
                    btn_analyze.setVisibility(GONE);
                    iv_analyze.setVisibility(GONE);
                } else if (recordingStarted && !recPaused) {
                    stopRecording();
                    recPaused = true;
                    btn_start_recording.setText("Record new Run");
                    Log.d(TAG,"stop recording\n");
                    btn_analyze.setVisibility(VISIBLE);
                    iv_analyze.setVisibility(VISIBLE);
                } else {
                    startRecording();
                    btn_start_recording.setText("Stop Recording");
                    Log.d(TAG,"start recording\n");
                    btn_analyze.setVisibility(GONE);
                    iv_analyze.setVisibility(GONE);
                }
            }
        });

//        btn_export_data = (Button) findViewById(R.id.btn_export_data);
//        btn_export_data.setOnClickListener(new View.OnClickListener() {
//            public void onClick (View v) {
//                //stopRecording();
//                EditText et = (EditText) findViewById(R.id.et_filename);
//                exportLastRunData("TURN-" + et.getText());
//            }
//        });

        findViewById(R.id.btn_reconnectL).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                bleConnection.reconnectLeft();
                connectedLeft = true;
                Log.d(TAG,"start reconnection left\n");
            }
        });

//        findViewById(R.id.btn_disconnect).setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                bleConnection.disconnectLeft();
//                connectedLeft = false;
//                tv_log.setText("disconnection left successfull\n" + tv_log.getText());
//                bleConnection.disconnectRight();
//                connectedRight = false;
//                tv_log.setText("right disconnection successfull\n" + tv_log.getText());
//            }
//        });

        findViewById(R.id.btn_connect).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                connectLeft();
                connectRight();
                Log.d(TAG,"initiate right conncetion\n");
                Log.d(TAG,"initiate left conncetion\n");
            }
        });

        findViewById(R.id.btn_reconnectR).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                bleConnection.reconnectRight();
                connectedRight = true;
                Log.d(TAG,"start reconnection on right\n");
            }
        });


        tv_log = (TextView) findViewById(R.id.tv_log);
    }

    private void analyze() {
        Intent intent = new Intent(ConnectActivity.this, AnalyzeActivity.class);
        //RunData i = new RunData(new float[1][7]);
        RunData i = currentDataStorage.getRunData();
        intent.putExtra("inputData", i);
        startActivity(intent);
    }

    private void startRecording () {
        //btn_start_recording.setText("Next Run");
        if (!connectedRight || !connectedLeft) return;

        bleConnection.sendMessageRight("A");
        bleConnection.sendMessageLeft("A");
        recordingStarted = true;

        //recordingStarted = bleConnection.startScan();
    }

    private void connectLeft () {
        //currentDataStorage = new DataStorage(sensorManager, gyro, accel);

        if (connectedLeft) {return;}

        // check if device is a bluetooth device
        if (!getPackageManager().hasSystemFeature(PackageManager.FEATURE_BLUETOOTH_LE)) {
            Log.d(TAG,"not a bluetooth device");
            finish();
        }

        Log.d(TAG,"bluetooth available\n");
        Log.d(TAG,"start recording\n");

        // get bluetooth permission at runtime
        grantBLEPermission();

        bluetoothManager = (BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
        bluetoothAdapter = bluetoothManager.getAdapter();

        // check if permissions have been granted
        if (!hasPermissions() || recordingStarted) {
            return;
        }

        if (!connectedRight) {
            BleThreadAsync asyncTask = new BleThreadAsync();
            bleConnection = new BLEConnection(tv_log, (ImageView) findViewById(R.id.img_boot_connetced), (TextView) findViewById(R.id.tv_pressure_test), bluetoothManager, bluetoothAdapter, currentDataStorage, asyncTask);
            asyncTask.execute(bleConnection);
        }

        connectedLeft = true;
    }

    private void connectRight () {
        //currentDataStorage = new DataStorage(sensorManager, gyro, accel);

        if (connectedRight) {return;}

        // check if device is a bluetooth device
        if (!getPackageManager().hasSystemFeature(PackageManager.FEATURE_BLUETOOTH_LE)) {
            Log.d(TAG,"not a bluetooth device");
            finish();
        }

        Log.d(TAG,"bluetooth available\n");
        Log.d(TAG,"start recording\n");

        // get bluetooth permission at runtime
        grantBLEPermission();

        bluetoothManager = (BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
        bluetoothAdapter = bluetoothManager.getAdapter();

        // check if permissions have been granted
        if (!hasPermissions() || recordingStarted) {
            return;
        }

        if (!connectedLeft) {
            BleThreadAsync asyncTask = new BleThreadAsync();
            bleConnection = new BLEConnection(tv_log, (ImageView) findViewById(R.id.img_boot_connetced), (TextView) findViewById(R.id.tv_pressure_test), bluetoothManager, bluetoothAdapter, currentDataStorage, asyncTask);
            asyncTask.execute(bleConnection);
        }

        connectedRight = true;
    }

    private void stopRecording () {
        //todo: support right device
        allData.add(currentDataStorage);

        bleConnection.sendMessageLeft("B");
        bleConnection.sendMessageRight("B");
        //bleConnection.disconnect();
    }

    private void exportAllData (String filename) {

        Log.d(TAG,"export data to file: " + filename + "\n");

        dataExport = new DataExport(filename, this);
        grantWritePermission();
        dataExport.exportData(currentDataStorage);

    }

    private void exportLastRunData (String filename) {
        if (currentDataStorage == null) {
            Log.d(TAG,"NOTING RECORDED!\n");
            return;
        }


        Log.d(TAG,"export data to file: " + filename + "\n");

        dataExport = new DataExport(filename, this);
        grantWritePermission();
        dataExport.exportData(currentDataStorage);

    }

    private void grantWritePermission () {
        // Check whether this app has write external storage permission or not.
        int writeExternalStoragePermission = ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE);
        // If do not grant write external storage permission.
        if (writeExternalStoragePermission != PackageManager.PERMISSION_GRANTED) {
            // Request user to grant write external storage permission.
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, STORAGE_PERMISSION);
            Log.d(TAG, "Write Permission requested\n");
        } else {
            Log.d(TAG,"Write Permission granted!\n");
            Log.d(TAG,dataExport.exportData(currentDataStorage) + "\n");
        }
    }

    private void grantBLEPermission () {
        // Check whether this app has write external storage permission or not.
        int blePermission = ContextCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_ADMIN);
        // If do not grant write external storage permission.
        if (blePermission != PackageManager.PERMISSION_GRANTED) {
            // Request user to grant write external storage permission.
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.BLUETOOTH_ADMIN}, BLUETOOTH_PERMISSION);
            Log.d(TAG,"BLE Permission requested\n");
        } else {
            Log.d(TAG,"BLE Permission granted!\n");
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {
        Log.d(TAG,"Permission result received\n");
        switch (requestCode) {
            case STORAGE_PERMISSION: {
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // permission was granted, yay! Do the
                    // contacts-related task you need to do.
                    Log.d(TAG,"Permission granted!\n");
                    Log.d(TAG,dataExport.exportData(currentDataStorage) + "\n");
                } else {
                    // permission denied, boo! Disable the
                    // functionality that depends on this permission.
                    Log.d(TAG,"Permission denied!\n");
                }
                return;
            }
            case BLUETOOTH_PERMISSION: {
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // permission was granted, yay! Do the
                    // contacts-related task you need to do.
                    Log.d(TAG,"Permission granted!\n");

                } else {
                    // permission denied, boo! Disable the
                    // functionality that depends on this permission.
                    Log.d(TAG,"Permission denied!\n");
                }
                return;
            }

            // other 'case' lines to check for other
            // permissions this app might request.
        }
    }

    private boolean hasPermissions() {
        if (bluetoothAdapter == null || !bluetoothAdapter.isEnabled()) {
            requestBluetoothEnable();
            return false;
        } else if (!hasLocationPermissions()) {
            requestLocationPermission();
            return false;
        }
        return true;
    }

    private void requestBluetoothEnable() {
        Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
        startActivityForResult(enableBtIntent, 0);
        Log.d(TAG, "Requested user enables Bluetooth. Try starting the scan again.");
    }

    private boolean hasLocationPermissions() {
        return checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED;
    }

    private void requestLocationPermission() {
        requestPermissions(new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 0);
    }

}
