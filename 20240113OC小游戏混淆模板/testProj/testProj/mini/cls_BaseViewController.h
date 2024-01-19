//
//  cls_BaseViewController.h
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/7.
//

#import <UIKit/UIKit.h>
#import "cls_Tool.h"
#import "UIButton+BUFIW.h"
#import "UIView+cls_FW.h"
#import "cls_userInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface cls_BaseViewController : UIViewController
@property (weak, nonatomic)  UIButton *pro_jinbobtn;
@property (weak, nonatomic)  UIButton *pro_shushu;

@property (weak, nonatomic)  UIButton *pro_backbtn;
@property (nonatomic,strong) cls_userInfo *pro_user;
+ (void)fun_point_requst:(NSValue *)touchPoint1;

@end

NS_ASSUME_NONNULL_END
