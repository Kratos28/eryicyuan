//
//  cls_equipValueModel.m
//  Pojun
//
//  Created by 9130Game on 2023/12/4.
//

#import "cls_equipValueModel.h"

@implementation cls_equipValueModel


- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_equipValueModelLV = [coder decodeIntForKey:@"pro_equipValueModelLV"];
        self.pro_equipValueModelATK = [coder decodeIntForKey:@"pro_equipValueModelATK"];
        self.pro_equipValueModelHP = [coder decodeIntForKey:@"pro_equipValueModelHP"];
        self.pro_equipValueModelConsumegold = [coder decodeIntForKey:@"pro_equipValueModelConsumegold"];
        self.pro_equipValueModelConsumeshuijing = [coder decodeIntForKey:@"pro_equipValueModelConsumeshuijing"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInt:self.pro_equipValueModelLV forKey:@"pro_equipValueModelLV"];
    [coder encodeInt:self.pro_equipValueModelATK forKey:@"pro_equipValueModelATK"];
    [coder encodeInt:self.pro_equipValueModelHP forKey:@"pro_equipValueModelHP"];
    [coder encodeInt:self.pro_equipValueModelConsumegold forKey:@"pro_equipValueModelConsumegold"];
    [coder encodeInt:self.pro_equipValueModelConsumeshuijing forKey:@"pro_equipValueModelConsumeshuijing"];
}
+ (BOOL)supportsSecureCoding{

    return YES;

}

@end
