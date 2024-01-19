//
//  cls_MonsterNode.h
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/9.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@class cls_xuetiaoNode;
@interface cls_MonsterNode : SKSpriteNode
@property (nonatomic,weak)  cls_xuetiaoNode *pro_monsterxuetiao;
- (instancetype)initWitsize:(CGSize)size withdiren:(BOOL)diren imagename:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
