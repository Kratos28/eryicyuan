//
//  cls_shibaiViewController.m
//  erciyuan
//
//  Created by k on 2024/3/17.
//

#import "cls_shibaiViewController.h"

@interface cls_shibaiViewController ()

@end

@implementation cls_shibaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"失败"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(b.centerX, b.centerY,RPX(600), RPY(400));
        
    });
    
    
    [self.view addSubview:var_imageview];
    
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setTitle:@"继续挑战" forState:0];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"按钮1"] forState:UIControlStateNormal];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(150), RPY(900), b.width, b.height);

        });
        
        buttonBlock(var_button, ^(UIButton  *btn){
          
            [self.presentingViewController.presentingViewController dismissViewControllerAnimated:NO completion:nil];
        });

        [self.view addSubview:var_button];
    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setTitle:@"返回界面" forState:0];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"按钮2"] forState:UIControlStateNormal];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(600), RPY(900), b.width, b.height);

        });
        buttonBlock(var_button, ^(UIButton  *btn){
            [self.presentingViewController.presentingViewController dismissViewControllerAnimated:NO completion:nil];

        });

        [self.view addSubview:var_button];
    }
}


@end
