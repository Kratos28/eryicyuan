//
//  cls_kaishiViewController.m
//  Game
//
//  Created by 9130Game on 2023/11/17.
//

#import "cls_kaishiViewController.h"
#import "cls_homepageViewController.h"
#import "cls_battleViewController.h"

@interface cls_kaishiViewController ()
@property (nonatomic,strong)UIImageView *pro_imageview;
@property (nonatomic,strong)UIButton *pro_var_button;

@end

@implementation cls_kaishiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pro_jinbobtn.hidden = true;
    self.pro_backbtn.hidden = true;
    
    [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(0, 0)]];
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"img_login_dlbg"];
        var_imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:var_imageview];
        self.pro_imageview = var_imageview;
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_login_btn_dl"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:500 RPY:570 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b)
         {
            
            [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(1, 0)]];
            cls_homepageViewController *mainvc =   [[cls_homepageViewController alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
        } Event:64];
        var_button.pro_viewtagname = @"sss";
        [self.view addSubview:var_button];
        self.pro_var_button = var_button;
    }
    
}
-(void)viewDidAppear:(BOOL)animated
{
    self.pro_imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.pro_var_button.frame =  [cls_Tool fun_frameWithProportionalValuesForRPX:500 RPY:570 withImage:[cls_Tool fun_imageName:@"img_login_btn_dl"]];
}

@end
