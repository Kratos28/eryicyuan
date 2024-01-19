//
//  cls_SigninModel.m
//  Game
//
//  Created by 9130Game on 2023/11/20.
//

#import "cls_SigninModel.h"

@implementation cls_SigninModel



- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_tianshu = [coder decodeIntegerForKey:@"pro_tianshu"];
        self.pro_signinGold = [coder decodeIntegerForKey:@"pro_signinGold"];
        self.pro_signinImageName = [coder decodeObjectForKey:@"pro_signinImageName"];
        self.pro_shifouqiandao = [coder decodeBoolForKey:@"pro_shifouqiandao"];
        
    }
    return self;
}
+ (BOOL)supportsSecureCoding{
    return YES;
}
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInteger:self.pro_tianshu forKey:@"pro_tianshu"];
    [coder encodeInteger:self.pro_signinGold forKey:@"pro_signinGold"];
    [coder encodeObject:self.pro_signinImageName forKey:@"pro_signinImageName"];
    [coder encodeBool:self.pro_shifouqiandao forKey:@"pro_shifouqiandao"];
}
+ (void)initialize
{
    [cls_SigninModel fun_createSignin];
}

+ (void )fun_createSignin
{
    NSMutableArray *temp = [NSMutableArray array];
    {
        cls_SigninModel *zhuangbei = [[cls_SigninModel alloc] init];
        zhuangbei.pro_tianshu = 1;
        zhuangbei.pro_signinGold = 200;
        zhuangbei.pro_shifouqiandao =  NO;
        zhuangbei.pro_signinImageName = @"img_Sign-in_day1";
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_SigninModel *zhuangbei = [[cls_SigninModel alloc] init];
        zhuangbei.pro_tianshu = 2;
        zhuangbei.pro_signinGold = 300;
        zhuangbei.pro_shifouqiandao =  NO;
        zhuangbei.pro_signinImageName = @"img_Sign-in_day2";
        [temp addObject:zhuangbei];
    }
      
    
    {
        cls_SigninModel *zhuangbei = [[cls_SigninModel alloc] init];
        zhuangbei.pro_tianshu = 3;
        zhuangbei.pro_signinGold = 20;
        zhuangbei.pro_shifouqiandao =  NO;
        zhuangbei.pro_signinImageName = @"img_Sign-in_day3";
        [temp addObject:zhuangbei];
    }
    
    {
        cls_SigninModel *zhuangbei = [[cls_SigninModel alloc] init];
        zhuangbei.pro_tianshu = 4;
        zhuangbei.pro_signinGold = 20;
        zhuangbei.pro_shifouqiandao =  NO;
        zhuangbei.pro_signinImageName = @"img_Sign-in_day4";
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_SigninModel *zhuangbei = [[cls_SigninModel alloc] init];
        zhuangbei.pro_tianshu = 5;
        zhuangbei.pro_signinGold = 20;
        zhuangbei.pro_shifouqiandao =  NO;
        zhuangbei.pro_signinImageName = @"img_Sign-in_day5";
        [temp addObject:zhuangbei];
    }
    
    
    
    {
        cls_SigninModel *zhuangbei = [[cls_SigninModel alloc] init];
        zhuangbei.pro_tianshu = 6;
        zhuangbei.pro_signinGold = 20;
        zhuangbei.pro_shifouqiandao =  NO;
        zhuangbei.pro_signinImageName = @"img_Sign-in_day6";
        [temp addObject:zhuangbei];
    }
    
    {
        cls_SigninModel *zhuangbei = [[cls_SigninModel alloc] init];
        zhuangbei.pro_tianshu = 7;
        zhuangbei.pro_signinGold = 20;
        zhuangbei.pro_shifouqiandao =  NO;
        zhuangbei.pro_signinImageName = @"img_Sign-in_7tian";
        [temp addObject:zhuangbei];
    }
    
    [self fun_SigninSaveSignins:temp];
}

+ (void)fun_signinSave:(cls_SigninModel *)signin
{
    NSMutableArray *array =  [self fun_getSignin];
    cls_SigninModel *signin1 = nil;
    NSMutableArray *temps= [NSMutableArray array];
    for (cls_SigninModel *sign in array) {
        if (sign.pro_tianshu == signin.pro_tianshu)
        {
            signin1 = signin;
            [temps addObject:signin1];
            
        }else{
            [temps addObject:sign];
        }
    }
    
    [self fun_SigninSaveSignins:temps];
}

+ (void)fun_SigninSaveSignins:(NSMutableArray *)temp
{
 
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil) {
        // 如果没有设置显示名称（CFBundleDisplayName），则获取应用的Bundle名称（CFBundleName）
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appName =  [NSString stringWithFormat:@"%@_%@",appName,NSStringFromClass([self class])];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:temp requiringSecureCoding:YES error:nil];
    if (data !=nil)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:data forKey:appName];
        [defaults synchronize];
    }
}
+ (NSMutableArray *)fun_getSignin{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil) {
        // 如果没有设置显示名称（CFBundleDisplayName），则获取应用的Bundle名称（CFBundleName）
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appName =  [NSString stringWithFormat:@"%@_%@",appName,NSStringFromClass([self class])];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSData *data = [defaults objectForKey:appName];
    NSError *error = nil;
    NSSet *allowedClasses = [NSSet setWithObjects:[NSMutableArray class],[NSMutableDictionary class],[NSString class],cls_SigninModel.class, nil];
    NSMutableArray *temps = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:&error];
    if (temps)
    {
        return temps;
    }
    return nil;
}
@end
 
