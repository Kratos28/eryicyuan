//
//  cls_ShopViewController.m
//  Game
//
//  Created by 9130Game on 2023/11/21.
//

#import "cls_ShopViewController.h"
#import "cls_ShopModel.h"
#import "cls_warehouseModel.h"
@interface cls_ShopViewController ()
@property (nonatomic,strong)UIButton *pro_shopsender;
@end

@implementation cls_ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_shop_bg"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
  
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_signin_btn_gb"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:980 RPY:170 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            [target dismissViewControllerAnimated:NO completion:nil];
            
            
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    
    NSArray *zhuangbeis =  [cls_ShopModel fun_getShops];
    
    int corlmax = 3;

    
    
    int itemW =  [UIScreen mainScreen].bounds.size.width * 0.15;
    int itemH = itemW;
    int mariginX =  RPX(10);
    int startY = RPY(200);
    int mariginH = RPY(0);
    CGFloat const startX = RPX(520);
    for (int i = 0; i < zhuangbeis.count; i++) {
        
        cls_ShopModel *model =  zhuangbeis[i];
        
        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        // 创建按钮并设置属性
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        [b setImage:[cls_Tool fun_imageName:model.pro_shopImageName] forState:UIControlStateNormal];
       CGSize szie = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:model.pro_shopImageName]].size;
        itemW = szie.width;
        itemH = szie.height;
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        // 设置autolayout约束
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        [b addTarget:self action:@selector(fun_shopSlect:) forControlEvents:64];
        
        if (i == 0)
        {
            [self fun_shopSlect:b];
        }
    }
    
}
- (void)fun_shopSlect:(UIButton *)sender
{
    [self.pro_shopsender removeFromSuperview];
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
    self.pro_shopsender = btn;
    
    
    
    
    cls_ShopModel *shop =  [cls_ShopModel fun_getShops][sender.tag];

   cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    if (user.pro_gold >= shop.pro_shopGold)
    {
        
        
        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:@"Whether to buy" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         
            
            user.pro_gold = user.pro_gold - shop.pro_shopGold;
            [user fun_save];
            
            cls_warehouseModel *equip =   [cls_warehouseModel fun_getWarehouse][sender.tag];
            equip.pro_warehouseQuantity  ++;
            [cls_warehouseModel fun_warehouseSingleSave:equip];
            
            updateNote;
            
        }];
        [vc addAction:ok];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [vc addAction:cancel];
        [self presentViewController:vc animated:true completion:nil];
        
      
    }else{
        
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"be short of gold coins";
        var_label.textAlignment = NSTextAlignmentCenter;
        var_label.frame = CGRectMake(RPX(0), RPY(200), self.view.frame.size.width, RPY(300));
        var_label.font = [cls_Tool fun_cusstomFontSize:40];
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#e1e3ef"];
        [self.view addSubview:var_label];
        
        
        [UIView animateWithDuration:2 animations:^{
            var_label.frame = CGRectMake(RPX(0), RPY(0), self.view.frame.size.width, RPY(300));
        } completion:^(BOOL finished) {
            [var_label removeFromSuperview];
        }];
        
    }
    
  
    
}


@end
