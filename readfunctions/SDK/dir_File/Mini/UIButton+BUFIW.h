//
//  UIButton+BUFIW.h
//  testProj
//
//  Created by 9130Game on 2024/1/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^pro_ButtonEventsBlock)(id target,UIButton *b);
@interface UIButton (Fit)
@property (nonatomic, copy) pro_ButtonEventsBlock pro_buttonframeBlock;
- (void)fun_handleinTarget:(id)target block:(pro_ButtonEventsBlock)block Event:(UIControlEvents)events;
@end

NS_ASSUME_NONNULL_END
