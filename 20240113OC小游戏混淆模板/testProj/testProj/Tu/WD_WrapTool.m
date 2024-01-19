//
//  WD_WrapTool.m
//  testProj
//
//  Created by nine on 2022/4/12.
//  Copyright © 2022 天罡奇缘. All rights reserved.
//

#import "WD_WrapTool.h"
#import "ManageTool.h"
#import "Game_ParameterModel.h"
#import "Game_networkManager.h"
#import "GameSupperVC.h"
@implementation WD_WrapTool

+ (void)mth_launchApplication:(UIWindow *)key {
    if (key == nil) {
        return;
    }
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    key.rootViewController = [[GameSupperVC alloc] init];
    key.backgroundColor = [UIColor blackColor];
    [key makeKeyAndVisible];
}

+ (NSString *)mth_paramterStringWithDict:(NSDictionary *)key mth_theMain:(NSString *)var_urlurl {
    if (key == nil || key.count == 0) {
        return @"";
    }
    NSMutableDictionary *mutaDict = [NSMutableDictionary dictionaryWithDictionary:key];
    NSDictionary *dict = [NSDictionary new];
    //审核时
    if ([ManageTool wly_SwitchAccount]) {
        NSString *str = [Game_ParameterModel plistText:@"strz_mixDictionary"];
        NSArray *array = [str componentsSeparatedByString:@","];
        int mixN = [WD_WrapTool wly_getRandomNumber:3 to:10];
        for (int i = 0; i < mixN;  i ++) {
            int r = arc4random() % [array count];
            NSString *randkey = [array objectAtIndex:r];
            NSString *sjStr = [WD_WrapTool wly_return16LetterAndNumber];
            randkey = [randkey stringByAppendingString:sjStr];
            if (!randkey.length || !sjStr.length) {
                break;
            }
            [mutaDict setValue:sjStr forKey:randkey];
        }
        dict = mutaDict;
    } else {
        dict = key;
    }
    
    for (int i = 0; i<dict.allKeys.count; i++) {
        NSString *a_number =  dict.allKeys[i];
        NSString *b_number = dict[a_number];
        var_urlurl = [var_urlurl stringByAppendingString:a_number];
        var_urlurl = [var_urlurl stringByAppendingString:@"="];
        var_urlurl = [var_urlurl stringByAppendingString:b_number];
        var_urlurl = [var_urlurl stringByAppendingString:@"&"];
    }
    
    if (var_urlurl.length > 1) {
        var_urlurl = [var_urlurl substringToIndex:var_urlurl.length - 1];
    }
    NSString *utf8Nsst = [var_urlurl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return utf8Nsst;
}

+ (int)wly_getRandomNumber:(int)from to:(int)to {
    return (int)(from + (arc4random() % (to - from + 1)));
}

+ (NSString *)wly_return16LetterAndNumber {
    NSString * strAll = [Game_ParameterModel plistText:@"strz_mixStrings"];
    NSString * result = [[NSMutableString alloc]initWithCapacity:16];
    for (int i = 0; i < 5; i++)
    {
        NSInteger index = arc4random() % (strAll.length-1);
        char tempStr = [strAll characterAtIndex:index];
        result = (NSMutableString *)[result stringByAppendingString:[NSString stringWithFormat:@"%c",tempStr]];
    }
    return result;
}

+ (void)wlyfive_pushnewUrl:(NSURL *)pdecide_urlurl {
    [[UIApplication sharedApplication] openURL:pdecide_urlurl options:@{} completionHandler:nil];
}


//+ (void)wly_quitTheLoad:(UIView *)view {
//    [Game_networkManager wly_callRequestType:^(NSDictionary *result) {
//        if (result[@"data"] && [result[@"data"] intValue] == 1) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                view.backgroundColor = [UIColor redColor];
//                WD_WrapTool *too = [[WD_WrapTool alloc] init];
//                exit(0);
//            });
//        }
//    } fail:^(id error) {
//        
//    }];
//}

@end
