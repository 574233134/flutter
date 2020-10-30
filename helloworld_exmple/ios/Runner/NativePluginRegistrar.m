//
//  NativePluginRegistrar.m
//  Runner
//
//  Created by 李梦珂 on 2020/10/29.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "NativePluginRegistrar.h"
#import "BaseNativeFlutterPlugin.h"
@implementation NativePluginRegistrar

+(void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar
{
    [BaseNativeFlutterPlugin registerWithRegistrar:registrar];
}
@end
