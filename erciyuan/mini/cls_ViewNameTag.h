//
//  UIView+cls_ViewNameTag.h
//  Game
//
//  Created by 9130Game on 2023/11/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (cls_ViewNameTag)
@property (nonatomic, copy) NSString *pro_viewtagname;

- (UIView *)fun_viewtagName:(NSString *)tagname;
@end

NS_ASSUME_NONNULL_END
