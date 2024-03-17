//
//  cls_zr.m
//  erciyuan
//
//  Created by k on 2024/3/17.
//

#import "cls_zr.h"

@implementation cls_zr

/*
 @property (nonatomic,copy) NSString * pro_name;
 @property (nonatomic,assign) int16_t pro_xueliang;
 @property (nonatomic,assign) int16_t pro_zuidaxueliang;
 @property (nonatomic,assign) int16_t pro_imagename;
 @property (nonatomic,assign) int16_t pro_lv;
 */

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.pro_name = [coder decodeObjectForKey:@"pro_name"];
        self.pro_xueliang = [coder decodeIntegerForKey:@"pro_xueliang"];
        self.pro_zuidaxueliang = [coder decodeIntegerForKey:@"pro_zuidaxueliang"];
        self.pro_imagename = [coder decodeObjectForKey:@"pro_imagename"];
        self.pro_lv = [coder decodeIntegerForKey:@"pro_lv"];
        

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:self.pro_name forKey:@"pro_name"];
    [coder encodeInt:self.pro_xueliang forKey:@"pro_xueliang"];
    [coder encodeInt:self.pro_zuidaxueliang forKey:@"pro_zuidaxueliang"];
    [coder encodeObject:self.pro_imagename forKey:@"pro_imagename"];
    [coder encodeInt:self.pro_lv forKey:@"pro_lv"];
    

}

+ (void)initialize
{
    [self fun_createEquipModel];
}
+ (void )fun_createEquipModel
{
    

    NSMutableArray *temp = [NSMutableArray array];
    {
        
        cls_zr *zhuangbei = [[cls_zr alloc] init];
        zhuangbei.pro_xueliang = 100;
        zhuangbei.pro_zuidaxueliang = 100;
        zhuangbei.pro_imagename = @"角色1";
        zhuangbei.pro_name = @"1";
        [temp addObject:zhuangbei];
    }
    
   
    
    {
        
        cls_zr *zhuangbei = [[cls_zr alloc] init];
        zhuangbei.pro_xueliang = 100;
        zhuangbei.pro_zuidaxueliang = 100;
        zhuangbei.pro_imagename = @"角色2";
        zhuangbei.pro_name = @"2";
        [temp addObject:zhuangbei];
    }
    
    

    [self fun_Save:temp];
}
+ (void)fun_zrSaveSignins:(NSMutableArray *)temp
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
+ (void)fun_zrsigninSave:(cls_zr *)signin
{
    
    NSMutableArray *array =  [self fun_getzr];
    cls_zr *signin1 = nil;
    NSMutableArray *temps= [NSMutableArray array];
    for (cls_zr *sign in array) {
        if (sign.pro_name == signin.pro_name)
        {
            signin1 = signin;
            [temps addObject:signin1];
        }else{
            [temps addObject:sign];
        }
    }
    
    [self fun_zrSaveSignins:temps];
}
+ (NSMutableArray *)fun_getzr{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil) {
        // 如果没有设置显示名称（CFBundleDisplayName），则获取应用的Bundle名称（CFBundleName）
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appName =  [NSString stringWithFormat:@"%@_%@",appName,NSStringFromClass([self class])];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSData *data = [defaults objectForKey:appName];
    NSError *error = nil;
    NSSet *allowedClasses = [NSSet setWithObjects:[NSMutableArray class],[NSMutableDictionary class],[NSString class],cls_zr.class, nil];
    NSMutableArray *temps = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:&error];
    if (temps)
    {
        return temps;
    }
    return nil;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

@end
