package com.turnskiing.tcturn;

import android.content.res.AssetManager;
import android.util.Log;


public class TurnNeuralNetwork {


    /**** user load model manager sync interfaces ****/
    public static int load(AssetManager mgr){
            return ModelManager.loadModelSync("FrozentensorflowModel", mgr);
    }

    public static float[] predict(float[] buf){
        return ModelManager.runModelSync("FrozentensorflowModel",buf);
    }

    public static int unload(){
        return ModelManager.unloadModelSync();
    }


    /**** load user model async interfaces ****/
    public static int registerListenerJNI(ModelManagerListener listener){
        return ModelManager.registerListenerJNI(listener);
    }

    public static void loadAsync(AssetManager mgr){
        ModelManager.loadModelAsync("FrozentensorflowModel", mgr);
    }

    public static void predictAsync(float[] buf) {
        ModelManager.runModelAsync("FrozentensorflowModel",buf);
    }

    public static void unloadAsync(){
        ModelManager.unloadModelAsync();
    }
}
