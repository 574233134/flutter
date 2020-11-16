//
//  SayHello.m
//  Runner
//
//  Created by 李梦珂 on 2020/11/15.
//

#import "SayHello.h"
#import <objc/runtime.h>

@implementation SayHello

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"hello"
            binaryMessenger:[registrar messenger]];
  SayHello* instance = [[SayHello alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"hello" isEqualToString:call.method]) {
      NSString *sayhello = [NSString stringWithFormat:@"hello:%@",call.arguments];
       result(sayhello);
  }else {
    result(FlutterMethodNotImplemented);
  }
}
@end
