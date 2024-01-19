//
//  cls_xuetiaoNode.h
//  Game
//
//  Created by 9130Game on 2023/11/21.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_xuetiaoNode : SKNode
@property (nonatomic, strong) SKSpriteNode *pro_backgroundNode;
@property (nonatomic, strong) SKSpriteNode *pro_foregroundNode;
@property (nonatomic, assign) CGFloat pro_currentValue; // 健康百分比
@property(nonatomic,assign)CGFloat pro_maxValue;
- (instancetype)initWithSize:(CGSize)size;
- (void)updateHealth:(CGFloat)health;
@end

NS_ASSUME_NONNULL_END
