package com.turnskiing.tcturn;

import android.app.Activity;
import android.content.Context;
import android.os.Environment;
import java.io.File;
import java.io.FileWriter;
import java.util.List;
import java.util.Random;

public class DataExport extends Activity {

    File file;
    String filename;
    FileWriter fileWriter;
    Context context;

    public DataExport (String filename, Context context) {
        this.filename = filename;
        this.context = context;
    }

    public String exportData(DataStorage dataStorage) {
        try {
            if (isExternalStorageWritable()) {
                Random random = new Random();
                int r = random.nextInt();

                file = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), filename + r + ".csv");
                while (file.exists()) {
                    r = random.nextInt();
                    file = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), filename + r + ".csv");
                }
                file.createNewFile();
                fileWriter =  new FileWriter(file);
                fileWriter.write(getDataString(dataStorage));
                fileWriter.close();
            }

            return file.getAbsolutePath();

        } catch (Exception e) {
            return e.toString();
        }
    }


    public boolean isExternalStorageWritable() {
        String state = Environment.getExternalStorageState();
        if (Environment.MEDIA_MOUNTED.equals(state)) {
            return true;
        }
        return false;
    }



    public String getDataString (DataStorage dataStorage) {

        List<DataPoint> dataPoints = dataStorage.getDataPoints();
        String output = new String();

        output += "Time,GyroX,GyroY,GyroZ,Accelerometer,HeelLeft,FrontLeft,HeelRight,FrontRight\n";

        for (int i = 0; i < dataPoints.size(); i++){
            output += dataPoints.get(i).toString();
        }

        return output;
    }



}
