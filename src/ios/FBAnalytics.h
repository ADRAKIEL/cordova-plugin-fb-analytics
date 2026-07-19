#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface FBAnalytics : CDVPlugin

// Logs a standard Facebook App Event with optional parameters.
- (void)logEvent:(CDVInvokedUrlCommand*)command;

// Logs a purchase event including amount, currency, and optional parameters.
- (void)logPurchase:(CDVInvokedUrlCommand*)command;

// Attempts to set a SKAdNetwork conversion value. Not supported in this SDK version.
- (void)setConversionValue:(CDVInvokedUrlCommand*)command;

// Logs a funnel step using a prefixed event name.
- (void)logFunnelStep:(CDVInvokedUrlCommand*)command;

@end
