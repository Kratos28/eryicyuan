//
//  Game_networkManager.h
//  testProj
//
//  Created by nine on 2022/4/13.
//  Copyright © 2022 天罡奇缘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Game_networkManager : NSObject


+ (instancetype)sharedGPM_Manager;

//+ (void)wd_reportASA:(NSString *)result;
//+ (void)wd_reportTheIDFA;
+ (void)wly_callRequestType:(void (^)(NSDictionary *result))suc fail:(void (^)(id error))fail;

- (void)theViewErrorAlert:(NSString *)key vc:(UIViewController *)vc sureHandler:(void (^ __nullable)(UIAlertAction *action))sureHandler;
- (void)theViewWithAlertMessage:(NSString *)message completionHandler:(void (^)(void))completionHandler vc:(UIViewController *)vc;
- (void)theViewWithMessage:(NSString *)message completionHandler:(void (^)(BOOL))completionHandler vc:(UIViewController *)vc;
- (void)theViewPrompt:(NSString *)prompt defaultText:(NSString *)defaultText completionHandler:(void (^)(NSString * _Nullable))completionHandler vc:(UIViewController *)vc;

+ (NSString *)wlyfive_md5String:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
