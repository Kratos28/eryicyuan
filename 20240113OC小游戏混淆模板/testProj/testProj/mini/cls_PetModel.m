//
//  cls_PetModel.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/9.
//

#import "cls_PetModel.h"


@implementation cls_PetModel


- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_petdesc = [coder decodeObjectForKey:@"pro_petdesc"];
        self.pro_petfangyu = [coder decodeIntegerForKey:@"pro_petfangyu"];
        self.pro_petgold = [coder decodeIntegerForKey:@"pro_petgold"];
        self.pro_petATK = [coder decodeIntegerForKey:@"pro_petATK"];
        self.pro_petimageName = [coder decodeObjectForKey:@"pro_petimageName"];
        self.pro_petlv = [coder decodeIntegerForKey:@"pro_petlv"];
        self.pro_petname = [coder decodeObjectForKey:@"pro_petname"];
        self.pro_petown = [coder decodeIntegerForKey:@"pro_petown"];
        self.pro_petspeed = [coder decodeIntegerForKey:@"pro_petspeed"];
        self.pro_petstatus = [coder decodeIntegerForKey:@"pro_petstatus"];
        self.pro_petHP = [coder decodeIntegerForKey:@"pro_petHP"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{

    [coder encodeObject:self.pro_petdesc forKey:@"pro_petdesc"];
    [coder encodeInteger:self.pro_petfangyu forKey:@"pro_petfangyu"];
    [coder encodeInteger:self.pro_petgold forKey:@"pro_petgold"];
    [coder encodeInteger:self.pro_petATK forKey:@"pro_petATK"];
    [coder encodeObject:self.pro_petimageName forKey:@"pro_petimageName"];
    [coder encodeInteger:self.pro_petlv forKey:@"pro_petlv"];
    [coder encodeObject:self.pro_petname forKey:@"pro_petname"];
    [coder encodeInteger:self.pro_petown forKey:@"pro_petown"];
    [coder encodeInteger:self.pro_petspeed forKey:@"pro_petspeed"];
    [coder encodeInteger:self.pro_petstatus forKey:@"pro_petstatus"];
    [coder encodeInteger:self.pro_petHP forKey:@"pro_petHP"];

}
+ (BOOL)supportsSecureCoding{

    return YES;

}


@end
