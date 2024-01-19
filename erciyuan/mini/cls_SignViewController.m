//
//  cls_SignViewController.m
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/6.
//

#import "cls_SignViewController.h"
#import "cls_SigninModel.h"
@interface cls_SignViewController ()

@end

@implementation cls_SignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.pro_jinbobtn.hidden = YES;
    self.pro_backbtn.hidden = YES;
    
    
    UIView *bg = [[UIView alloc]init];
    bg.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    bg.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:bg];
    
    
        UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.pro_viewtagname = @"bg";
        var_imageview.image = [cls_Tool fun_imageName:@"img_sign_bg_sign"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(b.centerX, b.centerY,RPX(650), RPX(380));
            
        });
        [self.view addSubview:var_imageview];
    
    
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_sign_icon_X"] forState:UIControlStateNormal];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(540), RPY(60),b.width, b.height);
        });
        
        
        buttonBlock(var_button, ^(UIButton  *btn){
            
            [self dismissViewControllerAnimated:NO completion:nil];
        });
        
        
        [self.view addSubview:var_button];
    }
    
    
    cls_SigninModel *model =  [cls_SigninModel fun_getSignin][0];
    if (model.pro_shifouqiandao == YES)
    {
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_sign_icon_black"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(135), RPX(90),RPX(55),RPX(50));
            });
            [var_imageview addSubview:var_button];
            
            {
                UIImageView *var_imageview = [[UIImageView alloc]init];
                var_imageview.image = [cls_Tool fun_imageName:@"img_sign_icon_tick"];
                viewFrameBlock(var_imageview,^(UIView *b){
                    b.frame = CGRectMake(b.centerX, b.centerY,b.width, b.height);
                    
                });
                [var_button addSubview:var_imageview];
            }
            
        }
      
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    

    cls_SigninModel *model =  [cls_SigninModel fun_getSignin][0];
    if (model.pro_shifouqiandao == NO)
    {
  
        UIView *var_imageview =  [self.view fun_viewtagName:@"bg"];
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_sign_icon_black"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(175), RPX(135),RPX(70),RPX(75));
            });
            [var_imageview addSubview:var_button];
            
            {
                UIImageView *var_imageview = [[UIImageView alloc]init];
                var_imageview.image = [cls_Tool fun_imageName:@"img_sign_icon_tick"];
                viewFrameBlock(var_imageview,^(UIView *b){
                    b.frame = CGRectMake(b.centerX, b.centerY,b.width, b.height);
                    
                });
                [var_button addSubview:var_imageview];
            }
            
        }
        
        
        cls_userInfo *unserinfo =  [cls_userInfo fun_getuserInfo];
         unserinfo.pro_gold =  unserinfo.pro_gold   + 1000;
         model.pro_shifouqiandao = YES;
         [cls_SigninModel fun_signinSave:model];
        [unserinfo fun_save];
        [[NSNotificationCenter defaultCenter]postNotificationName:[cls_Tool fun_updatejinbiStr] object:nil];
    }
      
    

}

@end
