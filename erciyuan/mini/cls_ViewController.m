//
//  ViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/7.
//

#import "cls_ViewController.h"
#import "cls_Tool.h"
#import "cls_MainViewController.h"
@interface cls_ViewController ()
@property (nonatomic,strong)UIImageView *pro_imageFFFF;
@property (nonatomic,strong)UIButton *pro_startFWFW;

@end

@implementation cls_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"img_bg"];
        var_imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:var_imageview];
        self.pro_imageFFFF = var_imageview;
    }
    [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(0, 0)]];

    
    

    UIButton *var_button = [[UIButton alloc]init];
    [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_ks"] forState:UIControlStateNormal];
    var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:450 RPY:480 withImage:var_button.currentBackgroundImage];
    [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
        [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(1, 0)]];

        cls_MainViewController *mainvc =   [[cls_MainViewController alloc]init];
        mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
        mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [target presentViewController:mainvc animated:NO completion:nil];
    } Event:64];
    self.pro_startFWFW = var_button;
    [self.view addSubview:var_button];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.pro_imageFFFF.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.pro_startFWFW .frame = CGRectMake(RPX(450),RPY(480),RPX(300),RPY(80));
}


@end
