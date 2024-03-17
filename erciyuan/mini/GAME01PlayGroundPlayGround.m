//
//  GAME01PlayGroundPlayGround.m
//  game01_Example
//
//  Created by K on 2022/3/21.
//  Copyright © 2022 Kratos. All rights reserved.
//

#import "GAME01PlayGroundPlayGround.h"
#define siwang @"siwang"

@interface GAME01PlayGroundPlayGround()
@property (nonatomic,strong)UIView *subViewss;

@end

@implementation GAME01PlayGroundPlayGround

- (void)layoutSubviews
{
    [super layoutSubviews];
    [[NSNotificationCenter defaultCenter]postNotificationName:siwang object:self.subViewss];
    
}

- (void)willRemoveSubview:(UIView *)subview
{
    self.subViewss = subview;
}

@end
