//
//  BaseNativeFlutterPlugin.m
//  Runner
//
//  Created by 李梦珂 on 2020/10/28.
//

#import "BaseNativeFlutterPlugin.h"
# define ITEM_SERVICE_BASE @"itms-services://?action=download-manifest&url="
@implementation BaseNativeFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
 FlutterMethodChannel* channel =
 [FlutterMethodChannel methodChannelWithName:@"com.emopapp/install"
        binaryMessenger:[registrar messenger]];
 BaseNativeFlutterPlugin* instance = [[BaseNativeFlutterPlugin alloc] init];
 [registrar addMethodCallDelegate:instance channel:channel];
}
 
- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
 if ([@"installApp" isEqualToString:call.method]) {
     NSString *urlParam = call.arguments;
     if(urlParam&&urlParam.length>0){
     NSURL *installUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ITEM_SERVICE_BASE,urlParam]];
     if (NSClassFromString(@"UIGraphicsRenderer") && [[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
         // >= iOS10.0
         if (@available(iOS 10.0, *)) {
             [[UIApplication sharedApplication] openURL:installUrl options:@{} completionHandler:^(BOOL success){
             }];
         }
     } else {
         [[UIApplication sharedApplication] openURL:installUrl];
     }
     }
     else{
         result(FlutterMethodNotImplemented);
     }
 }
}
@end
