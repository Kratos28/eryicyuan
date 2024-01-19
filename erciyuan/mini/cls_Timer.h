//
//  Timer.h
//  01game
//
//  Created by 9130Game on 2023/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_Timer : NSObject
- (instancetype)initTarget:(id)tager selector:(SEL)sel   repeats:(BOOL)repeat interval:(int)Interval;
@property (nonatomic, weak) NSTimer *pro_timer;
@property (nonatomic, weak) id pro_tager;
- (void)fun_startTimer;
- (void)fun_pauseTimer;
- (void)fun_resumeTimer;
- (void)fun_stopTimer;
@end

NS_ASSUME_NONNULL_END
