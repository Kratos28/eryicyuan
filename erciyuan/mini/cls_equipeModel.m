//
//  cls_zhuangbei.m
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import "cls_equipeModel.h"


#import <Foundation/Foundation.h>


@implementation cls_equipeModel

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
}
+ (BOOL)supportsSecureCoding{

    return YES;

}
+ (cls_equipeModel *)fun_createzhuangbei
{
    cls_equipeModel *zhuangbei = [[cls_equipeModel alloc] init];
     zhuangbei.pro_desc = @"这是装备描述";
     zhuangbei.pro_fangyu = 100;
     zhuangbei.pro_gold = 200;
     zhuangbei.pro_gongji = 150;
     zhuangbei.pro_imageName = @"装备图片名称";
     zhuangbei.pro_lv = 5;
     zhuangbei.pro_name = @"装备名称";
     zhuangbei.pro_own = YES;
     zhuangbei.pro_shanbi = 80;
     zhuangbei.pro_status = 1;
     zhuangbei.pro_xueliang = 200;
     return zhuangbei;
}
@end
