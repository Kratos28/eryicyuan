//
//  ViewController.m
//  chongshouduijue
//
//  Created by 9130Game on 2023/12/25.
//

#import "cls_VWWViewController.h"
#import "cls_Tool.h"
#import "cls_MainHomePageViewController.h"
@interface cls_VWWViewController ()

@end

@implementation cls_VWWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView loadCate];
    
    self.pro_backbtn.hidden = YES;
    self.pro_shushu.hidden = YES;
    self.pro_jinbobtn.hidden = YES;
    [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(0, 0)]];
    
       {
           UIImageView *var_imageview = [[UIImageView alloc]init];
           var_imageview.image = [cls_Tool fun_imageName:@"img_start_bg_shouye"];
           viewFrameBlock(var_imageview,^(UIView *b){
               b.frame = CGRectMake(0, 0,self.view.width, self.view.height);
   
           });
           [self.view addSubview:var_imageview];
       }
   
   
       {
           UIImageView *var_imageview = [[UIImageView alloc]init];
           var_imageview.image = [cls_Tool fun_imageName:@"img_start_image_player"];
           viewFrameBlock(var_imageview,^(UIView *b){
               b.frame = CGRectMake(b.centerX - RPX(60), b.centerY,b.width, b.height);
           });
           [self.view addSubview:var_imageview];
       }
   
   
       {
           UIImageView *var_imageview = [[UIImageView alloc]init];
           var_imageview.image = [cls_Tool fun_imageName:@"img_anim_dh_00"];
           viewFrameBlock(var_imageview,^(UIView *b){
               b.frame = CGRectMake(b.centerX + RPX(60), b.centerY +RPY(50),RPX(120), RPX(120));
           });
           [self.view addSubview:var_imageview];
       }
   //
       
       {
           UIButton *var_button = [[UIButton alloc]init];
           [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_start_btn_start"] forState:UIControlStateNormal];
           
           viewFrameBlock(var_button,^(UIView *b){
               b.frame =  CGRectMake(b.centerX, RPY(300),b.width, b.height);
           });
           [var_button addTarget:self action:@selector(jij) forControlEvents:64];
           
           [self.view addSubview:var_button];
       }
       
}





- (void)jij{
    
    
    [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(1, 0)]];
    UIViewController *mainvc =   [[cls_MainHomePageViewController alloc]init];
    mainvc.modalPresentationStyle = UIModalPresentationOverCurrentContext|UIModalPresentationFullScreen;
    mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:mainvc animated:NO completion:nil];

}



@end
