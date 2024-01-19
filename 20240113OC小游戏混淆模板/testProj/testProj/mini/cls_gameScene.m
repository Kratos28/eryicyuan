//
//  cls_gameScene.m
//  Game
//
//  Created by 9130Game on 2023/11/21.
//

#import "cls_gameScene.h"
#import "cls_Tool.h"
#import "cls_xuetiaoNode.h"
#import "cls_userInfo.h"
#import "cls_gameOverScene.h"
#import "cls_winScene.h"
static uint32_t Defensemask = 1<<0;
static uint32_t monstermask = 1 <<1;
static uint32_t texiaomask = 1 <<2;


#define guaiwuY self.pro_Defense.frame.origin.y -  (self.pro_Defense.frame.size.height  /2) + RPY(150)

@interface cls_gameScene() <SKPhysicsContactDelegate>
@property (nonatomic, strong) cls_xuetiaoNode *xuetiao;
@property (nonatomic, strong) SKSpriteNode *pro_hero;
@property (nonatomic, strong) SKSpriteNode *pro_Defense;
@property (nonatomic, strong) SKLabelNode *pro_countdownLabel;
@property (nonatomic, assign) NSInteger pro_score;


@property (nonatomic, strong) SKTexture *pro_guaiwutexture;
@property (nonatomic,strong) SKAction *pro_guaiwumoveRightaction;
@property (nonatomic,strong) SKAction *pro_guaiwumoveLetfftaction;

@property (nonatomic,strong) NSMutableArray *pro_guaiwus;

@property (nonatomic,assign)int pro_heroisLeft;
@end

@implementation cls_gameScene


- (void)didBeginContact:(SKPhysicsContact *)contact
{
  

    SKPhysicsBody *bodyA, *bodyB;
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        bodyA = contact.bodyA;
        bodyB = contact.bodyB;
    } else {
        bodyA = contact.bodyB;
        bodyB = contact.bodyA;
    }
      
    if ((bodyA.categoryBitMask == monstermask && bodyB.categoryBitMask == texiaomask) || (bodyA.categoryBitMask == texiaomask && bodyB.categoryBitMask == monstermask)) {
        
        
        [bodyB.node removeFromParent];
        [bodyA.node removeFromParent];
        [self.pro_guaiwus removeObject:bodyB.node];
        [self.pro_guaiwus removeObject:bodyA.node];
        self.pro_score --;
        self.pro_countdownLabel.text = [NSString stringWithFormat:@"Resinal monster: %d",self.pro_score];
        if (self.pro_score== 0)
        {//胜利
            
            
     
            
            cls_winScene *gameOver = [[cls_winScene alloc]initWithSize:self.view.bounds.size];
            [self.view presentScene:gameOver];
            [self fun_removewSub];
            
            

            
            
        }
    }
    
  if (bodyA.categoryBitMask == Defensemask && bodyB.categoryBitMask == monstermask) {
      cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
      int health = self.xuetiao.pro_currentValue;      
      if (user.pro_guanshu == 1)
      {
          health =  health - 1;

      }else if  (user.pro_guanshu == 2)
      {
          health =  health - 0.9;

      }else if  (user.pro_guanshu == 3)
      {
          health =  health - 0.8;


      }else if  (user.pro_guanshu == 4)
      {
          health =  health - 0.7;

      }else if  (user.pro_guanshu == 5)
      {
          health =  health - 0.6;
      }else if  (user.pro_guanshu == 6)
      {
          health =  health - 0.5;
      }else if  (user.pro_guanshu == 7)
      {
          health =  health - 0.4;
      }else if  (user.pro_guanshu == 8)
      {
          health =  health - 0.4;
      }else if  (user.pro_guanshu == 9)
      {
          health =  health - 0.4;
      }
      
      
          [self.xuetiao updateHealth:health];
      if (health <= 0)
      {//失败
          cls_gameOverScene *gameOver = [[cls_gameOverScene alloc]initWithSize:self.view.bounds.size];
          [self.view presentScene:gameOver];
          [self fun_removewSub];
      }
  }



}

- (void)dealloc
{
    NSLog(@"释放");
}
- (void)didMoveToView:(SKView *)view
{
    self.physicsWorld.contactDelegate = self;
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.pro_guaiwus = [NSMutableArray array];
    
    
    cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    
    
    if (user.pro_guanshu == 1)
    {
        
        self.pro_score = 10;
    }else if  (user.pro_guanshu == 2)
    {
        self.pro_score = 15;

    }else if  (user.pro_guanshu == 3)
    {
        self.pro_score = 20;

    }else if  (user.pro_guanshu == 4)
    {
        self.pro_score = 25;

    }else if  (user.pro_guanshu == 5)
    {
        self.pro_score = 30;
    }else if  (user.pro_guanshu == 6)
    {
        self.pro_score = 35;
    }else if  (user.pro_guanshu == 7)
    {
        self.pro_score = 40;
    }else if  (user.pro_guanshu == 8)
    {
        self.pro_score = 45;
    }else if  (user.pro_guanshu == 9)
    {
        self.pro_score = 50;
    }
    
    
    //背景
    SKTexture *texture1 =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_bg"]];
    SKSpriteNode *spriteNote = [SKSpriteNode spriteNodeWithTexture:texture1];
    spriteNote.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    spriteNote.size = self.frame.size;
    [self addChild:spriteNote];





//    //countdown
    [self fun_setupcountdownLabel];
    //血条
    cls_xuetiaoNode *xuetiao =      [[cls_xuetiaoNode alloc]init];
    CGFloat x = CGRectGetMidX(self.frame);
    CGFloat y = RPY(650);
    xuetiao.position =  CGPointMake(x, y);
    [self addChild:xuetiao];
    self.xuetiao = xuetiao;

    [self fun_Defense];

    self.pro_guaiwutexture =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_3"]];;


    self.pro_guaiwumoveRightaction = [SKAction moveByX:-CGRectGetMaxX(self.pro_Defense.frame) y:0 duration:2];
    self.pro_guaiwumoveLetfftaction = [SKAction moveByX:CGRectGetMinX(self.pro_Defense.frame) +  (10)  y:0 duration:2];




    SKAction *spawn =  [SKAction runBlock:^{

        if (self.pro_guaiwus.count < 4)
        {

            [self fun_spawnguaiwu];

        }

     
    }];

    SKAction *var_delay =  [SKAction waitForDuration:2.0];
    SKAction *var_spwawnthenDelay =  [SKAction sequence:@[spawn,var_delay]];
    SKAction *var_spwawnthenForever =  [SKAction repeatActionForever:var_spwawnthenDelay];
    [self runAction:var_spwawnthenForever];
//
    
    SKAction *spawn1 =  [SKAction runBlock:^{
        
        if (self.pro_heroisLeft == 1)
        {
            [self fun_ATKtexiaoleft:false];
        }else if  (self.pro_heroisLeft == 2){
            [self fun_ATKtexiaoleft:true];
        }
    }];

    SKAction *var_delay1 =  [SKAction waitForDuration:0.7];
    SKAction *var_spwawnthenDelay1 =  [SKAction sequence:@[spawn1,var_delay1]];
    SKAction *var_spwawnthenForever1 =  [SKAction repeatActionForever:var_spwawnthenDelay1];
    [self runAction:var_spwawnthenForever1];
    
    
}


- (void)fun_ATKtexiaoleft:(Boolean)left
{
    SKTexture *var_texiaotexture =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_tx"]];
    SKSpriteNode *spriteNote_texiao = [SKSpriteNode spriteNodeWithTexture:var_texiaotexture];
    spriteNote_texiao.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spriteNote_texiao.size];
    spriteNote_texiao.physicsBody.categoryBitMask = texiaomask;
    spriteNote_texiao.physicsBody.contactTestBitMask = monstermask;
    spriteNote_texiao.physicsBody.collisionBitMask = monstermask;
    CGRect rect =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_battle_tx"]];
    spriteNote_texiao.size = CGSizeMake(RPX(80), RPX(110));
    [self addChild:spriteNote_texiao];

    if (left)
    {
  
        CGPoint p =   [self convertPoint:self.pro_hero.frame.origin fromNode:self.pro_Defense];

        int speed = 1;
        
        int dis = self.frame.size.width;
        
        

        
      
        spriteNote_texiao.position = CGPointMake(p.x+ (self.pro_hero.frame.size.width), p.y+ (self.pro_hero.frame.size.height /2));
        
        
        SKAction *move = [SKAction moveToX:dis duration:1];
        [spriteNote_texiao runAction:move completion:^{
            [spriteNote_texiao removeFromParent];
            
        }];
    }else{

        
        
        int speed = 1;
        
        int dis = 0;
        
        CGPoint p =   [self convertPoint:self.pro_hero.frame.origin fromNode:self.pro_Defense];

        
        spriteNote_texiao.position = CGPointMake(p.x, p.y+ (self.pro_hero.frame.size.height /2));
        
        spriteNote_texiao.xScale = -1;
        SKAction *move = [SKAction moveToX:0 duration:1];
        [spriteNote_texiao runAction:move completion:^{
            [spriteNote_texiao removeFromParent];
            
        }];
    }
 
    
    
}
- (void)fun_spawnguaiwu
{
    
    SKTexture *var_guaiwutexture =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_3"]];
    SKSpriteNode *spriteNote_guaiwu = [SKSpriteNode spriteNodeWithTexture:var_guaiwutexture];
    CGRect rect =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_battle_3"]];
    spriteNote_guaiwu.size = rect.size;
    spriteNote_guaiwu.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spriteNote_guaiwu.size];
    spriteNote_guaiwu.physicsBody.categoryBitMask = monstermask;
    spriteNote_guaiwu.physicsBody.contactTestBitMask = Defensemask;
    spriteNote_guaiwu.physicsBody.collisionBitMask = Defensemask;
    [self addChild:spriteNote_guaiwu];
    [self.pro_guaiwus addObject:spriteNote_guaiwu];
    
    CGFloat shakeAmplitude = 2.0f; // 抖动幅度
    CGFloat shakeSpeed  = ((CGFloat)arc4random() / (CGFloat)UINT32_MAX) * (0.3 - 0.1) + 0.1;
    SKAction *shakeAction = [SKAction customActionWithDuration:shakeSpeed actionBlock:^(SKNode *node, CGFloat elapsedTime) {
        CGFloat sineWave = sin(2 * M_PI * elapsedTime / shakeSpeed);
        node.position = CGPointMake(node.position.x + shakeAmplitude * sineWave, node.position.y);
    }];
    SKAction *repeatAction = [SKAction repeatActionForever:shakeAction];
    [spriteNote_guaiwu runAction:repeatAction];
    
    int i =  arc4random_uniform(2);

    if (i==0)
    {
        //怪物右边出来
        spriteNote_guaiwu.position = CGPointMake(self.frame.size.width  +  var_guaiwutexture.size.width * 2 , 100);
    
        spriteNote_guaiwu.name = @"guaiwuL";

        [spriteNote_guaiwu runAction:self.pro_guaiwumoveRightaction];
        
 
    }else
    {
        //怪物左边出来
        spriteNote_guaiwu.position = CGPointMake(0 , 100);
        spriteNote_guaiwu.xScale = -1;
        spriteNote_guaiwu.name = @"guaiwuR";
        [spriteNote_guaiwu runAction:self.pro_guaiwumoveLetfftaction];
 
    }
    


    

}



- (void)fun_Defense
{
    SKTexture *var_denfense =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_bhz"]];
   self.pro_Defense = [SKSpriteNode spriteNodeWithTexture:var_denfense];
    self.pro_Defense.position = CGPointMake(CGRectGetMidX(self.frame), RPY(300));
    CGRect rect =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_battle_bhz"]];
    
    CGSize size=  CGSizeMake(RPX(700), RPY(450));
    self.pro_Defense.size = size;
    self.pro_Defense.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    self.pro_Defense.physicsBody.categoryBitMask = Defensemask;
    self.pro_Defense.physicsBody.contactTestBitMask = monstermask;
    self.pro_Defense.name = @"fangyu";
    self.pro_Defense.physicsBody.dynamic = NO;
    [self addChild:self.pro_Defense];
    
    

    SKTexture *texturegongzhu =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_2"]];
    SKSpriteNode *spritegongzhuNote = [SKSpriteNode spriteNodeWithTexture:texturegongzhu];
    spritegongzhuNote.position = CGPointMake(0, RPY(-100));
    CGRect rect1 =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_battle_2"]];
    spritegongzhuNote.size = rect1.size;
    [self.pro_Defense addChild:spritegongzhuNote];


    SKTexture *var_herotexture =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_1"]];
    self.pro_hero = [SKSpriteNode spriteNodeWithTexture:var_herotexture];
    self.pro_hero.position = CGPointMake(0, RPY(-100));
    CGRect var_herorect =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_battle_1"]];
    self.pro_hero.size = var_herorect.size;
    [self.pro_Defense addChild:self.pro_hero];
    
}
- (void)fun_setupcountdownLabel
{
    SKLabelNode *countdownLabel = [SKLabelNode labelNodeWithFontNamed:@"MaShanZheng-Regular"];
    countdownLabel.position = CGPointMake(CGRectGetMaxX(self.frame)- RPX(200), CGRectGetMaxY(self.frame) - RPY(100) );
    countdownLabel.text = @"Resinal monster: ";
    countdownLabel.text = [NSString stringWithFormat:@"Resinal monster: %d",self.pro_score];
    countdownLabel.fontSize = 17;
    [self addChild:countdownLabel];
    self.pro_countdownLabel = countdownLabel;
    

    
    cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    SKLabelNode *var_stage = [SKLabelNode labelNodeWithFontNamed:@"MaShanZheng-Regular"];
    var_stage.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame) - RPY(60) );
    var_stage.text = [NSString stringWithFormat:@"Stage %d",user.pro_guanshu];
    var_stage.fontColor = [UIColor colorWithRed:208/255.0 green:173/255.0 blue:112/255.0 alpha:1];
    var_stage.fontSize = 20;
    [self addChild:var_stage];
    
   
}
- (void)fun_removewSub{
    [self removeAllActions];
    [self removeAllChildren];
    [self removeFromParent];
}

 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    

    
   

    
    
    UITouch *touch = [touches anyObject];
        CGPoint touchLocation = [touch locationInNode:self];


        CGSize sceneSize = self.size;

        if (touchLocation.x < sceneSize.width / 2) {
            SKAction *move = [SKAction moveToX:-(self.pro_Defense.frame.origin.x - (self.pro_hero.size.width)- (self.pro_hero.size.width) /2)  duration:0];
            self.pro_hero.xScale = -1;
            [self.pro_hero runAction:move completion:^{
                self.pro_heroisLeft = 1;
            }];
        } else {

            SKAction *move = [SKAction moveToX:(self.pro_Defense.frame.origin.x  - (self.pro_hero.size.width) - (self.pro_hero.size.width) /2) duration:0];
            self.pro_hero.xScale = 1;
            [self.pro_hero runAction:move completion:^{
                self.pro_heroisLeft = 2;
            }];


        }
}

@end
