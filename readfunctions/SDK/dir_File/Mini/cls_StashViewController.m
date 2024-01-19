//
//  cls_StashViewController.m
//  Game
//
//  Created by 9130Game on 2023/11/20.
//

#import "cls_StashViewController.h"
#import "cls_ShopModel.h"
@interface cls_StashViewController ()
@property (nonatomic, strong) UIButton *pro_methodselectedButton;

@end

@implementation cls_StashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pro_jinbobtn.hidden = YES;
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_warehouse_bg"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
    
    int corlmax =8;
    
    int itemW =  [UIScreen mainScreen].bounds.size.width * 0.15;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        itemW =  [UIScreen mainScreen].bounds.size.width * 0.1;
    }
    int itemH = itemW;
    int mariginX = RPX(0);
    int startY =RPY(110);
    int mariginH = [UIScreen mainScreen].bounds.size.height * 0.02;;
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(230);
    
    
    
    NSMutableArray *temps =  [cls_warehouseModel fun_getWarehouse];
    
    for (int i = 0; i < temps.count; i++)
    {
        
        cls_warehouseModel *equip =  temps[i];

        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        // 创建按钮并设置属性
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b addTarget:self  action:@selector(fun_methodSelecte:) forControlEvents:64];
        [b setBackgroundImage:[cls_Tool fun_imageName:equip.pro_imageName] forState:UIControlStateNormal];
        CGRect ze = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:b.currentBackgroundImage];
        itemW = ze.size.width;
        itemH = ze.size.height;
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        // 设置autolayout约束
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        
        
        UILabel *label = [[UILabel alloc]init];
        label.text = [NSString stringWithFormat:@"%d",equip.pro_warehouseQuantity];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.font  =  [cls_Tool fun_cusstomFontSize:17];
        [b addSubview:label];
        
        
        [label.widthAnchor constraintEqualToConstant:RPX(30)].active = YES;
        [label.heightAnchor constraintEqualToConstant:RPX(30)].active = YES;
        //        [label.bottomAnchor constraintEqualToAnchor:b.bottomAnchor constant:0].active = YES;
        NSLayoutConstraint *c =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-RPX(10)];
        NSLayoutConstraint *c1 =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-RPX(10)];
        [b  addConstraint:c];
        [b  addConstraint:c1];
        
        
        if (i == 0)
        {
            self.pro_methodselectedButton = b;
        }
        
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self fun_methodSelecte:self.pro_methodselectedButton];
}
- (void)fun_methodSelecte:(UIButton *)sender
{
    
  

    if ([self.pro_methodselectedButton.superview isMemberOfClass:[UIButton class]])
    {
        
        [self.pro_methodselectedButton removeFromSuperview];
    }
    UIButton *btn = [[UIButton alloc]init];
    btn.tag = sender.tag;
    [btn setBackgroundImage:[cls_Tool fun_imageName:@"img_warehouse_xz"] forState:0];
    btn.frame = sender.bounds;
    [sender addSubview:btn];
    
    self.pro_methodselectedButton = btn;

}


@end
