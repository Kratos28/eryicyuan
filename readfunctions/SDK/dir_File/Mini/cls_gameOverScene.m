//
//  cls_gameOverScene.m
//  Game
//
//  Created by 9130Game on 2023/11/22.
//

#import "cls_gameOverScene.h"
#import "cls_Tool.h"
#import "cls_gameScene.h"

@implementation cls_gameOverScene


- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self)
    {
        SKTexture *texture1 =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_lose_bg"]];
        SKSpriteNode *spriteNote = [SKSpriteNode spriteNodeWithTexture:texture1];
        spriteNote.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        spriteNote.size = self.frame.size;
        [self addChild:spriteNote];

    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    cls_gameScene *s =   [[cls_gameScene alloc]initWithSize:self.view.frame.size];
    [self.view presentScene:s];
    

}
@end
