//
//  Timer.m
//  01game
//
//  Created by 9130Game on 2023/8/21.
//

#import "cls_Timer.h"

@implementation cls_Timer


- (instancetype)initTarget:(id)tager selector:(SEL)sel   repeats:(BOOL)repeat interval:(int)Interval
{
    if (self = [super init]){
        self.pro_timer = [NSTimer scheduledTimerWithTimeInterval:Interval target:tager selector:sel userInfo:nil repeats:repeat];
        self.pro_tager = tager;
    }
    return  self;
    
}


- (void)fun_pauseTimer
{
    self.pro_timer.fireDate = [NSDate distantFuture]; // 将 fireDate 设置为一个未来日期
}
- (void)fun_resumeTimer
{
    self.pro_timer.fireDate = [NSDate date]; // 将 fireDate 设置为当前日期和时间
}


- (void)fun_startTimer
{
    self.pro_timer.fireDate = [NSDate date]; // 将 fireDate 设置为当前日期和时间
//    [[NSRunLoop currentRunLoop] addTimer:self.pro_timer forMode:NSRunLoopCommonModes];
}

- (void)dealloc
{
    NSLog(@"nstimer释放");
}

- (void)fun_stopTimer
{
    [self.pro_timer invalidate];
    self.pro_timer = nil;
}



@end
