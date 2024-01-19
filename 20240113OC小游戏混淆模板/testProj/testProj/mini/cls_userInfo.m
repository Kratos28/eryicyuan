//
//  cls_P.m
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import "cls_userInfo.h"
#import "cls_TaskModel.h"
@implementation cls_userInfo

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_dengji = [coder decodeIntegerForKey:@"pro_dengji"];
        self.pro_gold = [coder decodeIntegerForKey:@"pro_gold"];
        self.pro_guanshu = [coder decodeIntegerForKey:@"pro_guanshu"];
        self.pro_iD = [coder decodeIntegerForKey:@"pro_iD"];
        self.pro_name = [coder decodeObjectForKey:@"pro_name"];
        self.pro_zuidashengming = [coder decodeIntegerForKey:@"pro_zuidashengming"];
        self.pro_ATK = [coder decodeIntegerForKey:@"pro_ATK"];
        self.pro_DEF = [coder decodeIntegerForKey:@"pro_DEF"];
        self.pro_HP = [coder decodeIntegerForKey:@"pro_HP"];
        self.pro_EVA = [coder decodeIntegerForKey:@"pro_EVA"];
        self.pro_shu = [coder decodeIntegerForKey:@"pro_shu"];
        self.pro_pebble = [coder decodeIntegerForKey:@"pro_pebble"];

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInteger:self.pro_dengji forKey:@"pro_dengji"];
    [coder encodeInteger:self.pro_gold forKey:@"pro_gold"];
    [coder encodeInteger:self.pro_guanshu forKey:@"pro_guanshu"];
    [coder encodeInteger:self.pro_iD forKey:@"pro_iD"];
    [coder encodeObject:self.pro_name forKey:@"pro_name"];
    [coder encodeInteger:self.pro_zuidashengming forKey:@"pro_zuidashengming"];
    [coder encodeInteger:self.pro_ATK forKey:@"pro_ATK"];
    [coder encodeInteger:self.pro_DEF forKey:@"pro_DEF"];
    [coder encodeInteger:self.pro_HP forKey:@"pro_HP"];
    [coder encodeInteger:self.pro_EVA forKey:@"pro_EVA"];
    [coder encodeInteger:self.pro_shu forKey:@"pro_shu"];
    [coder encodeInteger:self.pro_pebble forKey:@"pro_pebble"];

}
+ (BOOL)supportsSecureCoding{

    return YES;

}
- (BOOL)fun_save
{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil) {
        // 如果没有设置显示名称（CFBundleDisplayName），则获取应用的Bundle名称（CFBundleName）
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    
    appName =  [NSString stringWithFormat:@"%@_%@",appName,NSStringFromClass([self class])];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:YES error:nil];
    if (data !=nil)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:data forKey:appName];
        [defaults synchronize];
        return  YES;
    }
    return  NO;

}
+ (void)initialize
{
     [[cls_userInfo fun_createuserInfo]fun_save];
}
+ (cls_userInfo *)fun_getuserInfo
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil)
    {
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appName = [NSString stringWithFormat:@"%@_%@",appName,NSStringFromClass([self class])];

    NSData *data = [defaults objectForKey:appName];
    NSError *error = nil;
    NSSet *allowedClasses = [NSSet setWithObjects:[cls_warehouseModel class],[cls_userInfo class],[NSMutableArray class],[NSMutableDictionary class],[NSString class],[cls_TaskModel class],cls_MethodModel.class,cls_PetModel.class,NSArray.class, nil];
    cls_userInfo *var_userinfo = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:&error];
    if (var_userinfo)
    {
        return var_userinfo;
    }
    return nil;
}



+ (cls_userInfo *)fun_createuserInfo
{
    cls_userInfo *userInfo = [[cls_userInfo alloc] init];
    userInfo.pro_dengji = 1;
    userInfo.pro_gold = 0;
    userInfo.pro_guanshu = 1;
    userInfo.pro_shu = 5;
    userInfo.pro_iD = 1;
    userInfo.pro_name = @"张三";
    userInfo.pro_zuidashengming = 100;
    userInfo.pro_HP =  userInfo.pro_zuidashengming;
    userInfo.pro_ATK =  10;
    userInfo.pro_DEF =  10;
    userInfo.pro_EVA =  5;
    return userInfo;
}









@end
