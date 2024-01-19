//
//  cls_victoryViewController.m
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/10.
//

#import "cls_victoryViewController.h"
#import "cls_userInfo.h"
#import "cls_warehouseModel.h"
@interface cls_victoryViewController ()

@end

@implementation cls_victoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.pro_jinbobtn.hidden =YES;
    cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    user.pro_guanshu = user.pro_guanshu + 1;
    user.pro_gold =user.pro_gold + 50;
    [user fun_save];
    [[NSNotificationCenter defaultCenter]postNotificationName:[cls_Tool fun_updatejinbiStr] object:nil];
    NSArray *temp =  [cls_warehouseModel fun_getWarehouse];
    for (int i = 0;i<temp.count;i++){
        cls_warehouseModel * m  =  temp[i];
        if ([m.pro_warehousename isEqualToString:@"medicine"]||
            [m.pro_warehousename isEqualToString:@"Breakthrough"] ||
            [m.pro_warehousename isEqualToString:@"Skill"]){
            m.pro_warehouseQuantity ++;
            [cls_warehouseModel fun_warehouseSingleSave:m];
        }
        
    }
    
    [user fun_save];
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"img_jiesuan_bg_win"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
            
        });
        var_imageview.userInteractionEnabled = YES;
        [self.view addSubview:var_imageview];
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_jiesuan_icon_agent"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(250), RPY(180),b.width, b.height);
            });
            [var_imageview addSubview:var_button];
        }
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_jiesuan_icon_Skill fragment"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(320), RPY(180),b.width, b.height);
            });
            [var_imageview addSubview:var_button];
        }
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_jiesuan_icon_Breakthrough"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(390), RPY(180),b.width, b.height);
            });
            [var_imageview addSubview:var_button];
        }
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_jiesuan_btn_back"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(240), RPY(280),b.width, b.height);
            });
            [var_imageview addSubview:var_button];
            buttonBlock(var_button, ^(UIButton  *btn){
                NSLog(@"img_jiesuan_btn_back");
                [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            });

        }
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_jiesuan_btn_next"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(370), RPY(280),b.width, b.height);
            });
            buttonBlock(var_button, ^(UIButton  *btn){
                NSLog(@"img_jiesuan_btn_next");

                [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                
            });
            [var_imageview addSubview:var_button];
        }
    }
    
 
    
    
}


@end
