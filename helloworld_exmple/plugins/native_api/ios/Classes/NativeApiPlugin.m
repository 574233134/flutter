#import "NativeApiPlugin.h"

@implementation NativeApiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"native_api"
            binaryMessenger:[registrar messenger]];
  NativeApiPlugin* instance = [[NativeApiPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"countOfString" isEqualToString:call.method]) {
      NSString *urlParam = call.arguments;
      result(@"字符串长度为 3");
  }else {
    result(FlutterMethodNotImplemented);
  }
}

@end
