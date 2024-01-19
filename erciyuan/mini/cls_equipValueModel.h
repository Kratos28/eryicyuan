//
//  cls_equipValueModel.h
//  Pojun
//
//  Created by 9130Game on 2023/12/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_equipValueModel : NSObject <NSCoding, NSSecureCoding>
@property (nonatomic,assign) int16_t pro_equipValueModelLV;
@property (nonatomic,assign) int16_t pro_equipValueModelATK;
@property (nonatomic,assign) int16_t pro_equipValueModelHP;
@property (nonatomic,assign) int16_t pro_equipValueModelConsumegold;
@property (nonatomic,assign) int16_t pro_equipValueModelConsumeshuijing;

@end
NS_ASSUME_NONNULL_END
