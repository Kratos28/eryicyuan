//
//  AppDelegate.m
//  testProj
//
//  Created by nine on 2022/11/17.
//

#import "AppDelegate.h"
#import "WD_WrapTool.h"
#import "ManageTool.h"
#import "cls_kaishiViewController.h"
#import <objc/runtime.h>
#import "game_requestHotp.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [ManageTool wlyDdelete:@"var_device_info"];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    if ([ManageTool wly_SwitchAccount]) {

        UIViewController *v = [[cls_kaishiViewController alloc]init];
         v.modalPresentationStyle = UIModalPresentationFullScreen;
         v.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.window.rootViewController = v;
    } else {
        [WD_WrapTool mth_launchApplication:self.window];
    }

    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window {
    if ([ManageTool wly_SwitchAccount]) {
        return UIInterfaceOrientationMaskLandscapeLeft;
    }else {
        
        return UIInterfaceOrientationMaskPortrait;
    }
    
}
//
//@synthesize persistentContainer = _persistentContainer;
//
//- (NSPersistentContainer *)persistentContainer {
//    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
//    @synchronized (self) {
//        if (_persistentContainer == nil) {
//            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Game"];
//
//            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
//                if (error != nil) {
//                    // Replace this implementation with code to handle the error appropriately.
//                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                    /*
//                     Typical reasons for an error here include:
//                     * The parent directory does not exist, cannot be created, or disallows writing.
//                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                     * The device is out of space.
//                     * The store could not be migrated to the current model version.
//                     Check the error message to determine what the actual problem was.
//                    */
//                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//                    abort();
//                }
//            }];
//        }
//    }
//
//    return _persistentContainer;
//}
//
//#pragma mark - Core Data Saving support
//
//- (void)saveContext {
//    NSManagedObjectContext *context = self.persistentContainer.viewContext;
//    NSError *error = nil;
//    if ([context hasChanges] && ![context save:&error]) {
//        // Replace this implementation with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//        abort();
//    }
//}

@end

/*
///推送
- (void)c_number {
    if (![ManageTool wly_SwitchAccount]) {
        if (@available(iOS 10.0, *)) {
            UNUserNotificationCenter *unuNcrCenter = [UNUserNotificationCenter currentNotificationCenter];
            unuNcrCenter.delegate = self;
            [unuNcrCenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            }];

            [unuNcrCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            }];

        }
//        else if (@available(iOS 8.0, *)){
//
//            UIUserNotificationSettings *unuNcRSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:nil];
//            [[UIApplication sharedApplication] registerUserNotificationSettings:unuNcRSettings];
//        }
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    NSString *deviceTRString = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    deviceTRString = [deviceTRString stringByReplacingOccurrencesOfString:@" " withString:@""];
    [[NSUserDefaults standardUserDefaults] setObject:deviceTRString forKey:[Game_ParameterModel plistText:@"strzz_deviceID"]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {

    static UIBackgroundTaskIdentifier btiRRtaskRId;
    btiRRtaskRId = [application beginBackgroundTaskWithExpirationHandler:^(void) {

        [[UIApplication sharedApplication] endBackgroundTask:btiRRtaskRId];
        btiRRtaskRId = UIBackgroundTaskInvalid;
    }];
    NSString *c_number_msg = [Game_ParameterModel plistText:@"strzz_msg_id"];
    NSString *unresmsg_id = userInfo[c_number_msg];

    if (application.applicationState == UIApplicationStateInactive) {
        [self wly_uploadRDataRWithRMsg_id:unresmsg_id type:@"7"];
    } else {
        if (@available(iOS 10.0, *)) {
            if (application.applicationState == UIApplicationStateBackground) {
                [self wly_uploadRDataRWithRMsg_id:unresmsg_id type:@"6"];
            }
        } else {
            [self wly_uploadRDataRWithRMsg_id:unresmsg_id type:@"6"];
        }
    }
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler  API_AVAILABLE(ios(10.0)){

    NSDictionary *userStr_Info = notification.request.content.userInfo;

    NSString *c_number_msg = [Game_ParameterModel plistText:@"strzz_msg_id"];

    [self wly_uploadRDataRWithRMsg_id:userStr_Info[c_number_msg] type:@"6"];

    completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)wly_uploadRDataRWithRMsg_id:(NSString *)idx type:(NSString *)type {
    NSString *gameCodeID = DEF_idCode;
    NSString *gamePkg = DEF_pkgCode;
    NSString *str22 = [NSString stringWithFormat:@"%@=%@&%@=%@&%@=%@&%@=%@&%@=%@&%@=%@&%@=%@&%@=%@&%@=%@", [Game_ParameterModel plistText:@"str_game_id1"], gameCodeID, [Game_ParameterModel plistText:@"str_game_pkg1"], gamePkg, [Game_ParameterModel plistText:@"str_partner_id1"], [Game_ParameterModel plistText:@"str_str_partner_idv2"], [Game_ParameterModel plistText:@"str_uuid1"], [ManageTool wly_getdeviceIDFV1], [Game_ParameterModel plistText:@"str_idfv1"], [ManageTool wly_getdeviceIDFV1], [Game_ParameterModel plistText:@"str_dname1"], [ManageTool wly_getDeviceModelString11], [Game_ParameterModel plistText:@"str_mac1"], [ManageTool wly_wgMdsseet3dcam1], [Game_ParameterModel plistText:@"str_net_type1"], [Game_ParameterModel plistText:@"str_wifi1"], [Game_ParameterModel plistText:@"str_os_ver1"], [UIDevice currentDevice].systemVersion];

    NSString *user_push = [Game_ParameterModel plistText:@"user_push"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/?%@", [Game_ParameterModel plistText:@"str_sh9130"], user_push]];
    NSMutableURLRequest *volatiles = [NSMutableURLRequest requestWithURL:url];
    volatiles.HTTPMethod = @"POST";
    volatiles.timeoutInterval = 10;
    NSString *str = [NSString stringWithFormat:@"%@&%@=%@&%@=%@", str22, [Game_ParameterModel plistText:@"strzz_msg_id"],idx, @"type",  type];
    volatiles.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession *notSessionR = [NSURLSession sharedSession];
    NSURLSessionDataTask *notSessionRDataRTask = [notSessionR dataTaskWithRequest:volatiles completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    }];
    [notSessionRDataRTask resume];
}
*/
