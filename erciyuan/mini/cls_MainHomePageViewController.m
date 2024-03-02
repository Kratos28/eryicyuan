//
//  cls_MainHomePageViewController.m
//  chongshou
//
//  Created by 9130Game on 2023/12/13.
//

#import "cls_MainHomePageViewController.h"
#import "cls_Tool.h"
#import "cls_UIViewFrameCategory.h"
//#import "cls_StashViewController.h"
#import "cls_qiantianfuliViewController.h"
#import "cls_RoleViewController.h"
#import "cls_shangchengViewController.h"
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
        var_imageview.image = [cls_Tool fun_imageName:@"fwpq.jpg"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, 0,b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"福利礼物"] forState:UIControlStateNormal];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(830), RPY(270), b.width, b.height);

        });
        buttonBlock(var_button, ^(UIButton  *btn){
            UIViewController *v = [[cls_qiantianfuliViewController alloc]init];
            v.modalPresentationStyle =  UIModalPresentationFullScreen;
            [self presentViewController:v animated:NO completion:nil];
        
            
        });

        [self.view addSubview:var_button];
    }
    
    
    
    
 
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"主界面下方条"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, RPY(1170),b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
        var_imageview.userInteractionEnabled = YES;
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"fwe" forState:0];
            [var_button setImage:[cls_Tool fun_imageName:@"商店"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(70), RPY(20), b.width, b.height);

            });
            buttonBlock(var_button, ^(UIButton  *btn){
              
                
                    UIViewController *v = [[cls_shangchengViewController alloc]init];
                    v.modalPresentationStyle =  UIModalPresentationFullScreen;
                    [self presentViewController:v animated:NO completion:nil];
            });

            [var_imageview addSubview:var_button];
        }
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"fwe" forState:0];
            [var_button setImage:[cls_Tool fun_imageName:@"排行"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(290), RPY(47), b.width, b.height);

            });
            buttonBlock(var_button, ^(UIButton  *btn){
              
            
                
            });

            [var_imageview addSubview:var_button];
        }
        
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"fwe" forState:0];
            [var_button setImage:[cls_Tool fun_imageName:@"任务"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(435), RPY(47), b.width, b.height);

            });
            buttonBlock(var_button, ^(UIButton  *btn){
              
            
                
            });

            [var_imageview addSubview:var_button];
        }
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"fwe" forState:0];
            [var_button setImage:[cls_Tool fun_imageName:@"背包"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(580), RPY(47), b.width, b.height);

            });
            buttonBlock(var_button, ^(UIButton  *btn){
              
            
                
            });

            [var_imageview addSubview:var_button];
        }
        
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"fwe" forState:0];
            [var_button setImage:[cls_Tool fun_imageName:@"挑战"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(725), RPY(47), b.width, b.height);

            });
            buttonBlock(var_button, ^(UIButton  *btn){
              
            
                
            });

            [var_imageview addSubview:var_button];
        }
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"fwe" forState:0];
            [var_button setImage:[cls_Tool fun_imageName:@"角色"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(895), RPY(30), RPX(60),RPY(60));

            });
            buttonBlock(var_button, ^(UIButton  *btn){
            
                UIViewController *v = [[cls_RoleViewController alloc]init];
                v.modalPresentationStyle =  UIModalPresentationFullScreen;
                [self presentViewController:v animated:NO completion:nil];
            });

            [var_imageview addSubview:var_button];
        }
    }
    
  

    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"界面人物"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(RPX(250), RPY(250),b.width, b.height);
        
    });
    [self.view addSubview:var_imageview];
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setTitle:@"Lv. 1" forState:0];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(120), RPY(30), RPX(100), RPY(50));

        });
        buttonBlock(var_button, ^(UIButton  *btn){
          
        
            
        });

        [self.view addSubview:var_button];
    }

    
}


@end
