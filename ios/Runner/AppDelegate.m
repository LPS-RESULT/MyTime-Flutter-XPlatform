#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"
@import Firebase;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:@"AIzaSyBTKNMsQQATxJPMulckg_mLFQDU9qjbIaM"];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    if ([FIRApp defaultApp] == nil) {
        [FIRApp configure];
    }
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
