#import "AppDelegate+FBAnalytics.h"
@import FBSDKCoreKit;

@implementation AppDelegate (FBAnalytics)

- (void)pluginInitialize {
    [FBSDKApplicationDelegate.sharedInstance initializeSDK];
}

@end
