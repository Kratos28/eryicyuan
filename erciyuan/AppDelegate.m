//
//  AppDelegate.m
//  erciyuan
//
//  Created by 9130Game on 2023/12/21.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#if DEBUG
   // iOS
   [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];

   // 同时还支持 tvOS 和 MacOS，配置时只需要在 /Applications/InjectionIII.app/Contents/Resources/ 目录下找到对应的 bundle 文件,替换路径即可
#endif
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ViewController alloc]init];
    [self.window makeKeyAndVisible];
    return YES;
}






@end
