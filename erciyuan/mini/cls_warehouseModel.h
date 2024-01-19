//
//  cls_zhuangbei.h
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_warehouseModel : NSObject<NSCoding, NSSecureCoding>
@property (nonatomic,copy) NSString * pro_warehousedesc;
@property (nonatomic,assign) int16_t pro_warehousefangyu;
@property (nonatomic,assign) int16_t pro_warehousegold;
@property (nonatomic,assign) int16_t pro_warehousegongji;
@property (nonatomic,copy) NSString *pro_warehouseimageName;
@property (nonatomic,assign) int16_t pro_warehouselv;
@property (nonatomic,copy) NSString *pro_warehousename;
@property (nonatomic,assign) BOOL pro_warehouseown;
@property (nonatomic,assign) int16_t pro_warehouseshanbi;
@property (nonatomic,assign) int16_t pro_warehousestatus;
@property (nonatomic,assign) int16_t pro_warehousexueliang;
@property (nonatomic,assign) int16_t pro_warehouseQuantity;

+ (void )fun_createWarehouse;
+ (void)fun_warehouseSingleSave:(cls_warehouseModel *)signin;
+ (NSMutableArray *)fun_getWarehouse;
@end

NS_ASSUME_NONNULL_END
