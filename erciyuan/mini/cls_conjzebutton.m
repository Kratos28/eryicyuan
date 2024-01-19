//
//  cls_conjzebutton.m
//  Pojun
//
//  Created by 9130Game on 2023/12/6.
//

#import "cls_conjzebutton.h"
#import "cls_Tool.h"
@implementation cls_conjzebutton
{
    SKLabelNode *countdownLabel;
     int countdownValue;
    NSTimer *timer;
}
- (instancetype)initWithImage:(UIImage *)image color:(SKColor *)color size:(CGSize)size
{
    self = [super init];
    if (self)
    {
        _pro_enabled =YES;

        self.userInteractionEnabled = true;
        if(color)
        {
            
            _pro_conjzebackgroudNode = [[SKShapeNode alloc]init];
            _pro_conjzebackgroudNode.position = CGPointZero;
            _pro_conjzebackgroudNode.fillColor = color;
            _pro_conjzebackgroudNode.strokeColor = [SKColor clearColor];
            _pro_conjzebackgroudNode.zPosition = 1;
              
            CGRect rect = CGRectMake(0, 0, size.width, size.height); // 矩形的位置和大小
              
            // 创建矩形路径
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddRect(path, NULL, rect);
            _pro_conjzebackgroudNode.path = path;
              
            CGPathRelease(path);
            [self addChild:_pro_conjzebackgroudNode];
        }
        
        if (image){

            SKTexture *texture = [SKTexture textureWithImage:image];
            _pro_conjzeimageNode = [SKSpriteNode spriteNodeWithTexture:texture];
            _pro_conjzeimageNode.position = CGPointZero;
            _pro_conjzeimageNode.size = size;
            _pro_conjzeimageNode.zPosition = 1;
            [self addChild:_pro_conjzeimageNode];
        }
        
        _pro_conjzeLabelNode = [SKLabelNode labelNodeWithText:@""];
        _pro_conjzeLabelNode.zPosition = 1;

        [self addChild:_pro_conjzeLabelNode];
    }
    
    

    
    return  self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_pro_enabled == false) return;;
    [_pro_conjzeimageNode setScale:0.9];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_pro_enabled == false) return;;
    if (_didTouchInside){
        _didTouchInside(self);
    }
    [self startCountdown];

    [_pro_conjzeimageNode setScale:1];
}

-(void)startCountdown {
    self.pro_enabled = NO;
    
    countdownValue = 10; // 初始化倒计时值
    countdownLabel =[SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Bold"];
    countdownLabel.text = @"10";
    countdownLabel.fontSize = RPX(35); // 设置字体大小
    countdownLabel.fontColor = [UIColor whiteColor];
    countdownLabel.position = CGPointMake(RPX(0), RPY(-15));
      countdownLabel.zPosition = 10; // 将标签节点放在其他节点的上面
        
      [_pro_conjzeLabelNode addChild:countdownLabel]; // 将标签节点添加到场景中
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats:YES]; // 每秒更新一次倒计时值
    
}
-(void)stopCountdown {
    // 停止倒计时的逻辑，例如移除定时器或显示特定的UI元素
    [countdownLabel removeFromParent]; // 从场景中移除标签节点（可选）
    self.pro_enabled  = YES;
    countdownValue = 10;
    [timer invalidate];
}

-(void)updateCountdown {
    countdownValue = countdownValue - 1;; // 减少倒计时值
    countdownLabel.text = [NSString stringWithFormat:@"%d", countdownValue]; // 更新标签节点的文本
    if (countdownValue <= 0) {
        // 当倒计时结束时执行的操作，例如显示胜利或游戏结束的提示
        [self stopCountdown]; // 停止倒计时
    }
}

- (void)setPro_enabled:(bool)pro_enabled{
    _pro_enabled = pro_enabled;
    if (pro_enabled)
    {

        
        [[_pro_conjzeimageNode childNodeWithName:@"shapde"] removeFromParent];
    }else
    {
        
        SKShapeNode *shapde = [[SKShapeNode alloc]init];
        shapde.position = CGPointZero;
        shapde.fillColor = [[SKColor grayColor]colorWithAlphaComponent:0.5];;
        shapde.strokeColor = [SKColor grayColor];
        shapde.zPosition = 1;
        
        // 创建矩形路径
        CGRect rect = CGRectMake(-_pro_conjzeimageNode.frame.size.width /2, -_pro_conjzeimageNode.frame.size.height /2, _pro_conjzeimageNode.frame.size .width,_pro_conjzeimageNode.frame.size.height); // 矩形的位置和大小
        CGMutablePathRef path = CGPathCreateMutable();

        
        NSInteger startAngle =0;

        CGFloat startAngleRadians = startAngle * M_PI / 180.0;

        CGFloat endAngleRadians = startAngleRadians + 2 * M_PI;
        CGPathAddArc(path, NULL, CGRectGetMidX(self.pro_conjzeimageNode.frame), CGRectGetMidY(self.pro_conjzeimageNode.frame), self.pro_conjzeimageNode.frame.size.width /2 , startAngleRadians, endAngleRadians, NO);
        shapde.name = @"shapde";
        shapde.path = path;
        CGPathRelease(path);
        
        [_pro_conjzeimageNode addChild:shapde];

    }
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
@end
