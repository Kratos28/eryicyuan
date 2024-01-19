//
//  Game_networkManager.m
//  testProj
//
//  Created by nine on 2022/4/13.
//  Copyright © 2022 天罡奇缘. All rights reserved.
//

#import "Game_networkManager.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import "Game_ParameterModel.h"
#import "ManageTool.h"

@implementation Game_networkManager

+ (instancetype)sharedGPM_Manager {
    static Game_networkManager *_model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _model = [[Game_networkManager alloc] init];
    });
    return _model;
}
/*
+ (void)wly_callRequestType:(void (^)(NSDictionary *result))suc fail:(void (^)(id error))fail {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //    [manager.requestSerializer setValue:@"text/bin" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = 20;
    NSString *str = [NSString stringWithFormat:@"%@%@", [Game_ParameterModel plistText:@"str22_exityuming"],[Game_ParameterModel plistText:@"strzw_quickBackId"]];
    str = [NSString stringWithFormat:@"%@%@",str,[Game_networkManager wlyGetUrlQueryString]];
    [manager GET:str parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
        if (dict && (error == nil)) {
            if (dict) {
                suc(dict);
            } else {
                fail(error);
            }
        } else {
            fail(error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}
*/

+ (void)wly_callRequestType:(void (^)(NSDictionary *result))suc fail:(void (^)(id error))fail {
    NSString *str = [NSString stringWithFormat:@"%@%@", [Game_ParameterModel plistText:@"str22_exityuming"],[Game_ParameterModel plistText:@"strzw_quickBackId"]];
    str = [NSString stringWithFormat:@"%@%@",str,[Game_networkManager wlyGetUrlQueryString]];
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:(NSURLRequestReloadIgnoringLocalCacheData) timeoutInterval:15];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data && (error == nil)) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
            if (dict) {
                suc(dict);
            } else {
                fail(error);
            }
        } else {
            fail(error);
        }
    }];
    [task resume];
}


//+ (void)wd_reportASA:(NSString *)result {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self wdBaseJavaScriptCallBack:[NSString stringWithFormat:@"%@('%@')", [Game_ParameterModel plistText:@"stra_getASAToken"], result]];
//    });
//}

//+ (void)wd_reportTheIDFA  {
//    if ([ManageTool wly_SwitchAccount]) { return; }
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [ManageTool wly_getIDFAFirstAInstall:^(NSString *result) {
//                [self wdBaseJavaScriptCallBack:[NSString stringWithFormat:@"%@('%@')", [Game_ParameterModel plistText:@"stra_getreportidfa"], result]];
//            }];
//        });
//    });
//}

//+ (void)wdBaseJavaScriptCallBack:(NSString *)name {
//    dispatch_main_async_safe(^{
//        if ([Game_networkManager sharedGPM_Manager].checkwWkVsiew) {
//            [[Game_networkManager sharedGPM_Manager].checkwWkVsiew evaluateJavaScript:name completionHandler:^(id _Nullable result, NSError * _Nullable error) {
//                if (error) {
//                    NSLog(@"js报错了error: %@, result: %@", error, result);
//                } else {
//                    NSLog(@"js成功了error: %@, result: %@", error, result);
//                }
//            }];
//        }
//    });
//}


+ (NSString *)wlyGetUrlQueryString {
    NSString *gameCodeID = DEF_idCode;
    NSString *gamePkg = DEF_pkgCode;
    NSString *timetime = [ManageTool wly_locationwDate1] ? [ManageTool wly_locationwDate1]:@"";
    NSString *str = [NSString stringWithFormat:@"%@=%@&%@=%@&%@&%@&time=%@", [Game_ParameterModel plistText:@"str_game_id1"], gameCodeID,[Game_ParameterModel plistText:@"str_game_pkg1"], gamePkg, [Game_ParameterModel plistText:@"str22_partnerid2_str"],[Game_ParameterModel plistText:@"str22_ver631str"], timetime];
    NSString *snStr= [NSString stringWithFormat:@"%@%@", str, [Game_ParameterModel plistText:@"str22_signkey_str"]];
    return [NSString stringWithFormat:@"&%@&sign=%@",str,[Game_networkManager wlyfive_md5String:snStr]];
}

+ (NSString *)wlyfive_md5String:(NSString *)string {
    if(string == nil || [string length] == 0){
        return nil;
    }
    const char *value = [string UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;
}


- (void)theViewErrorAlert:(NSString *)key vc:(UIViewController *)vc sureHandler:(void (^ __nullable)(UIAlertAction *action))sureHandler {
//    dispatch_main_async_safe(^{
        NSString *str11 = @"";
        if ([ManageTool wly_SwitchAccount]) {
            str11 = [NSString stringWithFormat:@"%@%@",[Game_ParameterModel plistText:@"strz_codede"],key];
        }
        
        UIAlertController *var_alertalertVC = [UIAlertController alertControllerWithTitle:[Game_ParameterModel plistText:@"str_tips1"] message:[NSString stringWithFormat:@"%@%@",[Game_ParameterModel plistText:@"str_loadError1"],str11] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *var_check_againAction = [UIAlertAction actionWithTitle:[Game_ParameterModel plistText:@"str_reload1"] style:UIAlertActionStyleDefault handler:sureHandler];
        
        UIAlertAction *var_check_cancelAction = [UIAlertAction actionWithTitle:[Game_ParameterModel plistText:@"str_to_setting1"] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSURL *pdecide_urlurl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            
            if ([[UIApplication sharedApplication] canOpenURL:pdecide_urlurl]){
                [[UIApplication sharedApplication] openURL:pdecide_urlurl options:@{} completionHandler:nil];
                
            }
            [vc presentViewController:var_alertalertVC animated:YES completion:nil];
        }];
        [var_alertalertVC addAction:var_check_cancelAction];
        [var_alertalertVC addAction:var_check_againAction];
        [vc presentViewController:var_alertalertVC animated:YES completion:nil];
//    });
}

- (void)theViewWithAlertMessage:(NSString *)message completionHandler:(void (^)(void))completionHandler vc:(UIViewController *)vc {
    dispatch_main_async_safe(^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[Game_ParameterModel plistText:@"strzw_shiti"] message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:([UIAlertAction actionWithTitle:[Game_ParameterModel plistText:@"strzw_sureQueRen"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completionHandler();
        }])];
        [vc presentViewController:alertController animated:YES completion:nil];
    });
}

- (void)theViewWithMessage:(NSString *)message completionHandler:(void (^)(BOOL))completionHandler vc:(UIViewController *)vc {
    dispatch_main_async_safe(^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[Game_ParameterModel plistText:@"strzw_shiti"] message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:([UIAlertAction actionWithTitle:[Game_ParameterModel plistText:@"strzw_cancleQuxiao"] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            completionHandler(NO);
        }])];
        [alertController addAction:([UIAlertAction actionWithTitle:[Game_ParameterModel plistText:@"strzw_sureQueRen"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completionHandler(YES);
        }])];
        [vc presentViewController:alertController animated:YES completion:nil];
    });
}

- (void)theViewPrompt:(NSString *)prompt defaultText:(NSString *)defaultText completionHandler:(void (^)(NSString * _Nullable))completionHandler vc:(UIViewController *)vc {
    //@"setUserData"
    if ([prompt caseInsensitiveCompare:[Game_ParameterModel plistText:@"strn_setcUserData"]] == NSOrderedSame && defaultText.length > 1) {
        
        NSLog(@"存值--->> %@",defaultText);
        [[NSUserDefaults standardUserDefaults] setObject:defaultText forKey:@"var_js_content"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        completionHandler(defaultText);
        
    } else if ([prompt caseInsensitiveCompare:[Game_ParameterModel plistText:@"strzw_getwUserData"]] == NSOrderedSame) {//@"getUserData"
        
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"var_js_content"]?:@"";
        NSLog(@"取值--->> %@",string);

        completionHandler([NSString stringWithFormat:@"%@",string]);
        
    } else if ([prompt caseInsensitiveCompare:[Game_ParameterModel plistText:@"strzw_deleteUserData"]] == NSOrderedSame) {//@"deleteUserData"
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"var_js_content"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"已删除值--->>");
        completionHandler(@"");
        
    }  else {
        dispatch_main_async_safe(^{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.text = defaultText;
            }];
            [alertController addAction:([UIAlertAction actionWithTitle:[Game_ParameterModel plistText:@"strzw_finishedWanCheng"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                completionHandler(alertController.textFields[0].text?:@"");
            }])];
            [vc presentViewController:alertController animated:YES completion:nil];
        });
    }
}

@end
