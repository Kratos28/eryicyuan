//
//  cls_gamescene.m
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/8.
//

#import "cls_gamescene.h"
#import "cls_Tool.h"
#import "cls_conjzebutton.h"
#import "cls_itemSpriteNode.h"
#import "cls_MonsterNode.h"
#import "cls_userInfo.h"
#import "cls_xuetiaoNode.h"
#import "cls_warehouseModel.h"
#define jiatelin @"jiatelin"
#define huojianpao @"huojianpao"
#define jiguang @"jiguang"
#define baohuzhao @"baohuzhao"

static uint32_t heromask = 1<<0;
static uint32_t monstermask = 1 <<1;
static uint32_t texiaomask = 1 <<2;
static uint32_t monsterBossmask = 1 <<3;
@interface cls_gamescene()  <SKPhysicsContactDelegate>
@property (nonatomic,strong) NSMutableArray *pro_guaiwus;
@property (nonatomic,strong)cls_MonsterNode *pro_hero;
@property (nonatomic,assign)bool  pro_fanghuzhaoxiaoguo;
@end

@implementation cls_gamescene
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
    if ((bodyA.categoryBitMask == texiaomask  && bodyB.categoryBitMask == monstermask) ||
        (bodyA.categoryBitMask == texiaomask && bodyB.categoryBitMask == monsterBossmask))
    {
        //打中boss
        if (![bodyB.node.name isEqualToString:@"guaiwujineng"])
        {
            
            cls_MonsterNode * monster = bodyB.node;
            int health = monster.pro_monsterxuetiao.pro_currentValue;
            

            if ([bodyA.node.name isEqualToString:jiatelin]){
                //格林机枪
                health =  health - 80;
                [bodyA.node removeFromParent];
            }else if ([bodyA.node.name isEqualToString:huojianpao]){
                //火箭炮

                health =  health - 100;
                
                
                SKTexture *texture = [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_0"]];
                SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:texture];
                sprite.size = texture.size;
                sprite.zPosition = 2;
                sprite.anchorPoint = CGPointMake(0.5, 0);
                sprite.position = CGPointMake(RPX(0),RPY(-monster.size.height  + RPY(70)));
                [monster addChild:sprite];
                
                
                NSArray *SKTextures = @[
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_0"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_01"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_02"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_03"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_04"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_05"]]
                ];


    //
           
                SKAction *animationAction = [SKAction animateWithTextures:SKTextures timePerFrame:0.5];
                [sprite runAction:animationAction completion:^{
                    [sprite removeFromParent];
                }];
                
                
            }else if ([bodyA.node.name isEqualToString:jiguang]){
                //镭射激光
                    health =  health - 200;

            }else
            {//普gongji
                health =  health - 10;
                [bodyA.node removeFromParent];
            }
            
            if (health < 0){
                health = 0;
            }
            [monster.pro_monsterxuetiao updateHealth:health];
            
            if ( monster.pro_monsterxuetiao.pro_currentValue<=0)
            {
                
                SKAction *wait = [SKAction waitForDuration:0.3];
                [monster runAction:wait completion:^{
                    [monster removeFromParent];
                    [self.pro_guaiwus removeObject:monster];
                }];
             
            }
            
        }
      
        
        
    }else if ((bodyA.categoryBitMask == texiaomask  &&  bodyB.categoryBitMask == monstermask)|| (bodyB.categoryBitMask == texiaomask && bodyA.categoryBitMask == monstermask))
    {
        
        if (![bodyA.node.name isEqualToString:@"guaiwujineng"])
        {
            cls_MonsterNode * monster = bodyA.node;
            //  打中小怪
            int health = monster.pro_monsterxuetiao.pro_currentValue;
            if ([bodyB.node.name isEqualToString:jiatelin]){
                //格林机枪
                health =  health - 80;
                [bodyB.node removeFromParent];

            }else if ([bodyB.node.name isEqualToString:huojianpao]){
                //火箭炮

                health =  health - 100;
                
                
                SKTexture *texture = [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_0"]];
                SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:texture];
                sprite.size = texture.size;
                sprite.zPosition = 2;
                sprite.anchorPoint = CGPointMake(0.5, 0);
                sprite.position = CGPointMake(RPX(0),RPY(-monster.size.height + RPY(70)));
                [monster addChild:sprite];
                
                
                NSArray *SKTextures = @[
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_0"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_01"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_02"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_03"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_04"]],
                    [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_special_baozha_05"]]
                ];


    //
           
                SKAction *animationAction = [SKAction animateWithTextures:SKTextures timePerFrame:0.5];
                [sprite runAction:animationAction completion:^{
                    [sprite removeFromParent];
                }];
                
            }else if ([bodyB.node.name isEqualToString:jiguang]){
                //镭射激光
                    health =  health - 200;

            }else
            {//普gongji
                health =  health - 20;
                [bodyB.node removeFromParent];

            }
            
            if (health < 0){
                health = 0;
            }
            [monster.pro_monsterxuetiao updateHealth:health];
            if ( monster.pro_monsterxuetiao.pro_currentValue<=0)
            {
                SKAction *wait = [SKAction waitForDuration:0.3];
                [monster runAction:wait completion:^{
                    [monster removeFromParent];
                    [self.pro_guaiwus removeObject:monster];
                }];
            }
        }
        
      
            
   
    }
    
    
 
  if (bodyA.categoryBitMask == heromask ||  bodyB.categoryBitMask == heromask) {
      
      if (self.pro_fanghuzhaoxiaoguo == YES){
          return;;
      }
      
      cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
      int health = self.pro_hero.pro_monsterxuetiao.pro_currentValue;
      health =  health - 2;

      

          [self.pro_hero.pro_monsterxuetiao updateHealth:health];
      if ( self.pro_hero.pro_monsterxuetiao.pro_currentValue<=0)
      {
          [[NSNotificationCenter defaultCenter]postNotificationName:@"loseNote" object:nil];
          
          [self pauseAllNodes];
      }
  }


}

- (void)fun_setupcountdownLabel
{
    
    
      SKLabelNode *countdownLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Bold"];
      countdownLabel.text = @"60";
      countdownLabel.fontColor = [UIColor whiteColor];
    countdownLabel.fontSize = RPX(40);
      countdownLabel.position = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height- RPY(40));
      [self addChild:countdownLabel];
        
      SKAction *countdownSequence = [SKAction sequence:@[
          [SKAction waitForDuration:1],
          [SKAction runBlock:^{
              int count = [countdownLabel.text intValue] - 1;
              countdownLabel.text = [NSString stringWithFormat:@"%d", count];
              if (count <= 0)
              {
                  [[NSNotificationCenter defaultCenter]postNotificationName:@"winnote" object:nil];
                  [self pauseAllNodes];
              }
          }],
      ]];
        
      SKAction *repeatCountdown = [SKAction repeatAction:countdownSequence count:60];
      [countdownLabel runAction:repeatCountdown withKey:@"countdown"];

  
    
   
}


- (void)didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
    self.physicsWorld.contactDelegate = self;
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.pro_guaiwus = [NSMutableArray array];
  
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_bg_battle"]]];
   
    background.position = CGPointMake(self.size.width/2, self.size.height/2);
    background.size = CGSizeMake(self.size.width, self.size.height);
    [self addChild:background];
    
    
    
    cls_itemSpriteNode *item =  [[cls_itemSpriteNode alloc]initWithColor:nil size:CGSizeMake(RPX(50), RPX(50))];
    [item setCls_itemssfwqdidTouchInside:^(cls_itemSpriteNode * _Nonnull sender) {
        [self.pro_hero.pro_monsterxuetiao updateHealth:100];
        
        SKLabelNode *   countdownLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Bold"];
         countdownLabel.text =  @"+100";

         countdownLabel.fontSize = RPX(35);
         countdownLabel.fontColor = [UIColor redColor];
         countdownLabel.position = CGPointMake(RPX(0),self.pro_hero.size.height  - RPY(30));
           countdownLabel.zPosition = 10;
             
           [self.pro_hero addChild:countdownLabel];
         
         
         SKAction *countdownSequence = [SKAction sequence:@[
             [SKAction waitForDuration:1]
         ]];
         
         
         [countdownLabel runAction:countdownSequence completion:^{
             [countdownLabel removeFromParent];
         }];
    }];
    
    item.position = CGPointMake(RPX(70), RPY(30));
    [self addChild:item];
    

    
    
    SKSpriteNode *hero = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_image_player"]]];
   
    hero.position = CGPointMake(RPX(100), self.size.height/2);
    hero.size = CGSizeMake(RPX(100), RPX(250));
    [self addChild:hero];
    
    cls_MonsterNode *pet = [[cls_MonsterNode alloc]initWitsize:CGSizeMake(RPX(120), RPX(120)) withdiren:NO imagename:@"img_anim_dh_00"];
    pet.name = @"hero";
    pet.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(RPX(120), RPX(120))];
    pet.position = CGPointMake(RPX(200), RPX(150));
    pet.physicsBody.categoryBitMask = heromask;
    pet.physicsBody.contactTestBitMask = monstermask | monsterBossmask;
    pet.physicsBody.collisionBitMask = monstermask | monsterBossmask;
    pet.physicsBody.dynamic = NO;
    [self addChild:pet];
    self.pro_hero = pet;

    

    
    [self fun_setupBottom];
    
    cls_userInfo *user  = [cls_userInfo fun_getuserInfo];
    
    SKAction *spawn =  [SKAction runBlock:^{
//        if (self.pro_guaiwus.count < 1)

        if (self.pro_guaiwus.count < user.pro_guanshu *2)
        {

            [self fun_spawnguaiwu];

        }

     
    }];

    SKAction *var_delay =  [SKAction waitForDuration:2];
    SKAction *var_spwawnthenDelay =  [SKAction sequence:@[spawn,var_delay]];
    SKAction *var_spwawnthenForever =  [SKAction repeatActionForever:var_spwawnthenDelay];
    [self runAction:var_spwawnthenForever];
    
    
    

//
    
    SKAction *spawn1 =  [SKAction runBlock:^{
        
            [self fun_ATKtexiaoleft];
       
    }];

    SKAction *var_delay1 =  [SKAction waitForDuration:0.7];
    SKAction *var_spwawnthenDelay1 =  [SKAction sequence:@[spawn1,var_delay1]];
    SKAction *var_spwawnthenForever1 =  [SKAction repeatActionForever:var_spwawnthenDelay1];
    [self runAction:var_spwawnthenForever1];
    [self fun_setupcountdownLabel];

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}
- (void)fun_ATKtexiaoleft
{
    
    SKTexture *var_texiaotexture =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiatelin02"]];
    SKSpriteNode *spriteNote_texiao = [SKSpriteNode spriteNodeWithTexture:var_texiaotexture];
    spriteNote_texiao.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spriteNote_texiao.size];
    spriteNote_texiao.physicsBody.categoryBitMask = texiaomask;
    spriteNote_texiao.physicsBody.contactTestBitMask = monstermask | monsterBossmask;
    spriteNote_texiao.physicsBody.collisionBitMask = 0;
    spriteNote_texiao.physicsBody.dynamic = YES;
    spriteNote_texiao.name = @"texiao";
    CGRect rect =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_battle_jiatelin02"]];
    spriteNote_texiao.size = rect.size;
    [self addChild:spriteNote_texiao];

  
  
        CGPoint p =   [self convertPoint:self.pro_hero.frame.origin fromNode:self.pro_hero];

        int speed = 1;
        
        int dis = self.frame.size.width;
        
    
        spriteNote_texiao.position = CGPointMake((self.pro_hero.position.x+ self.pro_hero.size.width /2), self.pro_hero.position.y);
        
        SKAction *move = [SKAction moveToX:dis duration:1];
        [spriteNote_texiao runAction:move completion:^{
            [spriteNote_texiao removeFromParent];
            
        }];
    
 
    
    
}
- (void)fun_actionSpeed0{
}
// 暂停所有节点的执行
- (void)pauseAllNodes
{
//    [self traverseNodes:self.children pause:YES];
    
    
    [self removeAllActions];
    [self removeAllChildren];
}

// 继续所有节点的执行
- (void)resumeAllNodes
{
    [self traverseNodes:self.children pause:NO];
}




- (void)traverseNodes:(NSArray<SKNode *> *)nodes pause:(BOOL)pause {
    for (SKNode *node in nodes) {
        node.paused = pause;
        node.speed = pause;
        [self traverseNodes:node.children pause:pause];
    }
    
}
#pragma mark 添加怪物和发射技能
- (void)fun_spawnguaiwu
{
    
    int rand =  arc4random_uniform(3);
//    int rand =  0;
    cls_MonsterNode *monster;
    
    if (rand == 0)
    {
        monster  = [[cls_MonsterNode alloc]initWitsize:CGSizeMake(RPX(100), RPX(190)) withdiren:YES imagename:@"img_battle_image_boss"];
        monster.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:monster.size];
        monster.name = @"Boss";
        monster.physicsBody.categoryBitMask = monsterBossmask;

    }else if  (rand == 1)
    {
        monster  = [[cls_MonsterNode alloc]initWitsize:CGSizeMake(RPX(100), RPX(190)) withdiren:YES imagename:@"img_battle_image_monster"];
        monster.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:monster.size];
        monster.physicsBody.categoryBitMask = monstermask;
        monster.name = @"monster";

    }else{
        monster  = [[cls_MonsterNode alloc]initWitsize:CGSizeMake(RPX(100), RPX(190)) withdiren:YES imagename:@"img_battle_image_monster2"];
        monster.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:monster.size];
        monster.name = @"monster";

        monster.physicsBody.categoryBitMask = monstermask;
    }
    monster.position = CGPointMake(RPX(500), RPX(150));

    
    monster.physicsBody.contactTestBitMask = heromask;
    monster.physicsBody.collisionBitMask = heromask;

    [self addChild:monster];
    [self.pro_guaiwus addObject:monster];
    
    
//    CGFloat shakeAmplitude = 2.0f; // 抖动幅度
//    CGFloat shakeSpeed  = ((CGFloat)arc4random() / (CGFloat)UINT32_MAX) * (0.3 - 0.1) + 0.1;
//    SKAction *shakeAction = [SKAction customActionWithDuration:shakeSpeed actionBlock:^(SKNode *node, CGFloat elapsedTime) {
//        CGFloat sineWave = sin(2 * M_PI * elapsedTime / shakeSpeed);
//        node.position = CGPointMake(node.position.x + shakeAmplitude * sineWave, node.position.y);
//    }];
//    SKAction *repeatAction = [SKAction repeatActionForever:shakeAction];
//    [monster runAction:repeatAction];

        //怪物右边出来
        monster.position = CGPointMake(self.frame.size.width , RPX(150));
    

      SKAction *move =   [SKAction moveToX:self.frame.size.width- monster.frame.size.width   duration:2];

    [monster runAction:move completion:^{
        
  
        SKAction *waitAction = [SKAction waitForDuration:1];
        SKAction *baction =  [SKAction runBlock:^{
           
            
            SKTexture *  var_texiaotexture =       [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_icon_monster_attack"]];
            CGRect rect =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_battle_icon_monster_attack"]];
            
            SKSpriteNode *   spriteNote_texiao =  [SKSpriteNode spriteNodeWithTexture:var_texiaotexture];
            spriteNote_texiao.anchorPoint = CGPointMake(1, 1);
            spriteNote_texiao.position = CGPointMake(-RPX(30),0);
            
            spriteNote_texiao.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spriteNote_texiao.size];
            
            if ([monster.name isEqualToString:@"Boss"])
            {
                spriteNote_texiao.physicsBody.categoryBitMask = monsterBossmask;
            }else
            {
                spriteNote_texiao.physicsBody.categoryBitMask = monstermask;
            }
            spriteNote_texiao.physicsBody.contactTestBitMask =   heromask;
            spriteNote_texiao.physicsBody.collisionBitMask = texiaomask;
//            spriteNote_texiao.physicsBody.dynamic = YES;
            spriteNote_texiao.name = @"guaiwujineng";
            spriteNote_texiao.size = rect.size;
            [monster addChild:spriteNote_texiao];

            
            CGPoint p = [monster convertPoint:spriteNote_texiao.position toNode:self.pro_hero];
            
            
            
              CGMutablePathRef path = CGPathCreateMutable();
              CGPathMoveToPoint(path, NULL, -RPX(0), RPY(70));
            
              int rand =  arc4random_uniform(3);
            int xf = 0;
            int yf = 0;
            if (rand <0)
            {
                xf =  RPX(-100);
                yf =  RPX(200);

            }else if (rand <1)
            {
                xf =  RPX(-120);
                yf =  RPX(200);
            }else
            {
                xf =  RPX(-150);
                yf =  RPX(200);
            }
              CGPathAddQuadCurveToPoint(path, NULL, xf, yf, -p.x, -p.y);
              
              SKAction *followPath = [SKAction followPath:path duration:1.0];

              
            SKAction *sequence = [SKAction sequence:@[followPath]];
              CGPathRelease(path);
            
            
            
         
            
    //        SKAction *move = [SKAction moveToX:-p.x duration:1];
            [spriteNote_texiao runAction:sequence completion:^{
                [spriteNote_texiao removeFromParent];
                
            }];
            
            
        }];
        
        SKAction *seq = [SKAction sequence:@[waitAction,baction]];
      SKAction  * repeat = [SKAction repeatActionForever:seq];
        
        [monster runAction:repeat];
    
        
    }];
        
    
    
    


    

}

//加特林
- (void)fun_jineng:(NSString *)jinengname{
    
    
    

    SKTexture *var_texiaotexture =  [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiatelin02"]];
    SKSpriteNode *spriteNote_texiao = nil;
    if ([jinengname isEqualToString:jiatelin])
    {
        var_texiaotexture =       [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiatelin02"]];
        CGRect rect =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_battle_jiatelin02"]];
        
        CGPoint p =   [self convertPoint:self.pro_hero.frame.origin fromNode:self.pro_hero];
        int speed = 1;
        int dis = self.frame.size.width;
        spriteNote_texiao =  [SKSpriteNode spriteNodeWithTexture:var_texiaotexture];
        spriteNote_texiao.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spriteNote_texiao.size];
        spriteNote_texiao.physicsBody.categoryBitMask = texiaomask;
        spriteNote_texiao.physicsBody.contactTestBitMask = monstermask | monsterBossmask;
        spriteNote_texiao.physicsBody.collisionBitMask = 0;
        spriteNote_texiao.physicsBody.dynamic = YES;
        spriteNote_texiao.name = jinengname;
        spriteNote_texiao.size = rect.size;
        [self addChild:spriteNote_texiao];

        spriteNote_texiao.position = CGPointMake((self.pro_hero.position.x+ self.pro_hero.size.width /2), self.pro_hero.position.y);
    
        SKAction *move = [SKAction moveToX:dis duration:1];
        [spriteNote_texiao runAction:move completion:^{
            [spriteNote_texiao removeFromParent];
        }];
      

    }else if ([jinengname isEqualToString:huojianpao])
    {
        
        CGPoint p =   [self convertPoint:self.pro_hero.frame.origin fromNode:self.pro_hero];
        int speed = 1;
        
        int dis = self.frame.size.width;
        SKTexture *texture = [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_huojian02"]];
        spriteNote_texiao = [SKSpriteNode spriteNodeWithTexture:texture];
        spriteNote_texiao.size = texture.size;
        spriteNote_texiao.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spriteNote_texiao.size];
        spriteNote_texiao.physicsBody.categoryBitMask = texiaomask;
        spriteNote_texiao.physicsBody.contactTestBitMask = monstermask | monsterBossmask;
        spriteNote_texiao.physicsBody.collisionBitMask = 0;
        spriteNote_texiao.physicsBody.dynamic = YES;
        spriteNote_texiao.name = jinengname;
        spriteNote_texiao.size = texture.size;
        [self addChild:spriteNote_texiao];
            spriteNote_texiao.position = CGPointMake((self.pro_hero.position.x+ self.pro_hero.size.width /2), self.pro_hero.position.y);
            SKAction *move = [SKAction moveToX:dis duration:1];
            [spriteNote_texiao runAction:move completion:^{
                [spriteNote_texiao removeFromParent];
              
            }];
            
     
        
    }else if ([jinengname isEqualToString:jiguang])
    {
        var_texiaotexture = [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiguang"]];
        
   
        NSArray *SKTextures = @[
            [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiguang"]],
            [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiguang1"]],
            [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiguang3"]],
            [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiguang4"]],
            [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiguang5"]],
        ];

            
//
        SKTexture *texture = [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_jiguang"]];
        spriteNote_texiao = [SKSpriteNode spriteNodeWithTexture:texture];
        spriteNote_texiao.size = CGSizeMake(self.view.frame.size.width, RPY(35));
        spriteNote_texiao.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spriteNote_texiao.size];
        spriteNote_texiao.physicsBody.categoryBitMask = texiaomask;
        spriteNote_texiao.physicsBody.contactTestBitMask = monstermask | monsterBossmask;
        spriteNote_texiao.physicsBody.collisionBitMask = 0;
        spriteNote_texiao.physicsBody.dynamic = YES;
        spriteNote_texiao.anchorPoint = CGPointMake(0, 0);
        spriteNote_texiao.name = jinengname;
        [self addChild:spriteNote_texiao];
        spriteNote_texiao.position = CGPointMake(CGRectGetMaxX(self.pro_hero.frame), self.pro_hero.position.y);
        SKAction *animationAction = [SKAction animateWithTextures:SKTextures timePerFrame:0.1];
        
        SKAction *a =  [SKAction resizeToWidth:self.view.frame.size.width duration:0.1];
        SKAction *seq =  [SKAction group:@[animationAction,a]];
        
        SKAction *repeatAction =   [SKAction repeatAction:seq count:1];
        [spriteNote_texiao runAction:repeatAction completion:^{
            [spriteNote_texiao removeFromParent];
        }];
        
    }else
    {    self.pro_fanghuzhaoxiaoguo = YES;

            var_texiaotexture = [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_baohuzhao1"]];
            
       
            NSArray *SKTextures = @[
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_baohuzhao1"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_baohuzhao2"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_baohuzhao3"]],
                [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_baohuzhao4"]],
            ];
        CGRect rect =  [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_battle_baohuzhao1"]];
        SKTexture *texture = [SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_baohuzhao1"]];
        spriteNote_texiao = [SKSpriteNode spriteNodeWithTexture:texture];
        spriteNote_texiao.size = CGSizeMake(RPX(200), RPX(200));
        spriteNote_texiao.name = jinengname;
        [self addChild:spriteNote_texiao];
        spriteNote_texiao.position = CGPointMake((self.pro_hero.position.x), self.pro_hero.position.y);
        SKAction *animationAction = [SKAction animateWithTextures:SKTextures timePerFrame:0.1];
        
        
        
        SKAction *repeatAction =   [SKAction repeatAction:animationAction count:10];
        [spriteNote_texiao runAction:repeatAction completion:^{
            [spriteNote_texiao removeFromParent];
            self.pro_fanghuzhaoxiaoguo = NO;

        }];
        
    }

    


 
}

- (void)fun_setupBottom
{
    
    cls_conjzebutton * button = [[cls_conjzebutton alloc]initWithImage:[cls_Tool fun_imageName:@"img_battle_icon_skill1"] color:nil size:CGSizeMake(RPX(50), RPX(50))];
    button.position = CGPointMake(RPX(200), RPY(30));
    weakify(self);
    [button setDidTouchInside:^(cls_conjzebutton * _Nonnull sender) {
        strongify(self);
        [self fun_jineng:jiatelin];
        
        

    }];
    [self addChild:button];
    
    
    cls_conjzebutton * button1 = [[cls_conjzebutton alloc]initWithImage:[cls_Tool fun_imageName:@"img_battle_icon_skill2"] color:nil size:CGSizeMake(RPX(50), RPX(50))];
    button1.position = CGPointMake(RPX(280), RPY(30));
    [button1 setDidTouchInside:^(cls_conjzebutton * _Nonnull sender) {
        strongify(self);

        [self fun_jineng:huojianpao];
    }];
    [self addChild:button1];
    
    cls_conjzebutton * button2 = [[cls_conjzebutton alloc]initWithImage:[cls_Tool fun_imageName:@"img_battle_icon_skill3"] color:nil size:CGSizeMake(RPX(50), RPX(50))];
    button2.position = CGPointMake(RPX(350), RPY(30));
    [button2 setDidTouchInside:^(cls_conjzebutton * _Nonnull sender) {
        strongify(self);
        [self fun_jineng:jiguang];
    }];
    [self addChild:button2];
    
    cls_conjzebutton * button3 = [[cls_conjzebutton alloc]initWithImage:[cls_Tool fun_imageName:@"img_battle_icon_skill4"] color:nil size:CGSizeMake(RPX(50), RPX(50))];
    button3.position = CGPointMake(RPX(430), RPY(30));
    [button3 setDidTouchInside:^(cls_conjzebutton * _Nonnull sender) {
        strongify(self);
        [self fun_jineng:baohuzhao];
        
//        int health =  self.pro_hero.xuetiao.pro_currentValue;
//        health = health + 50;
//        if (health + 50 > self.pro_hero.xuetiao.pro_maxValue)
//        {
//            health = self.pro_hero.xuetiao.pro_maxValue;
//        }
//        [self.pro_hero.xuetiao updateHealth:health];
        
        

//       SKLabelNode *   countdownLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Bold"];
//        countdownLabel.text =  @"+50";
//
//        countdownLabel.fontSize = RPX(35);
//        countdownLabel.fontColor = [UIColor redColor];
//        countdownLabel.position = CGPointMake(RPX(0),self.pro_hero.size.height  - RPY(30));
//          countdownLabel.zPosition = 10;
//
//          [self.pro_hero addChild:countdownLabel];
//
//
//        // 创建倒计时动作序列
//        SKAction *countdownSequence = [SKAction sequence:@[
//            [SKAction waitForDuration:1]
//        ]];
//
//
//        // 重复执行倒计时动作序列，创建一个无限循环的倒计时
//        [countdownLabel runAction:countdownSequence completion:^{
//            [countdownLabel removeFromParent];
//        }];
        
        
    }];
    [self addChild:button3];
}
@end
