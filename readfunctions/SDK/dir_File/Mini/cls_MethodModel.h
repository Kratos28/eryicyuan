//
//  cls_MethodModel.h
//  Game
//
//  Created by 9130Game on 2023/10/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_MethodModel : NSObject<NSCoding, NSSecureCoding>
@property (nonatomic,copy)NSString  *pro_methodname;
@property (nonatomic,copy)NSString * pro_methoddecl;
@property (nonatomic,copy)NSString  *pro_imageName;
@property (nonatomic,assign)NSInteger  pro_methodLv;
@property (nonatomic,assign)NSInteger  pro_methodGold;
@property (nonatomic,assign)NSInteger  pro_methodStatus;

@end

NS_ASSUME_NONNULL_END
