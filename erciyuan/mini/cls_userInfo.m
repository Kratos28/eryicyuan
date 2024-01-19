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
        self.pro_zhuangbeis = [coder decodeObjectForKey:@"pro_zhuangbeis"];
        self.pro_ATK = [coder decodeIntegerForKey:@"pro_ATK"];
        self.pro_DEF = [coder decodeIntegerForKey:@"pro_DEF"];
        self.pro_HP = [coder decodeIntegerForKey:@"pro_HP"];
        self.pro_EVA = [coder decodeIntegerForKey:@"pro_EVA"];
        self.pro_tasks = [coder decodeObjectForKey:@"pro_tasks"];
        self.pro_methods = [coder decodeObjectForKey:@"pro_methods"];
        self.pro_petModels = [coder decodeObjectForKey:@"pro_petModels"];
        self.pro_shu = [coder decodeIntegerForKey:@"pro_shu"];

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
    [coder encodeObject:self.pro_zhuangbeis forKey:@"pro_zhuangbeis"];
    [coder encodeObject:self.pro_tasks forKey:@"pro_tasks"];
    [coder encodeObject:self.pro_methods forKey:@"pro_methods"];
    [coder encodeInteger:self.pro_ATK forKey:@"pro_ATK"];
    [coder encodeInteger:self.pro_DEF forKey:@"pro_DEF"];
    [coder encodeInteger:self.pro_HP forKey:@"pro_HP"];
    [coder encodeInteger:self.pro_EVA forKey:@"pro_EVA"];
    [coder encodeObject:self.pro_petModels forKey:@"pro_petModels"];
    [coder encodeInteger:self.pro_shu forKey:@"pro_shu"];

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

    if (appName == nil) {
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    NSData *data = [defaults objectForKey:appName];
    NSError *error = nil;
    
    NSSet *allowedClasses = [NSSet setWithObjects:[cls_equipeModel class],[cls_userInfo class],[NSMutableArray class],[NSMutableDictionary class],[NSString class],[cls_TaskModel class],cls_MethodModel.class,cls_PetModel.class,NSArray.class, nil];
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
    userInfo.pro_shu = 0;
    userInfo.pro_iD = 1;
    userInfo.pro_name = @"张三";
    userInfo.pro_zuidashengming = 100;
    userInfo.pro_HP =  userInfo.pro_zuidashengming;
    userInfo.pro_ATK =  10;
    userInfo.pro_DEF =  10;
    userInfo.pro_EVA =  5;
    NSMutableArray *temp = [NSMutableArray array];
    {
        cls_equipeModel *zhuangbei = [[cls_equipeModel alloc] init];
        zhuangbei.pro_fangyu = 100;
        zhuangbei.pro_gold = arc4random_uniform(200) +100;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_kkk_kkk_gp_icon_0192";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"1";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_equipeModel *zhuangbei = [[cls_equipeModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_kkk_kkk_gp_icon_0289";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"2";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        [temp addObject:zhuangbei];
    }
    
    {
        cls_equipeModel *zhuangbei = [[cls_equipeModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_kkk_kkk_gp_icon_0388";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"3";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_equipeModel *zhuangbei = [[cls_equipeModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_kkk_kkk_gp_icon_0484";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"4";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_equipeModel *zhuangbei = [[cls_equipeModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_kkk_kkk_gp_icon_0582";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"5";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_equipeModel *zhuangbei = [[cls_equipeModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_kkk_kkk_gp_icon_0685";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"6";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        [temp addObject:zhuangbei];
    }
    userInfo.pro_zhuangbeis = temp;
    userInfo.pro_tasks = [self fun_createTask];
    userInfo.pro_methods = [self fun_createMethod];
    userInfo.pro_petModels = [self fun_createPets];
    return userInfo;
}


+ (NSMutableArray *)fun_createPets
{
    NSMutableArray *temp = [NSMutableArray array];
    {
        cls_PetModel *petModel = [[cls_PetModel alloc] init];
        petModel.pro_petdesc =  @"1";
        petModel.pro_petfangyu =  arc4random_uniform(200) +100;;
        petModel.pro_petgold = 100;
        petModel.pro_petATK =   arc4random_uniform(100) + 60;;
        petModel.pro_petimageName = @"1";
        petModel.pro_petlv = 1;
        petModel.pro_petname = @"1";
        petModel.pro_petown = YES;
        petModel.pro_petspeed =  arc4random_uniform(100) + 60;;
        petModel.pro_petstatus = 0;
        petModel.pro_petHP = arc4random_uniform(50) + 100;;
        [temp addObject:petModel];
    }
    return temp;
}

+ (NSMutableArray *)fun_createTask{
    NSMutableArray *temp = [NSMutableArray array];
    {
        cls_TaskModel *zhuangbei = [[cls_TaskModel alloc] init];
        zhuangbei.pro_title = @"Log in once to receive the game";
        zhuangbei.pro_coin = 100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_ID = 0;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_TaskModel *zhuangbei = [[cls_TaskModel alloc] init];
        zhuangbei.pro_title = @"Pass the first level to obtain";
        zhuangbei.pro_coin = 100;;
        zhuangbei.pro_status = 0;
        zhuangbei.pro_ID = 1;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_TaskModel *zhuangbei = [[cls_TaskModel alloc] init];
        zhuangbei.pro_title = @"Pass the second level to obtain";
        zhuangbei.pro_coin = 100;;
        zhuangbei.pro_status = 0;
        zhuangbei.pro_ID = 2;
        [temp addObject:zhuangbei];
    }
    
    {
        cls_TaskModel *zhuangbei = [[cls_TaskModel alloc] init];
        zhuangbei.pro_title = @"Obtain through level three";
        zhuangbei.pro_coin = 100;;
        zhuangbei.pro_status = 0;
        zhuangbei.pro_ID = 3;
        [temp addObject:zhuangbei];
    }
    return temp;
}


+ (NSMutableArray *)fun_createMethod{
    NSMutableArray *temp = [NSMutableArray array];
    {
        cls_MethodModel *method = [[cls_MethodModel alloc] init];
        method.pro_methodname = @"Blazing Flame";
        method.pro_methodLv = 1;
        method.pro_methodGold = 50;
        method.pro_methoddecl = @"Summon magma to shoot outwards in the field, which deals a small amount of damage";
        method.pro_methodStatus = 0;
        [temp addObject:method];
    }
    
    
    {
        cls_MethodModel *method = [[cls_MethodModel alloc] init];
        method.pro_methodname = @"Winter has arrived";
        method.pro_methodLv = 1;
        method.pro_methodGold = 50;
        method.pro_methoddecl = @"Wave the wand to summon Winter's power to enemy targets, dealing a lot of damage to enemies in the area after a short delay";
        method.pro_methodStatus = 0;
        [temp addObject:method];
    }
    
    
    {
        cls_MethodModel *method = [[cls_MethodModel alloc] init];
        method.pro_methodname = @"Storm Bolt";
        method.pro_methodLv = 1;
        method.pro_methodGold = 50;
        method.pro_methoddecl = @"Throw a hammer with lightning magic at the target, dealing damage";
        method.pro_methodStatus = 1;
        [temp addObject:method];
    }
    
    {
        cls_MethodModel *method = [[cls_MethodModel alloc] init];
        method.pro_methodname = @"Fireball";
        method.pro_methodLv = 1;
        method.pro_methodGold = 50;
        method.pro_methoddecl = @"Shoot a highly toxic bow and arrow at the target, dealing damage";
        method.pro_methodStatus = 1;
        [temp addObject:method];
    }
    return temp;
}

@end
