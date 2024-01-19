//
//  cls_homepageViewController.m
//  Game
//
//  Created by 9130Game on 2023/11/17.
//

#import "cls_homepageViewController.h"
#import "cls_SigninViewController.h"
#import "cls_ShopViewController.h"

@interface cls_homepageViewController ()

@end

@implementation cls_homepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pro_backbtn.hidden = true;
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_homepagebtn_bg"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_homepagebtn_btn_qd"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:15 RPY:350 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(2, 1)]];

            UIViewController *mainvc =   [[NSClassFromString(@"cls_SigninViewController") alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
    
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_homepagebtn_btn_zb"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:15 RPY:650 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            UIViewController *mainvc =   [[NSClassFromString(@"cls_EquipmentViewController") alloc]init];
            [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(2, 2)]];

            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            
            [self presentViewController:mainvc animated:NO completion:nil];
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_homepagebtn_btn_sc"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:130 RPY:650 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(2, 3)]];

            UIViewController *mainvc =   [[NSClassFromString(@"cls_ShopViewController") alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_homepagebtn_btn_ck"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:250 RPY:650 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            
            [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(2, 4)]];

            UIViewController *mainvc =   [[NSClassFromString(@"cls_StashViewController") alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
            
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_homepagebtn_btn_ksyx"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:1100 RPY:580 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            
            [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(2, 5)]];

            UIViewController *mainvc =   [[NSClassFromString(@"cls_checkpointViewController") alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
        } Event:64];
        [self.view addSubview:var_button];
    }
}


@end
