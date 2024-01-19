//
//  cls_conGratuiLationsViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/14.
//

#import "cls_conGratuiLationsViewController.h"

@interface cls_conGratuiLationsViewController ()

@end

@implementation cls_conGratuiLationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_bg_3"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
        
    }
    self.pro_shushu.hidden = true;
    self.pro_backbtn.hidden = true;
    self.pro_jinbobtn.hidden = true;
    
    
    cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    user.pro_gold += 100;
    user.pro_shu +=100;
    [user fun_save];
    updateNote;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:false completion:nil];
}

@end
