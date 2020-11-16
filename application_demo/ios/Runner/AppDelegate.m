#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "SayHello.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  [SayHello registerWithRegistrar:[self registrarForPlugin:@"helloPlugin"]];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
