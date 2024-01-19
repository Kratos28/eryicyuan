//
//  UIView+cls_ViewNameTag.m
//  Game
//
//  Created by 9130Game on 2023/11/29.
//

#import "cls_ViewNameTag.h"
#import <objc/runtime.h>

@implementation UIView (cls_ViewNameTag)
- (NSString *)pro_viewtagname{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setPro_viewtagname:(NSString *)pro_viewtagname
{
    objc_setAssociatedObject(self,  @selector(pro_viewtagname), pro_viewtagname, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIView *)fun_viewtagName:(NSString *)tagname
{
   __block UIView *tempview = nil;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.pro_viewtagname isEqualToString:tagname]){
            tempview = obj;
            *stop = YES;
        }
    }];
    return tempview;
}
@end
