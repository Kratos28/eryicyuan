//
//  cls_TaskModel.m
//  Game
//
//  Created by 9130Game on 2023/10/30.
//

#import "cls_TaskModel.h"

@implementation cls_TaskModel
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.pro_title = [coder decodeObjectForKey:@"pro_title"];
        self.pro_coin = [coder decodeIntForKey:@"pro_coin"];
        self.pro_status = [coder decodeIntForKey:@"pro_status"];
        self.pro_ID = [coder decodeIntForKey:@"pro_ID"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.pro_title forKey:@"pro_title"];
    [coder encodeInt:self.pro_coin forKey:@"pro_coin"];
    [coder encodeInt:self.pro_status forKey:@"pro_status"];
    [coder encodeInt:self.pro_ID forKey:@"pro_ID"];

}

+ (BOOL)supportsSecureCoding{
    return YES;
}
@end
