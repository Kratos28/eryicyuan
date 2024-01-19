//
//  cls_P.h
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import <Foundation/Foundation.h>
#import "cls_warehouseModel.h"
#import "cls_TaskModel.h"
#import "cls_MethodModel.h"
#import "cls_PetModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface cls_userInfo : NSObject<NSCoding, NSSecureCoding>
@property (nonatomic,assign) int16_t pro_dengji;
@property (nonatomic,assign) int16_t pro_gold;
@property (nonatomic,assign) int16_t pro_pebble;//晶石
@property (nonatomic,assign) int16_t pro_shu;
@property (nonatomic,assign) int16_t pro_guanshu;
@property (nonatomic,assign) int16_t pro_iD;
@property (nullable, nonatomic, copy) NSString *pro_name;
@property (nonatomic,assign) int16_t pro_zuidashengming;
@property (nonatomic,assign) int16_t pro_ATK;
@property (nonatomic,assign) int16_t pro_DEF;
@property (nonatomic,assign) int16_t pro_HP;
@property (nonatomic,assign) int16_t pro_EVA;




- (BOOL)fun_save;
+ (cls_userInfo *)fun_getuserInfo;
+ (cls_userInfo *)fun_createuserInfo;

@end

NS_ASSUME_NONNULL_END
