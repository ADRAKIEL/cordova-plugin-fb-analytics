#import "AppDelegate+FBAnalytics.h"
@import FBSDKCoreKit;

@implementation AppDelegate (FBAnalytics)

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [FBSDKApplicationDelegate.sharedInstance initializeSDK];

    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
