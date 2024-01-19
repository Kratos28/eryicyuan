//
//  cls_MonsterNode.m
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/9.
//

#import "cls_MonsterNode.h"
#import "cls_xuetiaoNode.h"
#import "cls_Tool.h"
#import "cls_userInfo.h"
@implementation cls_MonsterNode
- (instancetype)initWitsize:(CGSize)size withdiren:(BOOL)diren imagename:(NSString *)name;
{
    self = [super initWithColor:[UIColor clearColor] size:size];
    if (self)
    {
        
        if (!diren)
        {
            
//            //血条
      
            
        
            

            NSArray *SKTextures = @[
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_00"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_01"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_02"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_03"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_04"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_05"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_06"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_07"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_08"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_09"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_10"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_11"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_12"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_13"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_14"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_15"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_16"]],
            ];

                
//
            SKTexture *texture = [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_anim_dh_00"]];
            SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:texture];
            sprite.size = size;
            sprite.position = CGPointMake(RPX(0),RPY(0));
            [self addChild:sprite];
            
            SKAction *animationAction = [SKAction animateWithTextures:SKTextures timePerFrame:0.3];
            SKAction *repeatAction =   [SKAction repeatActionForever:animationAction];
            [sprite runAction:repeatAction];
       
            
            
            cls_xuetiaoNode *xuetiao =      [[cls_xuetiaoNode alloc]initWithSize:CGSizeMake(RPX(60), 10)];
            xuetiao.pro_maxValue = 100;
            xuetiao.pro_currentValue = xuetiao.pro_maxValue;
            CGFloat x = CGRectGetMidX(self.frame);
            CGFloat y = CGRectGetMaxY(sprite.frame)+ RPY(10);
            xuetiao.position =  CGPointMake(x, y);
            
            [self addChild:xuetiao];
            self.pro_monsterxuetiao = xuetiao;

        }else{
            
            cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
          
            SKTexture *texture = [SKTexture textureWithImage:[cls_Tool fun_imageName:name]];
            SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:texture];
            sprite.size = size;
            sprite.position = CGPointMake(RPX(0),RPY(0));
            [self addChild:sprite];
            
            cls_xuetiaoNode *xuetiao =      [[cls_xuetiaoNode alloc]initWithSize:CGSizeMake(RPX(60), 10)];
            xuetiao.pro_maxValue = 100 + (((user.pro_guanshu-1) * 20) + 20);
            xuetiao.pro_currentValue = xuetiao.pro_maxValue;
              xuetiao.pro_backgroundNode.texture =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_icon_kuang"]];
              xuetiao.pro_foregroundNode.texture = [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_icon_read"]];
            CGFloat x = CGRectGetMidX(self.frame);
            CGFloat y =  CGRectGetMaxY(sprite.frame)+ RPY(10);
            xuetiao.position =  CGPointMake(x, y);
            [self addChild:xuetiao];
            self.pro_monsterxuetiao = xuetiao;
            
            
        }
       

        
    }
    return self;
}

@end
