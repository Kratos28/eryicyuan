//
//  cls_SigninModel.h
//  Game
//
//  Created by 9130Game on 2023/11/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_SigninModel :  NSObject<NSCoding, NSSecureCoding>
@property (nonatomic,assign) NSInteger pro_tianshu;
@property (nonatomic,assign) NSInteger pro_signinGold;
@property (nonatomic,copy) NSString *pro_signinImageName;
@property (nonatomic,assign) BOOL pro_shifouqiandao;
+ (void )fun_createSignin;
+ (void)fun_SigninSaveSignins:(NSMutableArray *)temp;
+ (void)fun_signinSave:(cls_SigninModel *)signin;

+ (NSMutableArray *)fun_getSignin;
@end

NS_ASSUME_NONNULL_END
