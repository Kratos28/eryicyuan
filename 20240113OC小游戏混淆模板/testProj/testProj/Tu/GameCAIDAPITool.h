//
//  GameCAIDAPITool.h
//  testProj
//
//  Created by nine on 2022/11/10.
//  Copyright © 2022 天罡奇缘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameCAIDAPITool : NSObject

//5.1.1 设备启动时间
+ (NSString *)wlyc_bootTimeInSec;
//5.1.2 国家
+ (NSString *)wlyc_countryCode;
//5.1.3 语言
+ (NSString *)wlyc_language;
//5.1.4 设备名称
+ (NSString *)wlyc_deviceName;
//5.1.5 系统版本
+ (NSString *)wlyc_systemVersion;
//5.1.6 设备 Machine
+ (NSString *)wlyc_machine;
//5.1.7 运营商
+ (NSString* )wlyc_carrierInfo;
//5.1.8 物理内存容量
+ (NSString *)wlyc_memory;
//5.1.9 硬盘容量
+ (NSString *)wlyc_disk;
//5.1.10 系统更新时间
+ (NSString *)wlyc_sysFileTime;
//5.1.11 设备 Model
+ (NSString *)wlyc_model;
//5.1.12 时区
+ (NSString *)wlyc_timeZone;

///请求caid
+ (void)wly_callRequestCaid:(void(^)(NSString *)) complete ;

@end

NS_ASSUME_NONNULL_END
