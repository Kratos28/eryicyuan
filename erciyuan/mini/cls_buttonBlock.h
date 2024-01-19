//
//  UIButton+TTBUTTON.h
//  chongshou
//
//  Created by 9130Game on 2023/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TTBUTTON)
@property(nonatomic ,copy)void(^block)(UIButton*);
-(void)addTapBlock:(void(^)(UIButton*btn))block;
@end

NS_ASSUME_NONNULL_END
