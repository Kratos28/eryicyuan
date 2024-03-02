//
//  cls_shangchengViewController.m
//  erciyuan
//
//  Created by k on 2024/3/3.
//

#import "cls_shangchengViewController.h"

@interface cls_shangchengViewController ()
@property (nonatomic,strong)NSMutableArray *zuanshis;
@property (nonatomic,strong)NSMutableArray *daojus;
@end

@implementation cls_shangchengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
self.zuanshis = [NSMutableArray array];
self.daojus = [NSMutableArray array];
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
            [var_button setTitle:@"商店" forState:0];
            var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(50));
            });
       
            [var_imageview addSubview:var_button];
        }
    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"按钮3"] forState:0];
        var_button.frame = CGRectMake(RPX(100), RPY(100),RPX(300), RPY(50));
        [var_button setTitle:@"钻石" forState:0];
        [var_button addTapBlock:^(UIButton * _Nonnull btn) {
   
            
        }];
            [self.view addSubview:var_button];
        
    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"按钮4"] forState:0];
        var_button.frame = CGRectMake(RPX(500), RPY(100),RPX(200), RPY(50));
        [var_button setTitle:@"道具" forState:0];
        [var_button addTapBlock:^(UIButton * _Nonnull btn) {
   
            
        }];
            [self.view addSubview:var_button];
        
    }
    

    
    [self fun_setupzuanshi];
    
}
- (void)fun_daoju
{
    int  corlmax = 3;

    int itemW =  RPX(300);
    int itemH =  RPY(300);
    int mariginX = RPX(30);
    int startY = RPY(200);
    int mariginH =  RPY(60);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(50);
    
    NSArray *array =    @[
        @{@"name":@"medicine",@"gold":@"鞋子",@"num":@1,@"jinbi":@60,@"price":@6,@"id":@"com.sxsn.zs6"},
    @{@"name":@"Skill",@"gold":@"yifu",@"num":@5,@"jinbi":@300,@"price":@30,@"id":@"com.sxsn.zs30"},
    @{@"name":@"Breakthrough",@"gold":@"mofabang",@"num":@10,@"jinbi":@680,@"price":@68,@"id":@"com.sxsn.zs68"},
    @{@"name":@"Dog",@"gold":@"shoutao",@"num":@1,@"jinbi":@1280,@"price":@128,@"id":@"com.sxsn.zs128"},
    @{@"name":@"birdie",@"gold":@"nengliangping roll100",@"num":@1,@"jinbi":@1980,@"price":@198,@"id":@"com.sxsn.zs198"},
        @{@"name":@"birdie",@"gold":@"zhouyu roll100",@"num":@1,@"jinbi":@3280,@"price":@320,@"id":@"com.sxsn.zs328"}
    ];
//    self.pro_dicst = array;
    for (int i = 0; i < array.count; i++)
    {
        int row = i / corlmax;
        int col = i % corlmax;
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        NSDictionary *dict =  array[i];
//        [b setBackgroundImage:[cls_Tool fun_imageName:dict[@"gold"]] forState:UIControlStateNormal];
        [b setBackgroundImage:[cls_Tool fun_imageName:@"商店框"] forState:UIControlStateNormal];
        [b setImage:[cls_Tool fun_imageName:@"钻石1"] forState:UIControlStateNormal];

        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        [b addTarget:self action:@selector(fun_cfww:) forControlEvents:64];


        UIButton *label = [[UIButton alloc]init];
        [b addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
//        [label setImage:[cls_Tool fun_imageName:@"zuans"] forState:UIControlStateNormal];
        [label setTitle:[NSString stringWithFormat:@"¥%d",[dict[@"jinbi"]intValue]] forState:UIControlStateNormal];

//        [label setTitle:@"1000" forState:UIControlStateNormal];

        [label.widthAnchor constraintEqualToConstant:RPX(200)].active = YES;
        [label.heightAnchor constraintEqualToConstant:RPY(40)].active = YES;
        [label.centerXAnchor constraintEqualToAnchor:b.centerXAnchor constant:0].active = YES;
        NSLayoutConstraint *c =  [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:1 toItem:b attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
        [b addConstraint:c];
        [self.zuanshis addObject:b];
    }
}
- (void)fun_setupzuanshi
{
    int  corlmax = 3;

    int itemW =  RPX(300);
    int itemH =  RPY(300);
    int mariginX = RPX(30);
    int startY = RPY(200);
    int mariginH =  RPY(60);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(50);
    
    NSArray *array =    @[
        @{@"name":@"medicine",@"gold":@"商店框",@"num":@1,@"jinbi":@60,@"price":@6,@"id":@"com.sxsn.zs6"},
    @{@"name":@"Skill",@"gold":@"商店框",@"num":@5,@"jinbi":@300,@"price":@30,@"id":@"com.sxsn.zs30"},
    @{@"name":@"Breakthrough",@"gold":@"商店框",@"num":@10,@"jinbi":@680,@"price":@68,@"id":@"com.sxsn.zs68"},
    @{@"name":@"Dog",@"gold":@"商店框",@"num":@1,@"jinbi":@1280,@"price":@128,@"id":@"com.sxsn.zs128"},
    @{@"name":@"birdie",@"gold":@"img_store_btn_Pet roll100",@"num":@1,@"jinbi":@1980,@"price":@198,@"id":@"com.sxsn.zs198"},
        @{@"name":@"birdie",@"gold":@"img_store_btn_Pet roll100",@"num":@1,@"jinbi":@3280,@"price":@320,@"id":@"com.sxsn.zs328"}
    ];
//    self.pro_dicst = array;
    for (int i = 0; i < array.count; i++)
    {
        int row = i / corlmax;
        int col = i % corlmax;
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        NSDictionary *dict =  array[i];
//        [b setBackgroundImage:[cls_Tool fun_imageName:dict[@"gold"]] forState:UIControlStateNormal];
        [b setBackgroundImage:[cls_Tool fun_imageName:@"商店框"] forState:UIControlStateNormal];
        [b setImage:[cls_Tool fun_imageName:@"钻石1"] forState:UIControlStateNormal];

        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        [b addTarget:self action:@selector(fun_cfww:) forControlEvents:64];


        UIButton *label = [[UIButton alloc]init];
        [b addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
//        [label setImage:[cls_Tool fun_imageName:@"zuans"] forState:UIControlStateNormal];
        [label setTitle:[NSString stringWithFormat:@"¥%d",[dict[@"jinbi"]intValue]] forState:UIControlStateNormal];

//        [label setTitle:@"1000" forState:UIControlStateNormal];

        [label.widthAnchor constraintEqualToConstant:RPX(200)].active = YES;
        [label.heightAnchor constraintEqualToConstant:RPY(40)].active = YES;
        [label.centerXAnchor constraintEqualToAnchor:b.centerXAnchor constant:0].active = YES;
        NSLayoutConstraint *c =  [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:1 toItem:b attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
        [b addConstraint:c];
        [self.zuanshis addObject:b];
    }
}
- (void)fun_cfww:(UIButton *)sender
{
    
}

@end
