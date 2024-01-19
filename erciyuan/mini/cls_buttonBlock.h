//
//  UIButton+cls_buttonBlock.h
//  testProj
//
//  Created by 9130Game on 2024/1/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^CQ_ButtonEventsBlock)(id target,UIButton *b);
@interface UIButton (Fit)
@property (nonatomic, copy) CQ_ButtonEventsBlock pro_buttonframeBlock;
- (void)fun_handleinTarget:(id)target block:(CQ_ButtonEventsBlock)block Event:(UIControlEvents)events;
@end

NS_ASSUME_NONNULL_END
