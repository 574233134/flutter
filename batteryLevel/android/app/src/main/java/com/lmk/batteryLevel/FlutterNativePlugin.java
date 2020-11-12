package com.lmk.batteryLevel;

import io.flutter.plugin.common.MethodChannel;
import android.app.Activity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.MethodCall;
public class FlutterNativePlugin implements MethodChannel.MethodCallHandler {
    public static String CHANNEL = "com.test/name";  // 分析1

    static MethodChannel channel;

    private Activity activity;

    private FlutterNativePlugin(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        FlutterNativePlugin instance = new FlutterNativePlugin(registrar.activity());
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall,  MethodChannel.Result result) {  // 分析 2
        if (methodCall.method.equals("isChinese")) {
            boolean isChinese = true;
            result.success(isChinese);  // 分析3
        }
        else {
            result.notImplemented();
        }
    }
}
