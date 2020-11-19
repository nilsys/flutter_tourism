#import "PluginCslogPlugin.h"

@implementation PluginCslogPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"plugin_cslog"
            binaryMessenger:[registrar messenger]];
  PluginCslogPlugin* instance = [[PluginCslogPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"debugLog" isEqualToString:call.method]) {
    //flutter传给原生的参数
    id params = call.arguments;
    NSLog(@"flutter传给原生的参数：%@", params);
      
  }else {
    result(FlutterMethodNotImplemented);
  }
}

@end
