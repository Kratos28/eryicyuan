//
//  cls_baseModel.m
//  Game
//
//  Created by 9130Game on 2023/11/23.
//

#import "cls_baseModel.h"

@implementation cls_baseModel


- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_baseModelname = [coder decodeObjectForKey:@"pro_baseModelname"];
     

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.pro_baseModelname forKey:@"pro_baseModelname"];


}


+ (NSMutableArray *)fun_getModel
{
    
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil) {
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appName = [NSString stringWithFormat:@"%@_%@",appName,NSStringFromClass([self class])];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSData *data = [defaults objectForKey:appName];
    NSError *error = nil;
    NSSet *allowedClasses = [NSSet setWithObjects:[NSMutableArray class],[NSMutableDictionary class],[NSString class],self.class,cls_baseModel.class, nil];
    NSMutableArray *temps = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:&error];
    if (temps)
    {
        return temps;
    }
    return nil;
}
+ (void)fun_SingleSave:(cls_baseModel *)signin
{
    NSMutableArray *array =  [self fun_getModel];
    cls_baseModel *signin1 = nil;
    NSMutableArray *temps= [NSMutableArray array];
    for (cls_baseModel *shop in array) {
        if ([shop.pro_baseModelname isEqualToString:signin.pro_baseModelname])
        {
            signin1 = signin;
            [temps addObject:signin1];
        }else{
            [temps addObject:shop];
        }
    }
    [self fun_Save:temps];
}
+ (void)fun_Save:(NSMutableArray *)temp{
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
