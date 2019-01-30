package com.turnskiing.tcturn;

import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Build;
import android.support.annotation.RequiresApi;
import android.util.Log;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

@RequiresApi(api = Build.VERSION_CODES.M)

public class BleThreadAsync extends AsyncTask<BLEConnection, String, Void> {
    private final String TAG = "ASYNC_BLE";

    BLEConnection bleConnection;

    boolean connectedL = false;
    boolean connectedR = false;

    boolean test = false;

    @Override
    protected Void doInBackground(BLEConnection... bleConnections) {
        this.bleConnection = bleConnections[0];
        if (bleConnections.length <= 1) {
            bleConnections[0].startScan();
        }
        return null;
    }

    @Override
    protected void onProgressUpdate(String... values) {

        if (values[0].equals("connectedL")) {
            connectedL = true;
        } else if (values[0].equals("disconnectedL")) {
            connectedL = false;
        } else if (values[0].equals("connectedR")) {
            connectedR = true;
        } else if (values[0].equals("disconnectedR")) {
            connectedR = false;
        } else {

            int i = Integer.parseInt(values[0]);
//            RelativeLayout.LayoutParams rl = (RelativeLayout.LayoutParams) bleConnection.tv_pressure_bar.getLayoutParams();
//            rl.setMargins((i/100) * 9 + 100, 730, 0, 0);
            String hex = "00";

            if (i * 0.3 <= 15) {
                hex = Integer.toHexString((int)(i * 0.3)) + "0";
                bleConnection.tv_pressure_bar.setText("       Move Forward");
            } else if (i * 0.3 < 255) {
                hex = Integer.toHexString((int)(i * 0.3));
                if (i * 0.3 < 180) {
                    bleConnection.tv_pressure_bar.setText("         Further");
                } else {
                    bleConnection.tv_pressure_bar.setText("         Perfect!");
                }

            } else {
                hex = Integer.toHexString(255);
            }


            String s = "#" + hex + "0000";

            if (s.length() < 7) {
                s = "#000000";
            }

            //Log.d(TAG,s);

            bleConnection.tv_pressure_bar.setBackgroundColor(Color.parseColor(s));



            //bleConnection.tv_pressure_bar.setText(values[0]);
            Log.d(TAG, "received" + i + "\n");
        }

        if (connectedR && connectedL) {
            bleConnection.boot_connected.setVisibility(ImageView.VISIBLE);
        } else {
            bleConnection.boot_connected.setVisibility(ImageView.GONE);
        }
    }

    public void updateView(String message) {
        //publishProgress(message);
    }

    public void statusChange(int status) {
        if (status == 1) {
            publishProgress("connectedL");
        } else if (status == 2) {
            publishProgress("disconnectedL");
        } else if (status == 3) {
            publishProgress("connectedR");
        } else if (status == 4) {
            publishProgress("disconnectedR");
        }
    }

    public void updatePressureBar(String k) {
        publishProgress(k);
    }
}