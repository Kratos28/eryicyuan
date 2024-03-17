//
//  cls_xuanjiaoViewController.m
//  erciyuan
//
//  Created by k on 2024/3/16.
//

#import "cls_xuanjiaoViewController.h"
#import "cls_MainHomePageViewController.h"
@interface cls_xuanjiaoViewController ()
@property (nonatomic,strong)UIImageView *pro_iamgeView;

@property (nonatomic,strong)UIImageView *pro_iamgeView1;

@end

@implementation cls_xuanjiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"角色1场景"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(RPX(0), RPY(0),self.view.frame.size.width, self.view.frame.size.height);
        
    });
    
    
    [self.view addSubview:var_imageview];
    
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"选角按钮"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(RPX(0), RPY(400),b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
    }
    
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"wefw"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(RPX(600), RPY(800),RPX(400), RPY(400));
            
        });
        [self.view addSubview:var_imageview];
        self.pro_iamgeView1 = var_imageview;

    }
    
    
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"角色1"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(RPX(300), RPY(400),b.width, b.height);
            
        });
        
        var_imageview.frame = CGRectMake(RPX(300), RPY(400),RPX(300), RPY(300));

        [self.view addSubview:var_imageview];
                self.pro_iamgeView = var_imageview;

    }
    
    
  
    
    
    
    UIButton *var_button = [[UIButton alloc]init];
    viewFrameBlock(var_button,^(UIView *b){
        b.frame = CGRectMake(RPX(35), RPY(420), RPX(250), RPY(120));
    });


    var_button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [var_button setTitle:@"利希雅" forState:0];
    [var_button setTitleColor:[UIColor colorWithRed:255/255.0 green:219/255.0 blue:158/255.0 alpha:1] forState:0];
    [self.view addSubview:var_button];
    var_button.transform = CGAffineTransformMakeRotation(-M_PI*0.15); // 顺时针旋转 90 度
    var_button.tag  = 100;
    
    UIButton *var_button1 = [[UIButton alloc]init];
    viewFrameBlock(var_button1,^(UIView *b){
        b.frame = CGRectMake(RPX(100), RPY(600), RPX(230), RPY(120));
    });
    [var_button1 setTitle:@"露琪亚" forState:0];
    var_button1.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [var_button1 setTitleColor:[UIColor colorWithRed:255/255.0 green:219/255.0 blue:158/255.0 alpha:1] forState:0];
    [self.view addSubview:var_button1];
    var_button1.tag  = 101;
    
    
    UIButton *var_button2 = [[UIButton alloc]init];
    viewFrameBlock(var_button2,^(UIView *b){
        b.frame = CGRectMake(RPX(60), RPY(760), RPX(250), RPY(120));
    });

    [var_button2 setTitle:@"伊雷娜" forState:0];
    var_button2.transform = CGAffineTransformMakeRotation(M_PI*0.15); // 顺时针旋转 90 度

    var_button2.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [var_button2 setTitleColor:[UIColor colorWithRed:255/255.0 green:219/255.0 blue:158/255.0 alpha:1] forState:0];
    [self.view addSubview:var_button2];
    var_button2.tag  = 102;
    
    
    [var_button addTarget:self action:@selector(ffwewfw:) forControlEvents:64];
    [var_button1 addTarget:self action:@selector(ffwewfw:) forControlEvents:64];
    [var_button2 addTarget:self action:@selector(ffwewfw:) forControlEvents:64];
    
    
    {
        UIButton *var_button2 = [[UIButton alloc]init];
        viewFrameBlock(var_button2,^(UIView *b){
            b.frame = CGRectMake(RPX(400), RPY(1100), RPX(230), RPY(100));
        });
        [var_button2 setBackgroundImage:[cls_Tool fun_imageName:@"确定按钮"] forState:0];
        var_button2.titleLabel.font = [cls_Tool fun_cusstomFontSize:16];
        [var_button2 setTitleColor:[UIColor colorWithRed:255/255.0 green:219/255.0 blue:158/255.0 alpha:1] forState:0];
        [self.view addSubview:var_button2];
        [var_button2 addTarget:self action:@selector(queding) forControlEvents:64];;
    }
}
- (void)queding
{
    
    
    UIViewController *v = [[cls_MainHomePageViewController alloc]init];
    v.modalPresentationStyle =  UIModalPresentationFullScreen;
    [self presentViewController:v animated:NO completion:nil];
}
- (void)ffwewfw:(UIButton *)sender
{
    if (sender.tag == 100)
    {
        
        self.pro_iamgeView .image = [UIImage imageNamed:@"角色1"];
        viewFrameBlock(self.pro_iamgeView,^(UIView *b){
            b.frame = CGRectMake(RPX(300), RPY(400),b.width, b.height);
            
        });
        self.pro_iamgeView1.image = [cls_Tool fun_imageName:@"wefw"];
    }else if (sender.tag == 101)
    {
        
    
        self.pro_iamgeView .image = [UIImage imageNamed:@"角色2"];

        self.pro_iamgeView.frame = CGRectMake(RPX(300), RPY(100),RPX(400), RPY(300));

        self.pro_iamgeView1.image =  [cls_Tool fun_imageName:@"wefw1"];
    }else
    {
        
     
        
        self.pro_iamgeView.frame = CGRectMake(RPX(300), RPY(200),RPX(400), RPY(300));

        self.pro_iamgeView .image = [UIImage imageNamed:@"角色3"];
    }
}


@end
