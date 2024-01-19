//
//  cls_winScene.m
//  Game
//
//  Created by 9130Game on 2023/11/22.
//

#import "cls_winScene.h"
#import "cls_gameScene.h"
#import "cls_Tool.h"
#import "cls_userInfo.h"
@implementation cls_winScene
- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self)
    {
        SKTexture *texture1 =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_win_bg"]];
        SKSpriteNode *spriteNote = [SKSpriteNode spriteNodeWithTexture:texture1];
        spriteNote.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        spriteNote.size = self.frame.size;
        [self addChild:spriteNote];
        
        
        cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
        user.pro_gold = user.pro_gold + 100;
        user.pro_guanshu += 1;
        user.pro_shu += 5;
        [user fun_save];
        updateNote;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    cls_gameScene *s =   [[cls_gameScene alloc]initWithSize:self.view.frame.size];
    [self.view presentScene:s];
    
}
@end
