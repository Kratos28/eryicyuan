//
//  cls_baseModel.h
//  Game
//
//  Created by 9130Game on 2023/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_baseModel : NSObject  <NSCoding, NSSecureCoding>
@property (nonatomic,copy) NSString *pro_baseModelname;
+ (NSMutableArray *)fun_getModel;
+ (void)fun_SingleSave:(cls_baseModel *)signin;
+ (void)fun_Save:(NSMutableArray *)temp;
@end

NS_ASSUME_NONNULL_END
