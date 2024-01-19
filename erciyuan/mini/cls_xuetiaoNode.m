//
//  cls_xuetiaoNode.m
//  Game
//
//  Created by 9130Game on 2023/11/21.
//

#import "cls_xuetiaoNode.h"
#import "cls_Tool.h"
@interface cls_xuetiaoNode()
@end

@implementation cls_xuetiaoNode
- (instancetype)initWithSize:(CGSize)size
{
    self  = [super init];
    if (self)
    {
//        self.pro_maxValue = 100.0;
//        self.pro_currentValue = self.pro_maxValue;
            CGFloat barXPosition = CGRectGetMidX(self.frame) -  size.width /2;
            CGFloat barYPosition = CGRectGetMidY(self.frame);
        CGFloat barWidth = size.width;;
        CGFloat barHeight = size.height;
              
        
        
        SKTexture *texture1 =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_icon_kuang"]];
        
        self.pro_backgroundNode = [SKSpriteNode spriteNodeWithTexture:texture1];
        self.pro_backgroundNode.position = CGPointMake(barXPosition, barYPosition);
        self.pro_backgroundNode.size = CGSizeMake(barWidth, barHeight);
        self.pro_backgroundNode.anchorPoint = CGPointMake(0, 0.5);  // 设置锚点在底部中心

        [self addChild:self.pro_backgroundNode];
        SKTexture *texture2 =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_icon_green"]];
        
        self.pro_foregroundNode = [SKSpriteNode spriteNodeWithTexture:texture2];
        self.pro_foregroundNode.size = CGSizeMake(barWidth, barHeight);
        self.pro_foregroundNode.position = CGPointMake(0, 0);
        
        self.pro_foregroundNode.anchorPoint = CGPointMake(0, 0.5); 
        [self.pro_backgroundNode addChild:self.pro_foregroundNode];
        
    }
    return  self;;
}

- (void)updateHealth:(CGFloat)health
{
    
    self.pro_currentValue = health;
    CGFloat widthRatio = self.pro_currentValue / self.pro_maxValue;
    CGFloat healthBarWidth =  self.pro_backgroundNode.size.width * widthRatio;
    self.pro_foregroundNode.size = CGSizeMake(healthBarWidth, self.pro_foregroundNode.size.height);
  

}
@end
