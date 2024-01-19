//
//  cls_ShopModel.m
//  Game
//
//  Created by 9130Game on 2023/11/22.
//

#import "cls_ShopModel.h"

@implementation cls_ShopModel



- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_shopname = [coder decodeObjectForKey:@"pro_shopname"];
        self.pro_shopGold = [coder decodeIntegerForKey:@"pro_shopGold"];
        self.pro_shopImageName = [coder decodeObjectForKey:@"pro_shopImageName"];
        self.pro_shopquantity = [coder decodeIntegerForKey:@"pro_shopquantity"];

    }
    return self;
}
+ (BOOL)supportsSecureCoding{
    return YES;
}
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.pro_shopname forKey:@"pro_shopname"];
    [coder encodeInteger:self.pro_shopGold forKey:@"pro_shopGold"];
    [coder encodeObject:self.pro_shopImageName forKey:@"pro_shopImageName"];
    [coder encodeInteger:self.pro_shopquantity forKey:@"pro_shopquantity"];
}
+ (void)initialize
{
    [cls_ShopModel fun_createShop];
}
                      

+ (void )fun_createShop
{
    NSMutableArray *temp = [NSMutableArray array];
    {
        cls_ShopModel *zhuangbei = [[cls_ShopModel alloc] init];
        zhuangbei.pro_shopname = @"1";
        zhuangbei.pro_shopGold = 1200;
        zhuangbei.pro_shopquantity = 1;
        zhuangbei.pro_shopImageName = @"img_shop_sp1";
        [temp addObject:zhuangbei];
        
    }
    
    {
        cls_ShopModel *zhuangbei = [[cls_ShopModel alloc] init];
        zhuangbei.pro_shopname = @"2";
        zhuangbei.pro_shopGold = 800;
        zhuangbei.pro_shopquantity = 1;
        zhuangbei.pro_shopImageName = @"img_shop_sp2";
        [temp addObject:zhuangbei];
        
    }
    
    {
        cls_ShopModel *zhuangbei = [[cls_ShopModel alloc] init];
        zhuangbei.pro_shopname = @"3";
        zhuangbei.pro_shopGold = 1500;
        zhuangbei.pro_shopquantity = 1;
        zhuangbei.pro_shopImageName = @"img_shop_sp3";
        [temp addObject:zhuangbei];
        
    }
    
    {
        cls_ShopModel *zhuangbei = [[cls_ShopModel alloc] init];
        zhuangbei.pro_shopname = @"4";
        zhuangbei.pro_shopGold = 2000;
        zhuangbei.pro_shopquantity = 1;
        zhuangbei.pro_shopImageName = @"img_shop_sp4";
        [temp addObject:zhuangbei];
        
    }
    {
        cls_ShopModel *zhuangbei = [[cls_ShopModel alloc] init];
        zhuangbei.pro_shopname = @"5";
        zhuangbei.pro_shopGold = 3000;
        zhuangbei.pro_shopquantity = 1;
        zhuangbei.pro_shopImageName = @"img_shop_sp5";
        [temp addObject:zhuangbei];
        
    }
    
    
    {
        cls_ShopModel *zhuangbei = [[cls_ShopModel alloc] init];
        zhuangbei.pro_shopname = @"6";
        zhuangbei.pro_shopGold = 5000;
        zhuangbei.pro_shopquantity = 1;
        zhuangbei.pro_shopImageName = @"img_shop_sp6";
        [temp addObject:zhuangbei];
        
    }
    [self fun_ShopSave:temp];
}

+ (NSMutableArray *)fun_getShops
{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil) {
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appName = [NSString stringWithFormat:@"%@_%@",appName,NSStringFromClass([self class])];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSData *data = [defaults objectForKey:appName];
    NSError *error = nil;
    NSSet *allowedClasses = [NSSet setWithObjects:[NSMutableArray class],[NSMutableDictionary class],[NSString class],cls_ShopModel.class, nil];
    NSMutableArray *temps = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:&error];
    if (temps)
    {
        return temps;
    }
    return nil;
}

+ (void)fun_ShopSingleSave:(cls_ShopModel *)signin
{
    NSMutableArray *array =  [self fun_getShops];
    cls_ShopModel *signin1 = nil;
    NSMutableArray *temps= [NSMutableArray array];
    for (cls_ShopModel *shop in array) {
        if (shop.pro_shopGold == shop.pro_shopGold)
        {
            signin1 = signin;
            [temps addObject:signin1];
        }else{
            [temps addObject:shop];
        }
    }
    [self fun_ShopSave:temps];
}


+ (void)fun_ShopSave:(NSMutableArray *)temp
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
@end
