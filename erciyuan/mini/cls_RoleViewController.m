//
//  cls_RoleViewController.m
//  erciyuan
//
//  Created by k on 2024/2/8.
//

#import "cls_RoleViewController.h"

@interface cls_RoleViewController ()

@end

@implementation cls_RoleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"角色1场景"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(RPX(0), RPY(0),self.view.width, self.view.height);
        
    });
    [self.view addSubview:var_imageview];

    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"jiemianlan"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(RPX(0), RPY(0),b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"角色" forState:0];
            var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(50));
            });
       
            [var_imageview addSubview:var_button];
        }
    }
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"角色1"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(b.centerX, b.centerY,b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
    }
    
    
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"shuxlan"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(b.centerX, b.centerY,b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
    }
    
}


@end
