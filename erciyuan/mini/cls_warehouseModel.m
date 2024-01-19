//
//  cls_zhuangbei.m
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import "cls_warehouseModel.h"


#import <Foundation/Foundation.h>


@implementation cls_warehouseModel

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_warehousedesc = [coder decodeObjectForKey:@"pro_warehousedesc"];
        self.pro_warehousefangyu = [coder decodeIntForKey:@"pro_warehousefangyu"];
        self.pro_warehousegold = [coder decodeIntForKey:@"pro_warehousegold"];
        self.pro_warehousegongji = [coder decodeIntForKey:@"pro_warehousegongji"];
        self.pro_warehouseimageName = [coder decodeObjectForKey:@"pro_warehouseimageName"];
        self.pro_warehouselv = [coder decodeIntForKey:@"pro_warehouselv"];
        self.pro_warehousename = [coder decodeObjectForKey:@"pro_warehousename"];
        self.pro_warehouseown = [coder decodeBoolForKey:@"pro_warehouseown"];
        self.pro_warehouseshanbi = [coder decodeIntForKey:@"pro_warehouseshanbi"];
        self.pro_warehousestatus = [coder decodeIntForKey:@"pro_warehousestatus"];
        self.pro_warehousexueliang = [coder decodeIntForKey:@"pro_warehousexueliang"];
        self.pro_warehouseQuantity = [coder decodeIntForKey:@"pro_warehouseQuantity"];

        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.pro_warehousedesc forKey:@"pro_warehousedesc"];
    [coder encodeInt:self.pro_warehousefangyu forKey:@"pro_warehousefangyu"];
    [coder encodeInt:self.pro_warehousegold forKey:@"pro_warehousegold"];
    [coder encodeInt:self.pro_warehousegongji forKey:@"pro_warehousegongji"];
    [coder encodeObject:self.pro_warehouseimageName forKey:@"pro_warehouseimageName"];
    [coder encodeInt:self.pro_warehouselv forKey:@"pro_warehouselv"];
    [coder encodeObject:self.pro_warehousename forKey:@"pro_warehousename"];
    [coder encodeBool:self.pro_warehouseown forKey:@"pro_warehouseown"];
    [coder encodeInt:self.pro_warehouseshanbi forKey:@"pro_warehouseshanbi"];
    [coder encodeInt:self.pro_warehousestatus forKey:@"pro_warehousestatus"];
    [coder encodeInt:self.pro_warehousexueliang forKey:@"pro_warehousexueliang"];
    [coder encodeInt:self.pro_warehouseQuantity forKey:@"pro_warehouseQuantity"];

}
+ (BOOL)supportsSecureCoding{

    return YES;

}

+ (void)initialize
{
    [self fun_createWarehouse];
}


+ (void)fun_warehouseSingleSave:(cls_warehouseModel *)signin
{
    NSMutableArray *array =  [self fun_getWarehouse];
    cls_warehouseModel *signin1 = nil;
    NSMutableArray *temps= [NSMutableArray array];
    for (cls_warehouseModel *sign in array) {
        if ([sign.pro_warehousename  isEqualToString:signin.pro_warehousename])
        {
            signin1 = signin;
            [temps addObject:signin1];
            
        }else{
            [temps addObject:sign];
        }
    }
    
    [self fun_quipesave:temps];
}


+ (void)fun_quipesave:(NSMutableArray *)temp;
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


+ (NSMutableArray *)fun_getWarehouse
{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil) {
        // 如果没有设置显示名称（CFBundleDisplayName），则获取应用的Bundle名称（CFBundleName）
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appName =  [NSString stringWithFormat:@"%@_%@",appName,NSStringFromClass([self class])];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSData *data = [defaults objectForKey:appName];
    NSError *error = nil;
    NSSet *allowedClasses = [NSSet setWithObjects:[NSMutableArray class],[NSMutableDictionary class],[NSString class],cls_warehouseModel.class, nil];
    NSMutableArray *temps = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:&error];
    if (temps)
    {
        return temps;
    }
    return nil;
}


+ (void )fun_createWarehouse
{
    NSMutableArray *temp = [NSMutableArray array];
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_warehousefangyu = 100;
        zhuangbei.pro_warehousegold = arc4random_uniform(200) +100;
        zhuangbei.pro_warehousegongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseimageName = @"img_stash_icon_agent";
        zhuangbei.pro_warehouselv = 1;
        zhuangbei.pro_warehousedesc = @"Restores a certain amount of health for pets";
        zhuangbei.pro_warehousename = @"medicine";
        zhuangbei.pro_warehouseown = YES;
        zhuangbei.pro_warehouseshanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousestatus = 1;
        zhuangbei.pro_warehousexueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_warehousefangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousegold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousegongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseimageName = @"img_stash_icon_Breakthrough";
        zhuangbei.pro_warehouselv = 1;
        zhuangbei.pro_warehousedesc = @"Used to break skills";
        zhuangbei.pro_warehousename = @"Breakthrough";
        zhuangbei.pro_warehouseown = YES;
        zhuangbei.pro_warehouseshanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousestatus = 1;
        zhuangbei.pro_warehousexueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
    
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_warehousefangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousegold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousegongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseimageName = @"img_stash_icon_Parrot";
        zhuangbei.pro_warehouselv = 1;
        zhuangbei.pro_warehousedesc = @"Powerful elite pet";
        zhuangbei.pro_warehousename = @"birdie";
        zhuangbei.pro_warehouseown = YES;
        zhuangbei.pro_warehouseshanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousestatus = 1;
        zhuangbei.pro_warehousexueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_warehousefangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousegold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousegongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseimageName = @"img_stash_icon_Shiba Inu";
        zhuangbei.pro_warehouselv = 1;
        zhuangbei.pro_warehousedesc = @"Epic pet";
        zhuangbei.pro_warehousename = @"Dog";
        zhuangbei.pro_warehouseown = YES;
        zhuangbei.pro_warehouseshanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousestatus = 1;
        zhuangbei.pro_warehousexueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_warehousefangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousegold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousegongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseimageName = @"img_stash_icon_Skill fragment";
        zhuangbei.pro_warehouselv = 1;
        zhuangbei.pro_warehousename = @"Skill";
        zhuangbei.pro_warehousedesc = @"To upgrade skills";
        zhuangbei.pro_warehouseown = YES;
        zhuangbei.pro_warehouseshanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehousestatus = 1;
        zhuangbei.pro_warehousexueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }

        
    [self fun_quipesave:temp];
}

@end
