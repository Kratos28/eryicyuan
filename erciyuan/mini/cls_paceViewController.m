//
//  cls_paceViewController.m
//  erciyuan
//
//  Created by k on 2024/3/9.
//

#import "cls_paceViewController.h"

@interface cls_paceViewController ()
@property (nonatomic,copy)NSArray *pro_dicst;

@end

@implementation cls_paceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
            [var_button setTitle:@"背包" forState:0];
            var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(50));
            });
       
            [var_imageview addSubview:var_button];
        }
    }
    
    int  corlmax = 3;

    int itemW =  RPX(250);
    int itemH =  RPY(200);
    int mariginX = RPX(50);
    int startY = RPY(180);
    int mariginH =  RPY(60);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(100);
    

    
    
    NSArray *array =    @[
        @{@"name":@"medicine",@"gold":@"鞋子",@"num":@1,@"jinbi":@60,@"price":@6,@"id":@"com.sxsn.zs6"},
    @{@"name":@"Skill",@"gold":@"yifu",@"num":@5,@"jinbi":@300,@"price":@30,@"id":@"com.sxsn.zs30"},
    @{@"name":@"Breakthrough",@"gold":@"mofabang",@"num":@10,@"jinbi":@680,@"price":@68,@"id":@"com.sxsn.zs68"},
    @{@"name":@"Dog",@"gold":@"shoutao",@"num":@1,@"jinbi":@1280,@"price":@128,@"id":@"com.sxsn.zs128"},
    @{@"name":@"birdie",@"gold":@"nengliangping",@"num":@1,@"jinbi":@1980,@"price":@198,@"id":@"com.sxsn.zs198"},
    @{@"name":@"birdie",@"gold":@"zhouyu",@"num":@1,@"jinbi":@3280,@"price":@320,@"id":@"com.sxsn.zs328"}
    ];
//    sel
    self.pro_dicst = array;
    for (int i = 0; i < array.count; i++)
    {
        int row = i / corlmax;
        int col = i % corlmax;
        UIButton *b = [[UIButton alloc]init];
        [var_imageview addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        
        NSDictionary *ji = array[i];
        UIButton *fji = [[UIButton alloc]init];
        [fji setBackgroundImage:[cls_Tool fun_imageName:ji[@"gold"]] forState:0];
        [b addSubview:fji];
        fji.frame = CGRectMake(RPX(70), RPY(50), RPX(100), RPY(100));
        
        
        NSDictionary *dict =  array[i];
        [b setBackgroundImage:[cls_Tool fun_imageName:@"zhuangbeikuang"] forState:UIControlStateNormal];
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.backgroundColor = [UIColor redColor];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        
        [b addTarget:self action:@selector(fun_click:) forControlEvents:64];
        
    }
}



@end
