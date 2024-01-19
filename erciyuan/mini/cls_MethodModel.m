//
//  cls_MethodModel.m
//  Game
//
//  Created by 9130Game on 2023/10/30.
//

#import "cls_MethodModel.h"


@implementation cls_MethodModel

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_methodname = [coder decodeObjectForKey:@"pro_methodname"];
        self.pro_methoddecl = [coder decodeObjectForKey:@"pro_methoddecl"];
        self.pro_imageName = [coder decodeObjectForKey:@"pro_imageName"];
        self.pro_methodLv = [coder decodeIntegerForKey:@"pro_methodLv"];
        self.pro_methodGold = [coder decodeIntegerForKey:@"pro_methodGold"];
        self.pro_methodStatus = [coder decodeIntegerForKey:@"pro_methodStatus"];


    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {

    [coder encodeObject:self.pro_methodname forKey:@"pro_methodname"];
    [coder encodeObject:self.pro_methoddecl forKey:@"pro_methoddecl"];
    [coder encodeObject:self.pro_imageName forKey:@"pro_imageName"];
    [coder encodeInteger:self.pro_methodLv forKey:@"pro_methodLv"];
    [coder encodeInteger:self.pro_methodGold forKey:@"pro_methodGold"];
    [coder encodeInteger:self.pro_methodStatus forKey:@"pro_methodStatus"];



}
+ (BOOL)supportsSecureCoding{

    return YES;

}

@end
