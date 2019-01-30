package com.turnskiing.tcturn;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.ArrayList;

import static android.webkit.ConsoleMessage.MessageLevel.LOG;

public class ConnectionTestActivitydebrecated extends AppCompatActivity {

    private static final String TAG = "ConnectionTest: ";

    private Button btn_start_recording;

    private DataStorage currentDataStorage;

    private boolean recordingStarted = false;
    private boolean recPaused = false;
    private boolean connected;

    private SensorManager sensorManager;
    private Sensor gyro;
    private Sensor accel;

    private BLEConnection bleConnection;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_connection_test);

        Intent intent = getIntent();

        connected = (boolean) intent.getBooleanExtra("connected", false);

        sensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        gyro = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        accel = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        currentDataStorage = new DataStorage(sensorManager, gyro, accel);



        btn_start_recording = (Button) findViewById(R.id.btn_start_recording);
        btn_start_recording.setOnClickListener(new View.OnClickListener() {
            public void onClick (View v) {
                if (!connected) {
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
                } else if (recordingStarted && !recPaused) {
                    stopRecording();
                    recPaused = true;
                    btn_start_recording.setText("Record new Run");
                    Log.d(TAG, "stop recording\n");
                } else {
                    startRecording();
                    btn_start_recording.setText("Stop Recording");
                    Log.d(TAG, "start recording\n");
                }
            }
        });


    }

    private void startRecording () {
        //btn_start_recording.setText("Next Run");
        if (!connected) return;

        bleConnection.sendMessageRight("A");
        bleConnection.sendMessageLeft("A");
        recordingStarted = true;

        //recordingStarted = bleConnection.startScan();
    }

    private void stopRecording () {
        bleConnection.sendMessageLeft("B");
        bleConnection.sendMessageRight("B");
    }


}
