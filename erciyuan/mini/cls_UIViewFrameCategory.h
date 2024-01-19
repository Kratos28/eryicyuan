//
//  UIView+FrameCategory.h
//  game40
//
//  Created by K on 2021/10/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^FrameBlock)(__kindof UIView *b);

@interface UIView (FrameCategory)
+ (void)loadCate;
@property (nonatomic, strong) FrameBlock frameBlock;
@property (nonatomic, assign) int  centerX;
@property (nonatomic, assign) int  centerY;

@property (nonatomic, assign) int  height;
@property (nonatomic, assign) int  width;
@end

NS_ASSUME_NONNULL_END
