#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface FBAnalytics : CDVPlugin

- (void)logEvent:(CDVInvokedUrlCommand*)command;
- (void)logPurchase:(CDVInvokedUrlCommand*)command;
- (void)setConversionValue:(CDVInvokedUrlCommand*)command;
- (void)logFunnelStep:(CDVInvokedUrlCommand*)command;

@end
