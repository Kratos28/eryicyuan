//
//  cls_P.m
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import "cls_userInfo.h"
@implementation cls_userInfo

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_dengji = [coder decodeIntegerForKey:@"pro_dengji"];
        self.pro_gold = [coder decodeIntegerForKey:@"pro_gold"];
        self.pro_guanshu = [coder decodeIntegerForKey:@"pro_guanshu"];
        self.pro_iD = [coder decodeIntegerForKey:@"pro_iD"];
        self.pro_name = [coder decodeObjectForKey:@"pro_name"];

        self.pro_shu = [coder decodeIntegerForKey:@"pro_shu"];
        self.pro_pebble = [coder decodeIntegerForKey:@"pro_pebble"];
        self.pro_modelvalue = [coder decodeObjectForKey:@"pro_modelvalue"];
        self.pro_nextmodelvalue = [coder decodeObjectForKey:@"pro_nextmodelvalue"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInteger:self.pro_dengji forKey:@"pro_dengji"];
    [coder encodeInteger:self.pro_gold forKey:@"pro_gold"];
    [coder encodeInteger:self.pro_guanshu forKey:@"pro_guanshu"];
    [coder encodeInteger:self.pro_iD forKey:@"pro_iD"];
    [coder encodeObject:self.pro_name forKey:@"pro_name"];

    [coder encodeInteger:self.pro_shu forKey:@"pro_shu"];
    [coder encodeInteger:self.pro_pebble forKey:@"pro_pebble"];
    [coder encodeObject:self.pro_modelvalue forKey:@"pro_modelvalue"];
    [coder encodeObject:self.pro_nextmodelvalue forKey:@"pro_nextmodelvalue"];

}
+ (BOOL)supportsSecureCoding
{
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
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"Log in daily gifts"];
    [[NSUserDefaults standardUserDefaults]synchronize];
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
    NSSet *allowedClasses = [NSSet setWithObjects:[cls_userInfo class],[NSMutableArray class],[NSMutableDictionary class],[NSString class],NSArray.class,cls_equipValueModel.class, nil];
    cls_userInfo *var_userinfo = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:&error];
    var_userinfo.pro_modelvalue = [self fun_getEquipValueModel:var_userinfo.pro_dengji];
    var_userinfo.pro_nextmodelvalue = [self fun_getEquipValueModel:var_userinfo.pro_dengji+1];
    var_userinfo.pro_MAXHP =  [self getHP:var_userinfo.pro_dengji];
    var_userinfo.pro_HP =   var_userinfo.pro_MAXHP;
    var_userinfo.pro_ATK =  [self getATK:var_userinfo.pro_dengji];
    if (var_userinfo)
    {
        return var_userinfo;
    }
    return nil;
}

+ (cls_equipValueModel *)fun_getEquipValueModel:(int)lv
{
    NSMutableArray *temp =  [self fun_userinfovalue];
  __block  cls_equipValueModel *moel = nil;
    [temp enumerateObjectsUsingBlock:^(cls_equipValueModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.pro_equipValueModelLV == lv)
            {
                moel = obj;
                *stop = YES;
            }
    }];
    return moel;
}


+ (NSMutableArray *)fun_userinfovalue
{
    NSMutableArray *temp = [NSMutableArray array];
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 1000;
        v.pro_equipValueModelATK = 20;
        v.pro_equipValueModelConsumegold = 500;
        v.pro_equipValueModelConsumeshuijing = 5;
        v.pro_equipValueModelLV = 1;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 2000;
        v.pro_equipValueModelATK = 40;
        v.pro_equipValueModelConsumegold = 800;
        v.pro_equipValueModelConsumeshuijing = 8;
        v.pro_equipValueModelLV = 2;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 3000;
        v.pro_equipValueModelATK = 60;
        v.pro_equipValueModelConsumegold = 1100;
        v.pro_equipValueModelConsumeshuijing = 11;
        v.pro_equipValueModelLV = 3;
        [temp addObject:v];
    }
    
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 4000;
        v.pro_equipValueModelATK = 80;
        v.pro_equipValueModelConsumegold = 1400;
        v.pro_equipValueModelConsumeshuijing = 14;
        v.pro_equipValueModelLV = 4;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 5000;
        v.pro_equipValueModelATK = 100;
        v.pro_equipValueModelConsumegold = 1700;
        v.pro_equipValueModelConsumeshuijing = 17;
        v.pro_equipValueModelLV = 5;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 6000;
        v.pro_equipValueModelATK = 120;
        v.pro_equipValueModelConsumegold = 2000;
        v.pro_equipValueModelConsumeshuijing = 20;
        v.pro_equipValueModelLV = 6;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 700;
        v.pro_equipValueModelATK = 140;
        v.pro_equipValueModelConsumegold = 2300;;
        v.pro_equipValueModelConsumeshuijing = 23;
        v.pro_equipValueModelLV = 7;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 800;
        v.pro_equipValueModelATK = 160;
        v.pro_equipValueModelConsumegold = 2600;;
        v.pro_equipValueModelConsumeshuijing = 9999;
        v.pro_equipValueModelLV = 8;
        [temp addObject:v];
    }
    return temp;
    
}

+ (cls_userInfo *)fun_createuserInfo
{
    cls_userInfo *userInfo = [[cls_userInfo alloc] init];
    userInfo.pro_dengji = 1;
    userInfo.pro_gold = 0;
    userInfo.pro_guanshu = 1;
    userInfo.pro_shu = 100;
    userInfo.pro_iD = 1;
    userInfo.pro_name = @"x";
    userInfo.pro_MAXHP =  [self getHP:1];
    userInfo.pro_HP =  userInfo.pro_MAXHP;
    userInfo.pro_ATK =  [self getATK:1];
    userInfo.pro_DEF =  10;
    userInfo.pro_EVA =  5;
    return userInfo;
}
+ (int)getHP:(int)lv
{
    return  ((lv-1) *  1000) +1000;
}
+ (int)getATK:(int)lv
{
    return  ((lv-1) *  20) +20;
}


@end
