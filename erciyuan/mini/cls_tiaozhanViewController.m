//
//  cls_tiaozhanViewController.m
//  erciyuan
//
//  Created by k on 2024/3/16.
//

#import "cls_tiaozhanViewController.h"
#import "cls_FightVC.h"
@interface cls_tiaozhanViewController ()
@property (nonatomic,copy)NSArray *pro_dicst;

@end

@implementation cls_tiaozhanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"角色1场景"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(RPX(0), RPY(0),self.view.width, self.view.height);
        
    });
    var_imageview.userInteractionEnabled = YES;
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
            [var_button setTitle:@"挑战" forState:0];
            var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(50));
            });
       
            [var_imageview addSubview:var_button];
        }
    }
    
    int  corlmax = 1;
    int itemW =  RPX(800);
    int itemH =  RPY(200);
    int mariginX = RPX(50);
    int startY = RPY(100);
    int mariginH =  RPY(0);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(100);
    NSArray *array =    @[
        @{@"name":@"小岐井山",@"gold":@"tiaoz1",@"num":@1,@"jinbi":@60,@"price":@6,@"id":@"com.sxsn.zs6"},
    @{@"name":@"安腾美姬",@"gold":@"tiaoz2",@"num":@5,@"jinbi":@300,@"price":@30,@"id":@"com.sxsn.zs30"},
    @{@"name":@"月川崎岛",@"gold":@"tiaoz3",@"num":@10,@"jinbi":@680,@"price":@68,@"id":@"com.sxsn.zs68"},
    @{@"name":@"工藤新三",@"gold":@"tiaoz4",@"num":@1,@"jinbi":@1280,@"price":@128,@"id":@"com.sxsn.zs128"},
    @{@"name":@"山包奥芳乃",@"gold":@"tiaoz5",@"num":@1,@"jinbi":@1980,@"price":@198,@"id":@"com.sxsn.zs198"},
    @{@"name":@"相原明音",@"gold":@"tiaoz6",@"num":@1,@"jinbi":@3280,@"price":@320,@"id":@"com.sxsn.zs328"}
    ];
//    sel
    self.pro_dicst = array;
    for (int i = 0; i < array.count; i++)
    {
        int row = i / corlmax;
        int col = i % corlmax;
        UIButton *b = [[UIButton alloc]init];
        [var_imageview addSubview:b];
        NSDictionary *ji = array[i];

        [b setTitle:@"" forState:UIControlStateNormal];
        [b setBackgroundImage:[cls_Tool fun_imageName:ji[@"gold"]] forState:0];

        

 
        
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        UIButton *fji = [[UIButton alloc]init];
        
        [fji setTitle:ji[@"name"] forState:0];
        [b addSubview:fji];;
        fji.translatesAutoresizingMaskIntoConstraints = NO;
        [fji.widthAnchor constraintEqualToConstant:RPX(300)].active = YES;
        [fji.heightAnchor constraintEqualToConstant:RPY(30)].active = YES;
        [fji.leadingAnchor constraintEqualToAnchor:b.leadingAnchor constant:RPX(450)].active = YES;
        [fji.topAnchor constraintEqualToAnchor:b.topAnchor constant:RPY(130)].active = YES;
        [b addTarget:self action:@selector(fun_www) forControlEvents:64];
    }
    
}
- (void)fun_www
{
//    UIAlertController *a = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//
//
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//
//    [a addAction:action];
//    [self presentViewController:a animated:YES completion:nil];
    
    UIViewController *v = [[cls_FightVC alloc]init];
    v.modalPresentationStyle =  UIModalPresentationFullScreen;
    [self presentViewController:v animated:NO completion:nil];
    
}
@end
