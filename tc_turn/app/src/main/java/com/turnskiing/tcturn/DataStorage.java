package com.turnskiing.tcturn;

import android.app.Activity;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;


import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

public class DataStorage implements Serializable {

    private List<DataPoint> dataPoints;

    float gyroX;
    float gyroY;
    float gyroZ;

    float accel;

    long timestamp;

    private SensorManager sensorManager;
    private Sensor sensor;
    private GyroListener gyroListener;
    private AccelListener accelListener;

    //todo: store accelerometer data

    public DataStorage (SensorManager sensorManager, Sensor gyro, Sensor acceleromter) {
        this.sensorManager = sensorManager;
        this.sensor = gyro;

        dataPoints = new LinkedList<>();
        gyroListener = new GyroListener();
        accelListener = new AccelListener();
        sensorManager.registerListener(gyroListener, gyro, SensorManager.SENSOR_DELAY_GAME);
        sensorManager.registerListener(accelListener, acceleromter, SensorManager.SENSOR_DELAY_GAME);
    }

    public void stop() {
        sensorManager.unregisterListener(gyroListener);
        sensorManager.unregisterListener(accelListener);
    }

    public void storePressuredata(long heelSensorLeft, long frontSensorLeft1,
                                  long heelSensorRight, long frontSensorRight1)
    {
        dataPoints.add(new DataPoint(gyroX,gyroY,gyroZ, accel, heelSensorLeft, frontSensorLeft1, heelSensorRight, frontSensorRight1));
    }


    private class GyroListener implements SensorEventListener {

        @Override
        public void onAccuracyChanged(Sensor sensor, int accuracy) {

        }

        @Override
        public void onSensorChanged(SensorEvent event) {
            gyroX = event.values[0];
            gyroY = event.values[1];
            gyroZ = event.values[2];

            //todo: compare this timestamp to the storage timestamp!
            timestamp = event.timestamp;

            //todo: maybe preprocess this data somehow? https://developer.android.com/guide/topics/sensors/sensors_motion
        }
    }

    private class AccelListener implements SensorEventListener {

        @Override
        public void onAccuracyChanged(Sensor sensor, int accuracy) {

        }

        @Override
        public void onSensorChanged(SensorEvent event) {
            accel = event.values[0];


            //todo: maybe preprocess this data somehow? https://developer.android.com/guide/topics/sensors/sensors_motion
        }
    }


    public List<DataPoint> getDataPoints() {
        return dataPoints;
    }

    public RunData getRunData() {
        float[][] out = new float[dataPoints.size()][8];

        for (int i = 0; i < dataPoints.size(); i++){
            out[i] = dataPoints.get(i).toArray();
        }

        return new RunData(out);
    }
}
