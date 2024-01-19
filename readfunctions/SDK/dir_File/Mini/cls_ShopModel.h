//
//  cls_ShopModel.h
//  Game
//
//  Created by 9130Game on 2023/11/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_ShopModel : NSObject <NSCoding, NSSecureCoding>
@property (nonatomic,copy) NSString *pro_shopname;
@property (nonatomic,assign) NSInteger pro_shopGold;
@property (nonatomic,copy) NSString *pro_shopImageName;
@property (nonatomic,assign) NSInteger pro_shopquantity;
+ (NSMutableArray *)fun_getShops;
+ (void)fun_ShopSingleSave:(cls_ShopModel *)signin;
+ (void)fun_ShopSave:(NSMutableArray *)temp;
@end

NS_ASSUME_NONNULL_END
