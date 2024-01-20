//
//  ViewController.m
//  erciyuan
//
//  Created by 9130Game on 2023/12/21.
//

#import "ViewController.h"
#import "cls_Tool.h"
#import "cls_MainHomePageViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView loadCate];
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"角色1场景"];

        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        });
        [self.view addSubview:var_imageview];
    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"开始按钮"] forState:UIControlStateNormal];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(b.centerX, RPY(1000), b.width, b.height);

        });
        buttonBlock(var_button, ^(UIButton  *btn){
          
            UIViewController *mainvc =   [[cls_MainHomePageViewController alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationOverCurrentContext|UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
            
        });

        [self.view addSubview:var_button];
    }
    
    
}


@end
