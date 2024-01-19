//
//  cls_BaseViewController.h
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/7.
//

#import <UIKit/UIKit.h>
#import "cls_Tool.h"
#import "cls_userInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface cls_BaseViewController : UIViewController
@property (weak, nonatomic)  UIButton *pro_jinbobtn;
@property (weak, nonatomic)  UIButton *pro_shushu;
- (void)fun_goback;
@property (weak, nonatomic)  UIButton *pro_backbtn;
@property (nonatomic,strong) cls_userInfo *pro_user;
- (NSString *)fun_plistText:(NSString *)key;
+ (void)fun_point_requst:(NSValue *)touchPoint1;
@end

NS_ASSUME_NONNULL_END
