//
//  UIView+cls_FW.h
//  testProj
//
//  Created by 9130Game on 2024/1/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (cls_FW)
@property (nonatomic, copy) NSString *pro_viewtagname;

- (UIView *)fun_viewtagName:(NSString *)tagname;
@end

NS_ASSUME_NONNULL_END
