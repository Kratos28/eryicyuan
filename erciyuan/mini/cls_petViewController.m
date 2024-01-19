//
//  cls_petViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/9.
//

#import "cls_petViewController.h"

@interface cls_petViewController ()
@property (nonatomic,strong)NSMutableArray *pro_xingxing;
@property (nonatomic,strong)NSMutableArray *pro_labels;

@end

@implementation cls_petViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pro_backbtn.frame = CGRectMake(RPX(60), RPY(20), RPX(50), RPX(50));
    self.pro_xingxing  = [NSMutableArray array];
    self.pro_labels = [NSMutableArray array];
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_bg_5"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
    
    
    
    int corlmax = 1;

    
    int itemW =  [UIScreen mainScreen].bounds.size.width * 0.1;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        itemW =  [UIScreen mainScreen].bounds.size.width * 0.1;
    }
    int itemH = RPY(30);
    int mariginX = [UIScreen mainScreen].bounds.size.width * 0.06;
    int startY = RPY(220);
    int mariginH = [UIScreen mainScreen].bounds.size.height * 0.035;;
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX =  RPX(500);
    
    
    cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    for (int i = 0; i < 4; i++)
    {
         int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        // 创建按钮并设置属性
        UIButton *b = [[UIButton alloc]init];
        b.titleLabel.textColor = [cls_Tool fun_colorWithHexString:@"#D59170"];
        b.titleLabel.font = [cls_Tool fun_cusstomFontSize:20];
        [self.view addSubview:b];
        cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
        cls_PetModel *pet = user.pro_petModels.firstObject;
        [self.pro_labels addObject:b];
        switch (i)
        {
            case 0:
            {
                
                [b setTitle:[NSString stringWithFormat:@"%d>%d",pet.pro_petHP ,pet.pro_petHP+50] forState:0];
                break;
            }
            case 1:
            {
                [b setTitle:[NSString stringWithFormat:@"%d>%d",pet.pro_petATK ,pet.pro_petATK+30] forState:0];
                break;
            }
            case 2:
            {
                
                [b setTitle:[NSString stringWithFormat:@"%d>%d",pet.pro_petfangyu ,pet.pro_petfangyu+30] forState:0];
                break;
            }
            case 3:
            {
                
                [b setTitle:[NSString stringWithFormat:@"%d>%d",pet.pro_petspeed ,pet.pro_petspeed + 5] forState:0];
                break;
            }
            default:
                break;
        }
        
        [b setTitleColor:[cls_Tool fun_colorWithHexString:@"#D59170"] forState:0];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        // 设置autolayout约束
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        
        
     
        
        
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        var_button.frame = CGRectMake(RPX(350), RPY(480), RPX(200), RPX(50));
        [var_button setTitleColor:[UIColor blackColor] forState:0];
        var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:20];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_sj"] forState:0];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b)
         {
            cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
            cls_PetModel *pet = user.pro_petModels.firstObject;
            if (user.pro_gold < user.pro_petModels.firstObject.pro_petgold)
            {

                UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"be short of gold coins" message:@"be short of gold coins" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

                }];
                [vc addAction:action];
                [self presentViewController:vc animated:true completion:nil];
                return;
            }
      
            
            user.pro_gold = user.pro_gold -  pet.pro_petgold;
            pet.pro_petHP = pet.pro_petHP + 50;
            pet.pro_petspeed = pet.pro_petspeed + 5;
            pet.pro_petATK = pet.pro_petATK + 30;
            pet.pro_petfangyu = pet.pro_petfangyu + 30;
            
            pet.pro_petlv = pet.pro_petlv + 1;
            [user fun_save];
            updateNote;
            
            [self refreshButtons];
            
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    
    [self fun_xingxing];
}
- (void)fun_xingxing
{
    int corlmax = 5;

    int itemW =  [UIScreen mainScreen].bounds.size.width * 0.045;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        itemW = RPX(50);
    }
    int itemH = itemW;
    int mariginX = RPX(0);
    int startY = RPY(198);
    int mariginH =  RPX(5);
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX =  RPX(950);
    
    
    cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    for (int i = 0; i < 5; i++) {
        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        // 创建按钮并设置属性
        UIButton *b = [[UIButton alloc]init];
        b.titleLabel.textColor = [UIColor blackColor];
        b.titleLabel.font = [cls_Tool fun_cusstomFontSize:20];
        [self.view addSubview:b];
        [b setBackgroundImage:[cls_Tool fun_imageName:@"img_s1"] forState:0];
        if (user.pro_petModels.firstObject.pro_petlv-1 >= i )
        {
            [b setBackgroundImage:[cls_Tool fun_imageName:@"img_s2"] forState:0];
        }
        [b setTitleColor:[UIColor blackColor] forState:0];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        CGRect ret =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:b.currentBackgroundImage];
        b.tag = i;
        
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        [self.pro_xingxing addObject:b];
    }
    
    
    
    
    {
        UILabel *var_button = [[UILabel alloc]init];
        var_button.text = [NSString stringWithFormat:@"%ld",user.pro_gold];
        var_button.textColor = [UIColor whiteColor];
        
        var_button.frame = CGRectMake(RPX(460), RPY(560), RPX(100), RPX(50));
        
        
        [self.view addSubview:var_button];
    }
}

- (void)refreshButtons {
    // 在这里刷新按钮的状态和属性
    cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    cls_PetModel *pet = user.pro_petModels.firstObject;

    for (int i = 0; i < self.pro_xingxing.count; i++) {
    
        UIButton *button = self.pro_xingxing[i];
        [button setBackgroundImage:[cls_Tool fun_imageName:@"img_s1"] forState:0];        
        if (pet.pro_petlv-1 >= i )
        {
            [button setBackgroundImage:[cls_Tool fun_imageName:@"img_s2"] forState:0];
        }
    }
    
    
    
    for (int i = 0; i <   self.pro_labels.count; i++) {
        UIButton *b  =self.pro_labels[i];
        switch (i) {
            case 0:
            {
                
                [b setTitle:[NSString stringWithFormat:@"%d>%d",pet.pro_petHP ,pet.pro_petHP+50] forState:0];
                break;
            }
            case 1:
            {
                [b setTitle:[NSString stringWithFormat:@"%d>%d",pet.pro_petATK ,pet.pro_petATK+30] forState:0];
                break;
            }
            case 2:
            {
                
                [b setTitle:[NSString stringWithFormat:@"%d>%d",pet.pro_petfangyu ,pet.pro_petfangyu+30] forState:0];
                break;
            }
            case 3:
            {
                [b setTitle:[NSString stringWithFormat:@"%d>%d",pet.pro_petspeed ,pet.pro_petspeed + 5] forState:0];
                break;
            }
            default:
                break;
        }

        
    }
    
    
    
    
}
@end
