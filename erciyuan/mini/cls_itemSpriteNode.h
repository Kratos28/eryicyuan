//
//  cls_itemSpriteNode.h
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/8.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_itemSpriteNode : SKSpriteNode
@property (nonatomic,copy)void (^cls_itemssfwqdidTouchInside)(cls_itemSpriteNode *sender);
@property (nonatomic,assign)bool pro_itemSpriteenabled;

@end

NS_ASSUME_NONNULL_END
