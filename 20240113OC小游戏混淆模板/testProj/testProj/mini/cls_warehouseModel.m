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
        self.pro_desc = [coder decodeObjectForKey:@"pro_desc"];
        self.pro_fangyu = [coder decodeIntForKey:@"pro_fangyu"];
        self.pro_gold = [coder decodeIntForKey:@"pro_gold"];
        self.pro_gongji = [coder decodeIntForKey:@"pro_gongji"];
        self.pro_imageName = [coder decodeObjectForKey:@"pro_imageName"];
        self.pro_lv = [coder decodeIntForKey:@"pro_lv"];
        self.pro_name = [coder decodeObjectForKey:@"pro_name"];
        self.pro_own = [coder decodeBoolForKey:@"pro_own"];
        self.pro_shanbi = [coder decodeIntForKey:@"pro_shanbi"];
        self.pro_status = [coder decodeIntForKey:@"pro_status"];
        self.pro_xueliang = [coder decodeIntForKey:@"pro_xueliang"];
        self.pro_warehouseQuantity = [coder decodeIntForKey:@"pro_equipequantity"];

        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.pro_desc forKey:@"pro_desc"];
    [coder encodeInt:self.pro_fangyu forKey:@"pro_fangyu"];
    [coder encodeInt:self.pro_gold forKey:@"pro_gold"];
    [coder encodeInt:self.pro_gongji forKey:@"pro_gongji"];
    [coder encodeObject:self.pro_imageName forKey:@"pro_imageName"];
    [coder encodeInt:self.pro_lv forKey:@"pro_lv"];
    [coder encodeObject:self.pro_name forKey:@"pro_name"];
    [coder encodeBool:self.pro_own forKey:@"pro_own"];
    [coder encodeInt:self.pro_shanbi forKey:@"pro_shanbi"];
    [coder encodeInt:self.pro_status forKey:@"pro_status"];
    [coder encodeInt:self.pro_xueliang forKey:@"pro_xueliang"];
    [coder encodeInt:self.pro_warehouseQuantity forKey:@"pro_equipequantity"];

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
        if (sign.pro_name == signin.pro_name)
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
        zhuangbei.pro_fangyu = 100;
        zhuangbei.pro_gold = arc4random_uniform(200) +100;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_warehouse_zb1";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"1";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_warehouse_zb2";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"2";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
    
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_warehouse_zb3";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"3";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_warehouse_zb4";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"4";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_warehouse_zb5";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"5";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_warehouseModel *zhuangbei = [[cls_warehouseModel alloc] init];
        zhuangbei.pro_fangyu =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gold =  arc4random_uniform(200) +100;;
        zhuangbei.pro_gongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_imageName = @"img_warehouse_zb6";
        zhuangbei.pro_lv = 1;
        zhuangbei.pro_name = @"6";
        zhuangbei.pro_own = YES;
        zhuangbei.pro_shanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_status = 1;
        zhuangbei.pro_xueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_warehouseQuantity = 1;
        [temp addObject:zhuangbei];
    }
        
    [self fun_quipesave:temp];
}

@end
