//
//  cls_BaseViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/7.
//

#import "cls_BaseViewController.h"
#import <objc/runtime.h>
#import <AdSupport/AdSupport.h>

@interface cls_BaseViewController ()

@end

@implementation cls_BaseViewController
- (void)dealloc
{
    NSLog(@"cls_BaseViewController 释放");
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)fun_goback
{
    [self dismissViewControllerAnimated:NO completion:nil];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(injected) name:@"INJECTION_BUNDLE_NOTIFICATION" object:nil];
    

    

    {
        UIButton *var_button = [[UIButton alloc]init];

        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_skill_btn_back"] forState:0];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(10), RPY(20), RPX(150), RPY(70));
        });
//        var_button.frame = CGRectMake(0, 0, 100, 50);
        [var_button addTarget:self action:@selector(fun_goback) forControlEvents:64];
        [self.view addSubview:var_button];
        self.pro_backbtn = var_button;
    }

    cls_userInfo *userinfo =  [cls_userInfo fun_getuserInfo];
    {


        UIButton *var_button = [[UIButton alloc]init];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(540), RPY(20), RPX(150), RPY(30));
        });


        var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:16];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_mian city_icon_gold"]  forState:UIControlStateNormal];
        [var_button setTitleColor:[UIColor colorWithRed:255/255.0 green:219/255.0 blue:158/255.0 alpha:1] forState:0];
        [var_button setTitle:[NSString stringWithFormat:@" %d",userinfo.pro_gold] forState:0];

        [self.view addSubview:var_button];
        self.pro_jinbobtn = var_button;
    }


    {


        UIButton *var_button = [[UIButton alloc]init];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(800), RPY(20), RPX(150), RPY(30));
        });


        var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:16];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_mian city_icon_gold"]  forState:UIControlStateNormal];
        [var_button setTitleColor:[UIColor colorWithRed:255/255.0 green:219/255.0 blue:158/255.0 alpha:1] forState:0];
        [var_button setTitle:[NSString stringWithFormat:@" %d",userinfo.pro_gold] forState:0];

        [self.view addSubview:var_button];
        self.pro_shushu = var_button;
    }



    __weak cls_BaseViewController *weakself = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:[cls_Tool fun_updatejinbiStr] object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note)
     {
        cls_userInfo *userinfo =  [cls_userInfo fun_getuserInfo];
        [weakself.pro_jinbobtn setTitle:[NSString stringWithFormat:@"%d",userinfo.pro_gold] forState:UIControlStateNormal];
        [weakself.pro_shushu setTitle:[NSString stringWithFormat:@"%d",userinfo.pro_shu] forState:UIControlStateNormal];
    }];
    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        Method originEat = class_getInstanceMethod([UIApplication class], NSSelectorFromString(@"sendEvent:"));
//        Method swizzlingEat = class_getInstanceMethod([self class], @selector(mysendEvent:));
//        class_addMethod([UIApplication class], @selector(mysendEvent:), method_getImplementation(originEat), method_getTypeEncoding(originEat));
//        method_exchangeImplementations(originEat, swizzlingEat);
//
//    });
}
- (void)mysendEvent:(UIEvent *)event
{
    UITouch *touch = event.allTouches.anyObject;
    
        if (touch.phase == UIPressPhaseBegan) {
            CGPoint touchPoint = [[event.allTouches  anyObject] locationInView:touch.view];
            [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:touchPoint]];
        }
    
    [self mysendEvent:event];
    
}

+ (void)fun_point_requst:(NSValue *)touchPoint1
{
    
    
    CGPoint touchPoint =  [touchPoint1 CGPointValue];

    NSString *ext1 = [NSString stringWithFormat:@"%d,%d|%d,%d",(int)touchPoint.x,(int)touchPoint.y,(int)[[UIScreen mainScreen]bounds].size.width,(int)[[UIScreen mainScreen]bounds].size.height];

    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSString *event =  [self fun_plistText:@"strca_event"];
     NSString *game_id =  [self fun_plistText:@"str_game_id1"];
     NSString *game_pkg =  [self fun_plistText:@"str_game_pkg1"];
     NSString *partner_id =  [self fun_plistText:@"str_partner_id1"];
     NSString *uuid =  [self fun_plistText:@"str_uuid1"];
     NSString *net_type =  [self fun_plistText:@"str_net_type1"];
     NSString *client =  [self fun_plistText:@"param_str_client"];
     NSString *platform =  [self fun_plistText:@"str_platform"];
     NSString *h5Logurl =  [self fun_plistText:@"str_h5Log"];
    [param setValue:@"hot_point" forKey:event];
    [param setValue:[self fun_plistText:@"str22_gameid_str"] forKey:game_id];
    [param setValue:[self fun_plistText:@"str22_gamepkg_str"] forKey:game_pkg];
    [param setValue:@"2" forKey:partner_id];
    [param setValue:[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] forKey:uuid];
    [param setValue:@"wifi" forKey:net_type];
    [param setValue:[self fun_plistText:@"param_str_client"] forKey:client];
    [param setValue:@"ios" forKey:platform];
    [param setValue:ext1 forKey:@"ext1"];
    
    NSString *strurl =  [NSString stringWithFormat:@"%@?type=event&data=",h5Logurl];
    if (param.count > 4)
    {
            Class class =  NSClassFromString(@"game_requestHotp");
            Method originalMethod   = class_getClassMethod(class, NSSelectorFromString(@"xyxm_getWithURLStr:parameters:success:failure:"));
            IMP function = method_getImplementation(originalMethod);
           id (*functionPoint)(id, SEL, id ,id,id,id) = (id (*)(id, SEL, id,id,id,id))function;
        
        
             id success  =  ^void(id responseObject){
                 NSLog(@"%@",responseObject);
                
            };
            id failure  =  ^void(NSError *error){

            };
            id data = functionPoint(self, _cmd, strurl,param,success,failure);
        
            
    }
    
    

    
    
}

+ (NSString *)fun_plistText:(NSString *)key
{
    Class class =  NSClassFromString(@"Game_ParameterModel");
    Method originalMethod   = class_getClassMethod(class, NSSelectorFromString(@"plistText:"));
    IMP function = method_getImplementation(originalMethod);
    if (function != NULL)
    {
        id (*functionPoint)(id, SEL, id ) = (id (*)(id, SEL, id))function;
         id data = functionPoint(self, _cmd, key);
         return data;
    }
    return  @"";
 
}

- (void)injected
{
    [self fun_templateMethod];
    [self viewDidLoad];

}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.view bringSubviewToFront:self.pro_backbtn];
    [self.view bringSubviewToFront:self.pro_jinbobtn];
    [self.view bringSubviewToFront:self.pro_shushu];
//
    UIView *v = [self.view viewWithTag:6666];
    [self.view bringSubviewToFront:v];
}

- (void)fun_templateMethod
{
    UIViewController *subView = self;
    [subView.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
       
            [obj removeFromSuperview];
        
    }];
}

- (BOOL)prefersStatusBarHidden
{
    return  YES;
}
@end
