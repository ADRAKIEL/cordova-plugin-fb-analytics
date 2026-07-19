#import "AppDelegate+MetaEvents.h"
@import FBSDKCoreKit;

@implementation AppDelegate (MetaEvents)

- (void)pluginInitialize {
    [FBSDKApplicationDelegate.sharedInstance initializeSDK];
}

@end
