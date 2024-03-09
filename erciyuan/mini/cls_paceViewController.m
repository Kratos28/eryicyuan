//
//  cls_paceViewController.m
//  erciyuan
//
//  Created by k on 2024/3/9.
//

#import "cls_paceViewController.h"

@interface cls_paceViewController ()

@end

@implementation cls_paceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"界面背景"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(RPX(0), RPY(0),self.view.frame.size.width, self.view.frame.size.height);
        
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
            [var_button setTitle:@"背包" forState:0];
            var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(50));
            });
       
            [var_imageview addSubview:var_button];
        }
    }
    
    
}



@end
