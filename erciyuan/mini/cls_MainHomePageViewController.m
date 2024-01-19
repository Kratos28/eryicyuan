//
//  cls_MainHomePageViewController.m
//  chongshou
//
//  Created by 9130Game on 2023/12/13.
//

#import "cls_MainHomePageViewController.h"
#import "cls_Tool.h"
#import "cls_UIViewFrameCategory.h"
#import "cls_StashViewController.h"
#import "cls_SkillupgradeViewController.h"
#import "cls_SignViewController.h"
#import "cls_shopViewController.h"
#import "cls_guankaViewController.h"
@interface cls_MainHomePageViewController ()

@end

@implementation cls_MainHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pro_backbtn.hidden = YES;
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"界面背景"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
            
        });
        [self.view addSubview:var_imageview];
    }
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"img_start_bg_shouye"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, 0,b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
    }
    
    
}


@end
