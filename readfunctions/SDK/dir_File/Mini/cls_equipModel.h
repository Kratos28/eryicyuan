//
//  cls_equipModel.h
//  Game
//
//  Created by 9130Game on 2023/11/23.
//

#import <Foundation/Foundation.h>
#import "cls_baseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface cls_equipValueModel : NSObject <NSCoding, NSSecureCoding>
@property (nonatomic,assign) int16_t pro_equipValueModelLV;
@property (nonatomic,assign) int16_t pro_equipValueModelATK;
@property (nonatomic,assign) int16_t pro_equipValueModelHP;
@property (nonatomic,assign) int16_t pro_equipValueModelConsumegold;
@property (nonatomic,assign) int16_t pro_equipValueModelConsumeshuijing;

@end


@interface cls_equipModel : cls_baseModel <NSCoding, NSSecureCoding>
@property (nonatomic,copy) NSString * pro_equipdesc;
@property (nonatomic,assign) int16_t pro_equipfangyu;
@property (nonatomic,assign) int16_t pro_equipgold;
@property (nonatomic,assign) int16_t pro_equipgongji;
@property (nonatomic,copy) NSString *pro_equipimageName;
@property (nonatomic,assign) int16_t pro_equiplv;
@property (nonatomic,assign) BOOL pro_equipown;
@property (nonatomic,assign) int16_t pro_equipshanbi;
@property (nonatomic,assign) int16_t pro_equipstatus;
@property (nonatomic,assign) int16_t pro_equipxueliang;
@property (nonatomic,assign) int16_t pro_equipwarehouseQuantity;
@property (nonatomic,strong) cls_equipValueModel *pro_equipValue;
@property (nonatomic,strong) cls_equipValueModel *pro_equipnextValue;

@end

NS_ASSUME_NONNULL_END
