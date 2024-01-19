//
//  cls_EquipmentViewController.m
//  Game
//
//  Created by 9130Game on 2023/11/23.
//

#import "cls_EquipmentViewController.h"
#import "cls_equipModel.h"
#import "UIView+cls_FW.h"
@interface cls_EquipmentViewController ()
@property (nonatomic,strong)UIButton *pro_sender;
@property (nonatomic,strong) NSMutableArray *pro_ttemp;
@end

@implementation cls_EquipmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_equipment_bg"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.frame = CGRectMake(RPX(1090), RPY(255), RPX(50),RPX(30));
        var_label.font = [cls_Tool fun_cusstomFontSize:20];
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#e1e3ef"];
        [self.view addSubview:var_label];
        var_label.pro_viewtagname = @"hp";
    }
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"200";
        var_label.frame = CGRectMake(RPX(1170), RPY(255), RPX(50),RPX(30));
        var_label.font = [cls_Tool fun_cusstomFontSize:20];
        var_label.textColor = [UIColor colorWithRed:0 green:170/255.0 blue:85/255.0 alpha:1];
        [self.view addSubview:var_label];
        var_label.pro_viewtagname = @"hp1";

    }
    
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"29";
        var_label.frame = CGRectMake(RPX(1090), RPY(325), RPX(50),RPX(30));
        var_label.font = [cls_Tool fun_cusstomFontSize:20];
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#e1e3ef"];
        [self.view addSubview:var_label];
        var_label.pro_viewtagname = @"atk";
    }
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"200";
        var_label.frame = CGRectMake(RPX(1170), RPY(325), RPX(50),RPX(30));
        var_label.font = [cls_Tool fun_cusstomFontSize:20];
        var_label.textColor = [UIColor colorWithRed:0 green:170/255.0 blue:85/255.0 alpha:1];
        [self.view addSubview:var_label];
        var_label.pro_viewtagname = @"atk1";
    }
    
    self.pro_ttemp = [NSMutableArray array];
    
    cls_userInfo *user = [cls_userInfo fun_getuserInfo];
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = [NSString stringWithFormat:@"%d",user.pro_gold];
        var_label.frame = CGRectMake(RPX(940), RPY(545), RPX(50),RPX(30));
        var_label.font = [cls_Tool fun_cusstomFontSize:20];
        var_label.textColor = [UIColor whiteColor];
        [self.view addSubview:var_label];
        var_label.pro_viewtagname = @"gold";
    }
    
    
    
    {
        
        
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = [NSString stringWithFormat:@"%d",user.pro_shu];
        var_label.frame = CGRectMake(RPX(1060), RPY(545), RPX(50),RPX(30));
        var_label.font = [cls_Tool fun_cusstomFontSize:20];
        var_label.textColor = [UIColor whiteColor];
        [self.view addSubview:var_label];
        var_label.pro_viewtagname = @"shuijing";
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_equipment_btn_sj"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:880 RPY:600 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            cls_equipModel *equp =  [cls_equipModel fun_getModel][self.pro_sender.tag];

            if (user.pro_gold >= equp.pro_equipValue.pro_equipValueModelConsumegold && user.pro_shu >=equp.pro_equipValue.pro_equipValueModelConsumeshuijing)
            {
                user.pro_gold = user.pro_gold - equp.pro_equipValue.pro_equipValueModelConsumegold;
                equp.pro_equiplv++;
                [cls_equipModel fun_SingleSave:equp];
                [user fun_save];
                updateNote;
                [self fun_configUI];
            }else
            {
                UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"failture" message:@"shortage of material" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [vc addAction:action];
                [self presentViewController:vc animated:true completion:nil];
            }
             
            
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    
    [self fun_configUI];
    

    
}


- (void)fun_configUI
{
    
    NSArray *zhuangbeis =  [cls_equipModel fun_getModel];
    
    int corlmax = 2;
    [self.pro_ttemp enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    
    int itemW =  [UIScreen mainScreen].bounds.size.width * 0.15;
    int itemH = itemW;
    int mariginX = RPX(360);
    int startY = RPY(200);
    int mariginH = [UIScreen mainScreen].bounds.size.height * 0.02;;
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(50);
    
    
    for (int i = 0; i < zhuangbeis.count; i++) {
        cls_equipModel *equip =  [cls_equipModel fun_getModel][i];
        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b addTarget:self action:@selector(fun_zhuangclick:) forControlEvents:64];
       CGSize sie =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:equip.pro_equipimageName]].size;
        [b setBackgroundImage:[cls_Tool fun_imageName:equip.pro_equipimageName] forState:UIControlStateNormal];
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        itemW = sie.width;
        itemH = sie.height;
        
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        
        
        UILabel *label = [[UILabel alloc]init];
        label.text = [NSString stringWithFormat:@"lv.%d",equip.pro_equiplv];
        label.textColor = [UIColor whiteColor];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.font = [cls_Tool fun_cusstomFontSize:25];
        [b addSubview:label];
        
        [label.widthAnchor constraintEqualToConstant:20].active = YES;
        [label.heightAnchor constraintEqualToConstant:20].active = YES;
        NSLayoutConstraint *c =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
        NSLayoutConstraint *c1 =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5];
        [b  addConstraint:c];
        [b  addConstraint:c1];
        [self.pro_ttemp addObject:b];
        if (i ==0){
            [self fun_zhuangclick:b];
        }
        
    }

    
}

- (void)fun_zhuangclick:(UIButton *)sender
{
    [self.pro_sender removeFromSuperview];
    UIButton *btn = [[UIButton alloc]init];
    btn.tag = sender.tag;
    btn.frame = sender.bounds;
    [sender addSubview:btn];
    
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn.widthAnchor constraintEqualToAnchor:sender.widthAnchor].active = YES;
    [btn.heightAnchor constraintEqualToAnchor:sender.heightAnchor].active = YES;
    [btn.leadingAnchor constraintEqualToAnchor:sender.leadingAnchor constant:0].active = YES;
    [btn.topAnchor constraintEqualToAnchor:sender.topAnchor constant:0].active = YES;
    [btn setBackgroundImage:[cls_Tool fun_imageName:@"img_shop_xz"] forState:0];
    self.pro_sender = btn;
    cls_equipModel *equp =  [cls_equipModel fun_getModel][sender.tag];

    
    UILabel *hp =   [self.view fun_viewtagName:@"hp"];
    hp.text = [NSString stringWithFormat:@"%d",equp.pro_equipValue.pro_equipValueModelHP];
    UILabel *hp1 =   [self.view fun_viewtagName:@"hp1"];
    hp1.text = [NSString stringWithFormat:@"%d",equp.pro_equipnextValue.pro_equipValueModelHP];
    
    UILabel *atk =   [self.view fun_viewtagName:@"atk"];
    atk.text = [NSString stringWithFormat:@"%d",equp.pro_equipValue.pro_equipValueModelATK];
    UILabel *atk1 =     [self.view fun_viewtagName:@"atk1"];
    atk1.text = [NSString stringWithFormat:@"%d",equp.pro_equipnextValue.pro_equipValueModelATK];

    UILabel *gold =   [self.view fun_viewtagName:@"gold"];
    gold.text = [NSString stringWithFormat:@"%d",equp.pro_equipValue.pro_equipValueModelConsumegold];

    UILabel *shuijing = [self.view fun_viewtagName:@"shuijing"];
    shuijing.text = [NSString stringWithFormat:@"%d",equp.pro_equipValue.pro_equipValueModelConsumeshuijing];
    
}


@end
