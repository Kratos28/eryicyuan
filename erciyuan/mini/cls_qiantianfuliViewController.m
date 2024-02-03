//
//  cls_qiantianfuliViewController.m
//  erciyuan
//
//  Created by Kratos on 2024/1/27.
//

#import "cls_qiantianfuliViewController.h"

@interface cls_qiantianfuliViewController ()

@end

@implementation cls_qiantianfuliViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"界面背景"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(RPX(0), RPY(0),b.width, b.height);
        
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
            [var_button setTitle:@"福利" forState:0];
            var_button.titleLabel.font = [UIFont boldSystemFontOfSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(70));
            });
       
            [var_imageview addSubview:var_button];
        }
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setTitle:@"七天福利" forState:0];
        [var_button setBackgroundImage:[UIImage imageNamed:@"按钮3"] forState:0];
        var_button.titleLabel.font = [UIFont boldSystemFontOfSize:40];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(b.centerX, RPY(100),RPX(300), RPY(70));
        });
   
        [self.view addSubview:var_button];
    }

    int  corlmax = 3;

    int itemW =  RPX(300);
    int itemH =  RPY(300);
    int mariginX = RPX(30);
    int startY = RPY(200);
    int mariginH =  RPY(60);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(50);
    

    
    NSArray *array =    @[
        @{@"name":@"medicine",@"gold":@"商店框",@"num":@1,@"jinbi":@100},
    @{@"name":@"Skill",@"gold":@"商店框",@"num":@5,@"jinbi":@1000},
    @{@"name":@"Breakthrough",@"gold":@"商店框",@"num":@10,@"jinbi":@1000},
    @{@"name":@"Dog",@"gold":@"商店框",@"num":@1,@"jinbi":@10000},
    @{@"name":@"birdie",@"gold":@"img_store_btn_Pet roll100",@"num":@1,@"jinbi":@10000},
        @{@"name":@"birdie",@"gold":@"img_store_btn_Pet roll100",@"num":@1,@"jinbi":@10000},
        @{@"name":@"birdie",@"gold":@"img_store_btn_Pet roll100",@"num":@1,@"jinbi":@10000},
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
        [b addTarget:self action:@selector(fun_click:) forControlEvents:64];
        
        
        UIButton *label = [[UIButton alloc]init];
        [b addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        
    }
    
}

@end
