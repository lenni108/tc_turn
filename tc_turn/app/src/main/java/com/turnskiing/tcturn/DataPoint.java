package com.turnskiing.tcturn;

import android.util.TimeUtils;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class DataPoint  {

    long timestamp;

    float gyrodataX;
    float gyrodataY;
    float gyrodataZ;

    long heelSensorLeft;
    long frontSensorLeft1;

    long heelSensorRight;
    long frontSensorRight1;

    float accel;

    public DataPoint (float gyrodataX, float gyrodataY, float gyrodataZ, float accel, long heelSensorLeft,
                      long frontSensorLeft1, long heelSensorRight,
                      long frontSensorRight1)
    {

        this.gyrodataX = gyrodataX;
        this.gyrodataY = gyrodataY;
        this.gyrodataZ = gyrodataZ;

        this.heelSensorLeft = heelSensorLeft;
        this.frontSensorLeft1 = frontSensorLeft1;

        this.heelSensorRight = heelSensorRight;
        this.frontSensorRight1 = frontSensorRight1;

        this.accel = accel;

        timestamp = Calendar.getInstance().getTime().getTime();

    }

    @Override
    public String toString() {
        return timestamp + "," + gyrodataX + "," + gyrodataY + "," + gyrodataZ + "," + accel + "," +
                + heelSensorLeft + "," + frontSensorLeft1 + "," + heelSensorRight
                + "," + frontSensorRight1 + "\n";
    }

    public float[] toArray () {
        float[] out = {gyrodataX,gyrodataY,gyrodataZ,accel,heelSensorLeft,frontSensorLeft1,heelSensorRight,frontSensorRight1};
        return out;
    }
}
