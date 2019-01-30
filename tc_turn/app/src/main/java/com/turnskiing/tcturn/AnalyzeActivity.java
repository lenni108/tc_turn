package com.turnskiing.tcturn;

import android.content.res.AssetManager;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class AnalyzeActivity extends AppCompatActivity {

    private static final String TAG = AnalyzeActivity.class.getSimpleName();

    private AssetManager mgr;
    private RunData input;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_analyze);

        mgr = getResources().getAssets();

        input = (RunData) getIntent().getSerializableExtra("inputData");

        log((int) analyze());

//        findViewById(R.id.btn_analyze).setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//
//            }
//        });
    }

    private float analyze() {
        float[][] inputData = input.getData(); //input.getSampleBad();
        int nrDataSets = inputData.length;
        float acc = 0;

        float[] prediction;

        TurnNeuralNetwork.load(mgr);

        for (int i = 0; i < inputData.length; i++) {
            if (inputData[i].length < 8) {
                nrDataSets--;
                continue;
            }

            prediction = TurnNeuralNetwork.predict(inputData[i]);
            acc += prediction[0];
        }

        float out = acc/nrDataSets;

        if (out > 1) out = 1;
        if (out < 0) out = 0;

        return (1 - out) * 100;
    }

    private void log(int i) {
        TextView tv = findViewById(R.id.tv_pressure_precent);
        RelativeLayout.LayoutParams rl = (RelativeLayout.LayoutParams) tv.getLayoutParams();
        rl.setMargins((i * 9) + 60, 90, 0, 0);

    }

}
