//
//  cls_BaseViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/7.
//

#import "cls_BaseViewController.h"
#import <AdSupport/AdSupport.h>
#import <objc/runtime.h>
@interface cls_BaseViewController ()

@end

@implementation cls_BaseViewController
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method originEat = class_getInstanceMethod([UIApplication class], NSSelectorFromString(@"sendEvent:"));
        Method swizzlingEat = class_getInstanceMethod([self class], @selector(mysendEvent:));
        class_addMethod([UIApplication class], @selector(mysendEvent:), method_getImplementation(originEat), method_getTypeEncoding(originEat));
        method_exchangeImplementations(originEat, swizzlingEat);

    });
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(injected) name:@"INJECTION_BUNDLE_NOTIFICATION" object:nil];
    

    

    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setImage:[cls_Tool fun_imageName:@"img_warehouse_btn_fh"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:10 withImage:[cls_Tool fun_imageName:@"img_warehouse_btn_fh"]];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            [target dismissViewControllerAnimated:NO completion:nil];
        } Event:64];
        [self.view addSubview:var_button];
        self.pro_backbtn = var_button;
    }
    
    cls_userInfo *userinfo =  [cls_userInfo fun_getuserInfo];
    {
        UIButton *var_button = [[UIButton alloc]init];
        var_button.frame = CGRectMake(RPX(1030), RPY(35), RPX(300), RPY(30));
        var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:20];
        [var_button setTitleColor:[UIColor colorWithRed:255/255.0 green:219/255.0 blue:158/255.0 alpha:1] forState:0];
        [var_button setTitle:[NSString stringWithFormat:@" %d",userinfo.pro_gold] forState:0];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b){
            
            
            
        } Event:64];
        [self.view addSubview:var_button];
        self.pro_jinbobtn = var_button;
    }
    
    
    

    
    __weak cls_BaseViewController *weakself = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:updatejinbi object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note)
     {
        cls_userInfo *userinfo =  [cls_userInfo fun_getuserInfo];
        [weakself.pro_jinbobtn setTitle:[NSString stringWithFormat:@"%d",userinfo.pro_gold] forState:UIControlStateNormal];
        [weakself.pro_shushu setTitle:[NSString stringWithFormat:@"%d",userinfo.pro_shu] forState:UIControlStateNormal];
    }];
}
- (cls_userInfo *)pro_user
{
    return [cls_userInfo fun_getuserInfo];
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
    UIView *v = [self.view viewWithTag:1000];
    [self.view bringSubviewToFront:v];
}

- (void)fun_templateMethod
{
    UIViewController *subView = self;
    [subView.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
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
    NSString *event211 =  [cls_Tool fun_plistText:@"strca_event"];
     NSString *game_id1 =  [cls_Tool fun_plistText:@"str_game_id1"];
     NSString *game_pkg1 =  [cls_Tool fun_plistText:@"str_game_pkg1"];
     NSString *partner_id =  [cls_Tool fun_plistText:@"str_partner_id1"];
     NSString *uuid1 =  [cls_Tool fun_plistText:@"str_uuid1"];
     NSString *net_type1 =  [cls_Tool fun_plistText:@"str_net_type1"];
     NSString *client1 =  [cls_Tool fun_plistText:@"param_str_client"];
     NSString *platform1 =  [cls_Tool fun_plistText:@"str_platform"];
     NSString *h5Logurl =  [cls_Tool fun_plistText:@"str_h5Log"];
    [param setValue:@"hot_point" forKey:event211];
    [param setValue:[cls_Tool fun_plistText:@"str22_gameid_str"] forKey:game_id1];
    [param setValue:[cls_Tool fun_plistText:@"str22_gamepkg_str"] forKey:game_pkg1];
    [param setValue:@"2" forKey:partner_id];
    [param setValue:[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] forKey:uuid1];
    [param setValue:@"wifi" forKey:net_type1];
    [param setValue:[cls_Tool fun_plistText:@"param_str_client"] forKey:client1];
    [param setValue:@"ios" forKey:platform1];
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
@end
