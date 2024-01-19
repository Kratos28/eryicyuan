//
//  cls_SigninViewController.m
//  Game
//
//  Created by 9130Game on 2023/11/20.
//

#import "cls_SigninViewController.h"
#import "cls_SigninModel.h"
@interface cls_SigninViewController ()
@property (nonatomic,strong)UIButton *pro_signginbutton;
@end

@implementation cls_SigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_signin_bg"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
    
    NSArray *zhuangbeis =  [cls_SigninModel fun_getSignin];
    
    int corlmax = 3;
    
    
    
    int itemW =  [UIScreen mainScreen].bounds.size.width * 0.15;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        itemW =  [UIScreen mainScreen].bounds.size.width * 0.1;
    }
    int itemH = itemW;
    int mariginX = RPX(10);
    int startY = RPX(240);
    int mariginH = RPX(10);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(520);
    
    
    for (int i = 0; i < zhuangbeis.count; i++) {
        
        cls_SigninModel *sign =  zhuangbeis[i];
        
        
        
        
        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        // 创建按钮并设置属性
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setBackgroundImage:[cls_Tool fun_imageName:sign.pro_signinImageName] forState:UIControlStateNormal];
        [b setBackgroundImage:nil forState:UIControlStateHighlighted];
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i + 100;
        itemW  = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:sign.pro_signinImageName]].size.width;
        itemH =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:sign.pro_signinImageName]].size.height;
        
        // 设置autolayout约束
        b.translatesAutoresizingMaskIntoConstraints = NO;
        if (i == zhuangbeis.count - 1)
        {
            [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
            [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
            [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:RPX(950)].active = YES;
            [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:RPX(240)].active = YES;
        }else
        {
            [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
            [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
            [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
            [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        }
        
        
         if (sign.pro_shifouqiandao)
         {
            
             b.enabled = NO;
             UIButton *btn = [[UIButton alloc]init];
             btn.translatesAutoresizingMaskIntoConstraints = false;
             [btn setBackgroundImage:[cls_Tool fun_imageName:@"img_signin_ylq1"] forState:0];
             [b addSubview:btn];
             
             
                 [btn.widthAnchor constraintEqualToConstant:itemW].active = YES;
                 [btn.heightAnchor constraintEqualToConstant:itemH].active = YES;
                 [btn.leadingAnchor constraintEqualToAnchor:b.leadingAnchor constant:0].active = YES;
                 [btn.topAnchor constraintEqualToAnchor:b.topAnchor constant:0].active = YES;
             
         }else
         {
             [b addTarget:self action:@selector(fun_buttonTouchUp:) forControlEvents:UIControlEventTouchUpInside];

         }
    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_signin_btn_gb"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:1100 RPY:170 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            
            [target dismissViewControllerAnimated:YES completion:nil];
            
        } Event:64];
        [self.view addSubview:var_button];
    }
}



- (void)fun_buttonTouchUp:(UIButton *)sender
{
    if (sender.tag == 100)
    {
        cls_SigninModel *signModel =  [cls_SigninModel fun_getSignin][sender.tag-100];
         if (!signModel.pro_shifouqiandao)
         {
                 sender.enabled = NO;


             
             UIButton *btn = [[UIButton alloc]init];
             [btn setBackgroundImage:[cls_Tool fun_imageName:@"img_signin_ylq1"] forState:0];
             [sender addSubview:btn];
             btn.frame = sender.bounds;
             UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"success" message:@"success" preferredStyle:UIAlertControllerStyleAlert];
             UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                 
                 UIButton *b = [self.view viewWithTag:sender.tag];
                 if (signModel.pro_shifouqiandao)
                 {
                         b.enabled = NO;
                 }
                 
             }];
             [vc addAction:action];
             [self presentViewController:vc animated:true completion:nil];
             signModel.pro_shifouqiandao = true;
             [cls_SigninModel fun_signinSave:signModel];
             
             cls_userInfo *u =  [cls_userInfo fun_getuserInfo];
             u.pro_gold = u.pro_gold + signModel.pro_signinGold;
             [u fun_save];
             updateNote;
           
         }
    }else
    {
        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:@"Please sign in the next day" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           
       
            
        }];
        [vc addAction:action];
        [self presentViewController:vc animated:true completion:nil];
    }

    

}

@end
