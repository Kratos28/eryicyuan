//
//  cls_FightViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/10.
//

#import "cls_FightViewController.h"
#import "cls_HealthBarView.h"
#import "cls_renwuButton.h"
#import "cls_conGratuiLationsViewController.h"
#import "cls_Timer.h"
@interface cls_FightViewController () <HealthBarViewDele>
@property (nonatomic,strong)cls_HealthBarView *pro_wofangHealth;
@property (nonatomic,strong)cls_HealthBarView *pro_difangHealth;
@property (nonatomic,strong) cls_renwuButton *pro_wofangrenwuButton;
@property (nonatomic,strong) cls_renwuButton *pro_difangrenwuButton;
@property (nonatomic,assign)bool pro_istouch;

@property (nonatomic,strong)cls_Timer *timers;
@end

@implementation cls_FightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pro_jinbobtn.hidden = true;
    self.pro_shushu.hidden = true;
    self.pro_backbtn .frame = CGRectMake(RPX(60), RPY(120), RPX(80), RPX(80));
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_bg_2"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
    self.timers = [[cls_Timer alloc]initTarget:self selector:@selector(fun_fire) repeats:true interval:3];
    self.pro_wofangHealth =  [[cls_HealthBarView alloc]initWithFrame:CGRectMake(RPX(126), RPY(57), RPX(235), RPX(25)) withwofang:YES];
    
    self.pro_wofangHealth.pro_currentValue = 100;
    self.pro_wofangHealth.delegate = self;
    [self.view addSubview:self.pro_wofangHealth];






    self.pro_difangHealth =  [[cls_HealthBarView alloc]initWithFrame:CGRectMake(RPX(930), RPY(57), RPX(235), RPX(25)) withwofang:NO];
    self.pro_difangHealth.pro_currentValue =100;
    self.pro_difangHealth.delegate = self;
    [self.view addSubview:self.pro_difangHealth];




    

    
    cls_renwuButton *var_button =   [[cls_renwuButton alloc]initWithFrame:CGRectMake(RPX(100), RPY(200), RPX(310), RPY(500)) withwofang:true];
    var_button.frame = CGRectMake(RPX(100), RPY(200), RPX(500), RPY(500));
    [self.view addSubview:var_button];
    self.pro_wofangrenwuButton = var_button;





    cls_renwuButton *difangvar_button =   [[cls_renwuButton alloc]initWithFrame:CGRectMake(RPX(800), RPY(200), RPX(500), RPY(500)) withwofang:false];
    [self.view addSubview:difangvar_button];
    self.pro_difangrenwuButton = difangvar_button;
    
    
}


- (void)fun_HealthBarViewwiwangDelegate:(cls_HealthBarView *)barView
{
    [self.timers fun_stopTimer];
    if (barView == self.pro_wofangHealth)
    {
        
        UIViewController *mainvc =   [[cls_conGratuiLationsViewController alloc]init];
        mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
        mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:mainvc animated:NO completion:nil];
        NSLog(@"我放死亡");
    }else
    {
        
        UIViewController *mainvc =   [[cls_conGratuiLationsViewController alloc]init];
        mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
        mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:mainvc animated:NO completion:nil];
        NSLog(@"敌方死亡");
    }
}

- (void)fun_kouxuediren:(BOOL)diren com:(void(^)(void))com
{
    if (diren)
    {
        int health = self.pro_difangHealth.pro_currentValue;
        health =  health - 10;
        self.pro_difangHealth.pro_currentValue = health;
        
    }else
    {
        int health = self.pro_wofangHealth.pro_currentValue;
        health =  health - 7;
        self.pro_wofangHealth.pro_currentValue = health;
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        com();
    });
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_vs"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    __weak  cls_FightViewController *weakSelf = self;;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [var_imageview removeFromSuperview];
        [weakSelf.timers fun_startTimer];

    });

}

- (void)dealloc
{
//    [self.timers fun_stopTimer];
    NSLog(@"shifang");
}


- (void)fun_fire
{
    
      if (self.pro_istouch)
      {
          return;;
      }
      
    __weak  cls_FightViewController *weakSelf = self;;
      self.pro_istouch = true;
      [self.pro_difangrenwuButton fun_texiaocompletion:^{
          [weakSelf fun_kouxuediren:true com:^{
              [weakSelf.pro_wofangrenwuButton fun_texiaocompletion:^{
                  [weakSelf fun_kouxuediren:false com:^{
                      weakSelf.pro_istouch = false;
                  }];
              }];
              
          }];
 
      }];
}



@end
