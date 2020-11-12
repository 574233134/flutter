package com.lmk.batteryLevel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.app.FlutterActivity;

import android.os.Bundle;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService;

public class MainActivity extends FlutterActivity {
     @Override
     protected void onCreate(Bundle savedInstanceState) {
         super.onCreate(savedInstanceState);
         FlutterFirebaseMessagingService.setPluginRegistrant(this);
         registerCustomPlugin(this);
     }

    @Override
    public void registerWith(PluginRegistry registry) {
        FirebaseMessagingPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"));
    }

     private void registerCustomPlugin(PluginRegistry registrar) {
         FlutterNativePlugin.registerWith(registrar.registrarFor(FlutterNativePlugin.CHANNEL));
     }
}
