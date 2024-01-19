//
//  cls_conjzebutton.h
//  Pojun
//
//  Created by 9130Game on 2023/12/6.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_conjzebutton : SKNode
@property (nonatomic,strong)SKShapeNode *pro_conjzebackgroudNode;
@property (nonatomic,strong)SKSpriteNode *pro_conjzeimageNode;
@property (nonatomic,strong)SKLabelNode *pro_conjzeLabelNode;



@property (nonatomic,strong)UIImage *pro_conjzenorImage;
@property (nonatomic,copy)NSString *pro_conjzetitle;
@property (nonatomic,assign)bool pro_enabled;
@property (nonatomic,copy)void (^didTouchInside)(cls_conjzebutton *sender);
- (instancetype)initWithImage:(UIImage *)image color:(SKColor *)color size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
