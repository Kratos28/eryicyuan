//
//  Game_ParameterModel.m
//  testProj
//
//  Created by nine on 2022/4/12.
//  Copyright © 2022 天罡奇缘. All rights reserved.
//

#import "Game_ParameterModel.h"

@implementation Game_ParameterModel

+ (instancetype)sharedGPM_Manager {
    static Game_ParameterModel *_model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _model = [[Game_ParameterModel alloc] init];
    });
    return _model;
}

+ (NSData *)plistText1:(NSData *)key {
    // 注意解密的key要个之前脚本加密的key对应
    NSData *data = [self wlyfive_dooogencodeData:key wyfove_fwithKey:@"GnB"];
    return data;
}

+ (NSString *)plistText:(NSString *)key {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AAA" ofType:@"txt"];
    if (path) {
        if (![Game_ParameterModel sharedGPM_Manager].para_plistMolDict) {
            if (![Game_ParameterModel sharedGPM_Manager].para_plistMolData) {
                NSData *data1 = [[NSData alloc] initWithContentsOfFile:path];
                [Game_ParameterModel sharedGPM_Manager].para_plistMolData = [Game_ParameterModel wlyfive_encContent:data1 wlyfive_sKey:@"GnB"];
            }
            NSPropertyListFormat format;
            [Game_ParameterModel sharedGPM_Manager].para_plistMolDict = [NSPropertyListSerialization propertyListWithData:[Game_ParameterModel sharedGPM_Manager].para_plistMolData options:0 format:&format error:NULL];
        }
        if ([[Game_ParameterModel sharedGPM_Manager].para_plistMolDict objectForKey:key]) {
            return [[Game_ParameterModel sharedGPM_Manager].para_plistMolDict objectForKey:key];
        }
    }
    return @"";
}

+ (NSData*)wlyfive_encContent:(NSData*)cont wlyfive_sKey:(NSString*) key {
    NSString *str2 = [[Game_ParameterModel wlyfive_sdostringWithData:cont] substringToIndex:38];
    if ([str2 containsString:@"xml"]) {
        return cont;
    } else {
        return [self wlyfive_dooogencodeData:cont wyfove_fwithKey:key];
    }
}

+ (NSString *)wlyfive_sdostringWithData:(NSData *)data {
    NSString * str  = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

+ (NSData *)wlyfive_dooogencodeData:(NSData *)sourceData wyfove_fwithKey:(NSString *)key {
    NSUInteger length = key.length;
    NSUInteger sourceDatalen = [sourceData length];
    const char *keys = [key cStringUsingEncoding:NSASCIIStringEncoding];
    unsigned char cKey[length];
    memcpy(cKey, keys, length);
    NSMutableData *toData = [[NSMutableData alloc] initWithCapacity:length];
    Byte *sourceDataPoint = (Byte *)[sourceData bytes];
    for(unsigned long i =0, j =0;i < sourceDatalen; ++i){
        Byte b = (Byte) sourceDataPoint[i]^cKey[j];
        j=(j+i)%(length);
        [toData appendBytes:&b length:1];
    }
    return toData.copy;
}

- (BOOL)wly_theCurrentTime:(NSString *)currentTime {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale systemLocale];
    [dateFormatter setDateFormat:[Game_ParameterModel plistText:@"strzw_time_format"]];//@"yyyy-MM-dd HH:mm:ss"
    NSDate *startDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:[NSDate date]]];
    NSDate *endDate = [dateFormatter dateFromString:currentTime];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitHour;
    NSDateComponents *delta = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    return delta.hour > 0;
}

@end
