//
//  cls_methodViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/9.
//

#import "cls_methodViewController.h"

@interface cls_methodViewController ()
@property (nonatomic, strong) UIButton *pro_methodselectedButton;
@property (nonatomic, strong) UILabel *pro_methodLvButton;

@end

@implementation cls_methodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pro_backbtn.frame = CGRectMake(RPX(40), RPY(10), RPX(50), RPX(50));
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_bg_6"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
 
    
    
    int corlmax = 1;
    
    
    int itemW =  [UIScreen mainScreen].bounds.size.width * 0.265;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        itemW =  RPX(400);
    }
    int itemH =  RPY(100);
    int mariginX = RPX(10);
    int startY = RPY(150);
    int mariginH = RPY(10);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(120);
    
    
    UILabel *var_label= [[UILabel alloc]init];
    var_label.text = @"ATK:100";
    var_label.tag = 1001;
    var_label.textAlignment = NSTextAlignmentCenter;
    var_label.numberOfLines = 0;
    var_label.textColor = [UIColor lightGrayColor];
    var_label.frame = CGRectMake(RPX(600), RPY(200), RPX(400), RPY(100));
    var_label.font = [cls_Tool fun_cusstomFontSize:18];
    [self.view addSubview:var_label];
    
    
    for (int i = 0; i < self.pro_user.pro_methods.count; i++) {
        cls_MethodModel *model = self.pro_user.pro_methods[i];
        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        // 创建按钮并设置属性
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        [b addTarget:self action:@selector(fun_methodSelecte:) forControlEvents:64];
      
     
        // 设置autolayout约束
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        
        
        UILabel *label = [[UILabel alloc]init];
        label.text = [NSString stringWithFormat:@"%ld",model.pro_methodLv];
        label.textColor = [UIColor blackColor];
        label.tag = 6000;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.font = [UIFont systemFontOfSize:10];
        [b addSubview:label];
        
        
        [label.widthAnchor constraintEqualToConstant:RPX(170)].active = YES;
        [label.heightAnchor constraintEqualToConstant:RPY(30)].active = YES;
        //        [label.bottomAnchor constraintEqualToAnchor:b.bottomAnchor constant:0].active = YES;
        NSLayoutConstraint *c =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
        NSLayoutConstraint *c1 =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-RPY(10)];
        [b  addConstraint:c];
        [b  addConstraint:c1];
        if (i == 0)
        {
            [self fun_methodSelecte:b];
        }
        
    }
    
    
    
    
    
    
    

    
    
  
    
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = [NSString stringWithFormat:@"%d/%d",300,self.pro_user.pro_shu];
        var_label.frame = CGRectMake(RPX(700), RPY(420), RPX(100), RPY(100));
        var_label.font = [cls_Tool fun_cusstomFontSize:17];
        var_label.textColor = [UIColor whiteColor];
        var_label.tag  = 5000;
        [self.view addSubview:var_label];
    }
    
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = [NSString stringWithFormat:@"%d/%d",300,self.pro_user.pro_gold];
        var_label.frame = CGRectMake(RPX(1040), RPY(420), RPX(100), RPY(100));
        var_label.font = [cls_Tool fun_cusstomFontSize:17];
        var_label.tag  = 5001;
        var_label.textColor = [UIColor whiteColor];
        [self.view addSubview:var_label];
    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_sj1"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:750 RPY:550 withImage:var_button.currentBackgroundImage];
        [self.view addSubview:var_button];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            cls_userInfo *userinfo = [cls_userInfo fun_getuserInfo];
            cls_MethodModel *method =   userinfo.pro_methods[self.pro_methodselectedButton.tag];
            if (userinfo.pro_gold < 20)
            {
                UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"be short of gold coins" message:@"be short of gold coins" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

                }];
                [vc addAction:action];
                [self presentViewController:vc animated:true completion:nil];
                return;
            }
            
            
            if (userinfo.pro_gold >=300 && userinfo.pro_shu >= 300){
                UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"success" message:@"success" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

                    
                    
                }];
                [vc addAction:action];
                [self presentViewController:vc animated:true completion:nil];
                userinfo.pro_shu  = userinfo.pro_shu - 300;
                userinfo.pro_gold = userinfo.pro_gold - 300;
                method.pro_methodLv = method.pro_methodLv + 1;
                
               UILabel *la =  [self.view viewWithTag:5000];
                la.text = [NSString stringWithFormat:@"%d/%d",300,userinfo.pro_shu];

                UILabel *la1 =  [self.view viewWithTag:5001];
                la1.text = [NSString stringWithFormat:@"%d/%d",300,userinfo.pro_gold];
                
                self.pro_methodLvButton.text  = [NSString stringWithFormat:@"%ld",method.pro_methodLv];

                [userinfo fun_save];
                updateNote;

                return;
            }

            
            
            
            
            
            
            
           
            
        } Event:64];

   
        
    }
}


- (void)fun_methodSelecte:(UIButton *)sender
{
    
    UILabel *label =   [self.view viewWithTag:1001];
    label.text = self.pro_user.pro_methods[sender.tag].pro_methoddecl;
    
    UILabel *lv  =   [sender viewWithTag:6000];
    self.pro_methodLvButton = lv;
    
    if (sender == self.pro_methodselectedButton)
    {
        // 点击已选中的按钮，取消选中
        sender.selected = NO;
        sender.layer.borderWidth = 0.0;
        self.pro_methodselectedButton = nil;
    } else {
        // 取消上一个选中的按钮的选中状态
        self.pro_methodselectedButton.selected = NO;
        self.pro_methodselectedButton.layer.borderWidth = 0.0;
        // 设置当前选中的按钮
        sender.selected = YES;
        sender.layer.borderWidth = 2.0;
        sender.layer.borderColor = [UIColor orangeColor].CGColor;
        self.pro_methodselectedButton = sender;
    }

  
}
@end
