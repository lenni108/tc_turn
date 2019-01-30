package com.turnskiing.tcturn;

import android.content.Intent;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class LandingPageActivity extends AppCompatActivity {

    boolean connected;
    BLEConnection bleConnection;

    static final int BLE_CONNECT_REQUEST_CODE = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_landing_page);


        findViewById(R.id.btn_skier).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(LandingPageActivity.this, ConnectActivity.class);
                startActivity(intent);
            }
        });
    }

}
