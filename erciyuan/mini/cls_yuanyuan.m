//
//  cls_yuanyuan.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/7.
//

#import "cls_yuanyuan.h"
#import "cls_Tool.h"
#import "cls_userInfo.h"



@implementation cls_Arrive
@end



@interface cls_yuanyuan()
@property (nonatomic,strong)NSTimer * timer;
@property (nonatomic,strong)NSTimer * pro_timergold;

@property (nonatomic, strong) NSMutableArray<UIImageView *> *pro_coinsArray;
@property (nonatomic, assign) NSInteger pro_second;;
@property (nonatomic, strong) UIImageView *pro_avatarImageView;
@property (nonatomic, strong) UIImageView *pro_circleImageView;
@property (nonatomic, assign) CGPoint pro_avatarCenter;
@property (nonatomic, assign) CGFloat pro_circleRadius;
@property (nonatomic, assign) CGFloat pro_avatarRadius;
@end

@implementation cls_yuanyuan




- (instancetype)initWithFrame:(CGRect)frame withcircleImageView:(NSString *)imageName withAvatarImageName:(NSString *)AvatarImageName withpro_jinbishuliang:(NSInteger)pro_jinbishuliang;
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.pro_circleRadius = frame.size.width / 2;
        self.pro_avatarRadius = 20;
        self.pro_duration = 4.0;
        CGPoint center = self.center;
        self.pro_arrives = [NSArray array];
        self.pro_jinbishuliang =  pro_jinbishuliang;
        
        self.pro_circleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.pro_circleImageView.layer.cornerRadius = self.pro_circleRadius;
        self.pro_circleImageView.image = [cls_Tool fun_imageName:imageName];
        [self addSubview:self.pro_circleImageView];
        
        self.pro_avatarCenter = CGPointMake(center.x + self.pro_circleRadius - self.pro_avatarRadius, center.y);
        CGRect avatarFrame = CGRectMake(self.pro_avatarCenter.x - self.pro_avatarRadius, self.pro_avatarCenter.y - self.pro_avatarRadius, self.pro_avatarRadius * 2, self.pro_avatarRadius * 2);
        self.pro_avatarImageView = [[UIImageView alloc] initWithFrame:avatarFrame];
        self.pro_avatarImageView.image = [cls_Tool fun_imageName:AvatarImageName];
        self.pro_avatarImageView.backgroundColor = [UIColor blueColor]; // 设置头像图片的背景颜色为蓝色，仅作示例，请根据实际情况修改
        self.pro_avatarImageView.layer.cornerRadius = self.pro_avatarRadius;
        [self addSubview:self.pro_avatarImageView];
        self.pro_avatarImageView .hidden = YES;

        
        
        // 创建金币
         self.pro_coinsArray = [NSMutableArray array];
         [self createCoins];
        
   
    }
    return self;
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}
- (void)fun_refreshjinbi{
    
    self.pro_second = self.pro_second + 1;

    if ( self.pro_second >= 25)
    {
        if (self.pro_coinsArray.count == 0)
        {
            self.pro_second = 0;
            [self createCoins];
        }
    }
}
- (void)fun_yuanyuanstartAvatarMovement
{
    [self.timer invalidate];
    self.timer  = nil;
  self.timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(checkAvatarPosition) userInfo:nil repeats:YES];
//
//    [self.pro_timergold invalidate];
//    self.pro_timergold  = nil;
//    self.pro_timergold = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fun_refreshjinbi) userInfo:nil repeats:YES];
    
    self.pro_avatarImageView .hidden = NO;
    
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
      pathAnimation.calculationMode = kCAAnimationPaced;
      pathAnimation.fillMode = kCAFillModeForwards;
      pathAnimation.removedOnCompletion = NO;
      pathAnimation.repeatCount = HUGE_VALF;
        pathAnimation.duration = self.pro_duration;;
      
      CGMutablePathRef path = CGPathCreateMutable();
    

    
    NSInteger startAngle = self.pro_startAngle;

    CGFloat startAngleRadians = startAngle * M_PI / 180.0;

    CGFloat endAngleRadians = startAngleRadians + 2 * M_PI;
    
    
    CGPathAddArc(path, NULL, self.pro_circleImageView.center.x, self.pro_circleImageView.center.y, self.pro_circleRadius - self.pro_avatarRadius, startAngleRadians, endAngleRadians, NO); 

 
      pathAnimation.path = path;
      CGPathRelease(path);
    
    if ([self.pro_avatarImageView.layer animationForKey:@"avatarMovement"] == nil)
    {
        [self.pro_delegate fun_currentyuanyuan:self];
    }
    

      [self.pro_avatarImageView.layer addAnimation:pathAnimation forKey:@"avatarMovement"];
}




- (void)createCoins {
    NSMutableArray *coinPositions = [NSMutableArray array];
    CGFloat radius = self.pro_circleRadius - 10;
    NSInteger numberOfCoins = self.pro_jinbishuliang;
    CGFloat coinSize = 20.0;
    
    for (NSInteger i =  self.pro_coinsArray.count - 1; i >= 0; i--) {
        UIImageView *element = self.pro_coinsArray[i];
        [element removeFromSuperview];
        
    }
    
    for (NSInteger i = 0; i < numberOfCoins; i++) {
        // 生成随机角度
        CGFloat randomAngle = arc4random_uniform(360);
        
        CGFloat randomAngleRadians = randomAngle * M_PI / 180.0;
        
        CGFloat coinX = self.pro_circleImageView.center.x + radius * cos(randomAngleRadians);
        CGFloat coinY = self.pro_circleImageView.center.y + radius * sin(randomAngleRadians);
        
   
        UIImageView *coinImageView = [[UIImageView alloc] initWithFrame:CGRectMake(coinX - coinSize/2, coinY - coinSize/2, 20, 20)];
        
        coinImageView.image = [cls_Tool fun_imageName:@"img_yb"];
           [self addSubview:coinImageView];
           [self.pro_coinsArray addObject:coinImageView];
       }
}
- (void)fun_hideAvatar{
    [self.pro_avatarImageView.layer removeAnimationForKey:@"avatarMovement"];
    self.pro_avatarImageView.hidden = true;
    [self.timer invalidate];
    self.timer = nil;
    
    [self createCoins];
}


- (void)checkAvatarPosition {
    CALayer *presentationLayer = self.pro_avatarImageView.layer.presentationLayer;
     CGPoint avatarPosition = presentationLayer.position;
     
     CGFloat angle = atan2(avatarPosition.y - self.pro_circleImageView.center.y, avatarPosition.x - self.pro_circleImageView.center.x);
     if (angle < 0) {
         angle += 2 * M_PI;
     }
     CGFloat degrees = angle * (180.0 / M_PI);
     CGFloat normalizedDegrees = fmod(degrees, 360.0);
    int a = (int)normalizedDegrees;
    self.pro_arrive = false;
    for (int i =0; i <self.pro_arrives.count;i++)
    {
        
        cls_Arrive *arrive =  self.pro_arrives[i];
        NSUInteger start = arrive.pro_arriveAngle;
        NSUInteger length = 30;
        NSRange range = NSMakeRange(start, length);
        arrive.pro_daoda = false;
        NSUInteger index = a;
        BOOL isInRange = NSLocationInRange(index, range);
        if (isInRange)
        {
            arrive.pro_daoda  = true;
            self.pro_arrive = true;
            [self.pro_delegate fun_yuanyuanDelegate:self withArrive:index with:arrive];
        }
    }
  
    [self animateAvatar];
}
- (void)animateAvatar {
    
    
    CALayer *presentationLayer = self.pro_avatarImageView.layer.presentationLayer;
     CGPoint avatarPosition = presentationLayer.position;
     
     CGFloat angle = atan2(avatarPosition.y - self.pro_circleImageView.center.y, avatarPosition.x - self.pro_circleImageView.center.x);
    
    
    CGFloat circleRadius = self.pro_circleImageView.frame.size.width / 2;
    CGPoint center = self.pro_circleImageView.center;
    
    
    // 计算头像新的位置
    CGFloat newX = center.x + circleRadius * cos(angle);
    CGFloat newY = center.y + circleRadius * sin(angle);
    self.pro_avatarImageView.center = CGPointMake(newX, newY);
    

    for (NSInteger i =  self.pro_coinsArray.count - 1; i >= 0; i--) {
        UIImageView *element = self.pro_coinsArray[i];
        if (CGRectIntersectsRect(self.pro_avatarImageView.frame, element.frame)) {
            [self.pro_coinsArray removeObject:element];
            [element removeFromSuperview];
            cls_userInfo*user =  [cls_userInfo fun_getuserInfo];
            user.pro_gold ++;
            [user fun_save];
            updateNote;
            break;

        }
    }
    
    
   
   


}


@end
