#import "FBAnalytics.h"

@import FBSDKCoreKit;
@import StoreKit;

@implementation FBAnalytics

#pragma mark - Cordova Plugin Initialization
// Initializes the Facebook SDK when the plugin is loaded.
- (void)pluginInitialize {
    [FBSDKApplicationDelegate.sharedInstance initializeSDK];
}

#pragma mark - Parameter Normalization
// Converts only valid NSString/NSNumber values to a dictionary accepted by FBSDK.
- (NSMutableDictionary<NSString *, id> *)convertParams:(NSDictionary *)params {
    NSMutableDictionary<NSString *, id> *converted = [NSMutableDictionary dictionary];

    if (!params) return converted;

    [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![key isKindOfClass:[NSString class]]) return;

        if ([obj isKindOfClass:[NSString class]] ||
            [obj isKindOfClass:[NSNumber class]]) {
            converted[(NSString *)key] = obj;
        }
    }];

    return converted;
}

#pragma mark - Log Event
// Logs a standard Facebook App Event.
- (void)logEvent:(CDVInvokedUrlCommand*)command {

    NSString *eventName = command.arguments.count > 0 ? command.arguments[0] : nil;

    if (!eventName || (NSNull *)eventName == [NSNull null]) {
        CDVPluginResult *result =
        [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                          messageAsString:@"Event name is required"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }

    NSDictionary *params = (command.arguments.count > 1 &&
                            [command.arguments[1] isKindOfClass:[NSDictionary class]])
                            ? command.arguments[1] : nil;

    NSMutableDictionary *convertedParams = [self convertParams:params];

    // ⭐ FBSDK 13+ → singleton instance
    [[FBSDKAppEvents shared] logEvent:eventName parameters:convertedParams];

    CDVPluginResult *result =
    [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                      messageAsString:@"OK"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

#pragma mark - Log Purchase
// Logs a purchase event with amount, currency, and optional parameters.
- (void)logPurchase:(CDVInvokedUrlCommand*)command {

    NSNumber *amount = command.arguments.count > 0 ? command.arguments[0] : nil;
    NSString *currency = command.arguments.count > 1 ? command.arguments[1] : nil;

    if (!amount || !currency ||
        (NSNull *)amount == [NSNull null] ||
        (NSNull *)currency == [NSNull null]) {

        CDVPluginResult *result =
        [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                          messageAsString:@"Amount and currency are required"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }

    NSDictionary *params = (command.arguments.count > 2 &&
                            [command.arguments[2] isKindOfClass:[NSDictionary class]])
                            ? command.arguments[2] : nil;

    NSMutableDictionary *convertedParams = [self convertParams:params];

    // ⭐ FBSDK 13+ → singleton instance
    [[FBSDKAppEvents shared] logPurchase:[amount doubleValue]
                                 currency:currency
                               parameters:convertedParams];

    CDVPluginResult *result =
    [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                      messageAsString:@"OK"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

#pragma mark - Conversion Value (SKAdNetwork)
// SKAdNetwork conversion values are not supported in this SDK version.
- (void)setConversionValue:(CDVInvokedUrlCommand*)command {

    NSNumber *value = command.arguments.count > 0 ? command.arguments[0] : nil;

    if (!value || (NSNull *)value == [NSNull null]) {
        CDVPluginResult *result =
        [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                          messageAsString:@"Conversion value is required"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }

    CDVPluginResult *result =
    [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                      messageAsString:@"OK (SKAN not supported in this SDK version)"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

#pragma mark - Funnel Step
// Logs a funnel step as a prefixed event name.
- (void)logFunnelStep:(CDVInvokedUrlCommand*)command {

    NSString *stepName = command.arguments.count > 0 ? command.arguments[0] : nil;

    if (!stepName || (NSNull *)stepName == [NSNull null]) {
        CDVPluginResult *result =
        [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                          messageAsString:@"Step name is required"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    }

    NSDictionary *params = (command.arguments.count > 1 &&
                            [command.arguments[1] isKindOfClass:[NSDictionary class]])
                            ? command.arguments[1] : nil;

    NSMutableDictionary *convertedParams = [self convertParams:params];

    NSString *eventName = [NSString stringWithFormat:@"funnel_%@", stepName];

    // ⭐ FBSDK 13+ → singleton instance
    [[FBSDKAppEvents shared] logEvent:eventName parameters:convertedParams];

    CDVPluginResult *result =
    [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                      messageAsString:@"OK"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
