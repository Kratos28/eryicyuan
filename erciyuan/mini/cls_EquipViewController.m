//
//  cls_EquipViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/8.
//

#import "cls_EquipViewController.h"

@interface cls_EquipViewController ()
@property (nonatomic, strong) UIButton *pro_selectedButton;
@end

@implementation cls_EquipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pro_backbtn.frame = CGRectMake(RPX(20), RPY(20), RPX(60), RPX(60));
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_bg_4"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
    
    
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"100>200";
        var_label.frame =  CGRectMake(RPX(370), RPY(545), RPX(100), RPX(30));
        var_label.font = [cls_Tool fun_cusstomFontSize:20];
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#D7AC8F"];
        var_label.tag =  100;
        [self.view addSubview:var_label];
    }
    
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"100>200";
        var_label.frame =  CGRectMake(RPX(630), RPY(545), RPX(100), RPX(30));
        var_label.font = [cls_Tool fun_cusstomFontSize:20];
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#D7AC8F"];

        var_label.tag =  101;
        [self.view addSubview:var_label];
    }
    
//
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"200";
        var_label.textColor = [UIColor whiteColor];
        var_label.frame =  CGRectMake(RPX(680), RPY(595), RPX(100), RPX(50));
        var_label.font = [cls_Tool fun_cusstomFontSize:21];
        var_label.tag =  102;
        [self.view addSubview:var_label];
    }
    
    
    
    
    
    
    int corlmax = 3;
    int itemW = RPX(140);
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        itemW =  RPX(140);
    }
    int itemH =  RPY(140);;
    int mariginX = RPX(48);
    int startY = RPY(200);
    int mariginH = RPY(23);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(210);
   cls_userInfo *user=   [cls_userInfo fun_getuserInfo];
    for (int i = 0; i < user.pro_zhuangbeis.count; i++) {
        
        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        // 创建按钮并设置属性
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [b addTarget:self action:@selector(fun_selecte:) forControlEvents:64];
 
        
        if (i ==0)
        {
            [self fun_selecte:b];
        }
        b.tag = i;
        // 设置autolayout约束
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        cls_equipeModel *equipeModel =  user.pro_zhuangbeis[i];
        UILabel *label = [[UILabel alloc]init];
        label.text = [NSString stringWithFormat:@"Lv.%d",equipeModel.pro_lv];
        label.textColor = [UIColor whiteColor];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.font = [cls_Tool fun_cusstomFontSize:17];
        label.tag = 1000;
        [b addSubview:label];
        
        
        [label.widthAnchor constraintEqualToConstant:RPX(50)].active = YES;
        [label.heightAnchor constraintEqualToConstant:RPX(30)].active = YES;
        //        [label.bottomAnchor constraintEqualToAnchor:b.bottomAnchor constant:0].active = YES;
        NSLayoutConstraint *c =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
        NSLayoutConstraint *c1 =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        [b  addConstraint:c];
        [b  addConstraint:c1];
      
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_sj"] forState:0];
        var_button.frame = CGRectMake(RPX(350), RPY(600), RPX(220), RPX(50));
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            cls_equipeModel *equip = user.pro_zhuangbeis[self.pro_selectedButton.tag];

  
            if (user.pro_gold < equip.pro_gold)
            {
                UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"be short of gold coins" message:@"be short of gold coins" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

                }];
                [vc addAction:action];
                [self presentViewController:vc animated:true completion:nil];
                return;
            }
            equip.pro_lv = equip.pro_lv + 1;
            UIButton *btn =   [self.view viewWithTag:self.pro_selectedButton.tag];
            UILabel *ji =  [btn viewWithTag: 1000];
            ji.text = [NSString stringWithFormat:@"Lv.%d",equip.pro_lv];
            
        } Event:64];
        [self.view addSubview:var_button];
    }
    
  
    
}
- (void)fun_selecte:(UIButton *)sender
{
    
    cls_userInfo *user=   [cls_userInfo fun_getuserInfo];

    if (sender == self.pro_selectedButton) {
            // 点击已选中的按钮，取消选中
            sender.selected = NO;
            sender.layer.borderWidth = 0.0;
            self.pro_selectedButton = nil;
        } else {
            // 取消上一个选中的按钮的选中状态
            self.pro_selectedButton.selected = NO;
            self.pro_selectedButton.layer.borderWidth = 0.0;

            // 设置当前选中的按钮
            sender.selected = YES;
            sender.layer.borderWidth = 2.0;
            sender.layer.borderColor = [UIColor redColor].CGColor;
            self.pro_selectedButton = sender;
        }
    UILabel *var_l1 = [self.view viewWithTag:100];
    UILabel *var_l2 = [self.view viewWithTag:101];
    UILabel *var_l3 = [self.view viewWithTag:102];
    
    var_l1.text = [NSString stringWithFormat:@"%d>%d",user.pro_HP,user.pro_HP + user.pro_zhuangbeis[sender.tag].pro_shanbi];
    var_l2.text = [NSString stringWithFormat:@"%d>%d",user.pro_ATK,user.pro_ATK + user.pro_zhuangbeis[sender.tag].pro_shanbi];
    var_l3.text = [NSString stringWithFormat:@"%d",user.pro_zhuangbeis[sender.tag].pro_gold];
    
    
    
}


@end
