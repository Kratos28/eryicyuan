//
//  Game_ParameterModel.h
//  testProj
//
//  Created by nine on 2022/4/12.
//  Copyright © 2022 天罡奇缘. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Game_ParameterModel : NSObject

@property (nonatomic, strong) NSDictionary *para_plistMolDict;
@property (nonatomic, strong) NSData *para_plistMolData;

+ (instancetype)sharedGPM_Manager;
+ (NSData *)wlyfive_dooogencodeData:(NSData *)sourceData wyfove_fwithKey:(NSString *)key;
+ (NSData *)plistText1:(NSData *)key;
+ (NSString *)plistText:(NSString *)key;
- (BOOL)wly_theCurrentTime:(NSString *)currentTime;

@end

NS_ASSUME_NONNULL_END
