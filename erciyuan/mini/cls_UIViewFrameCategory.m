//
//  UIView+FrameCategory.m
//  game40
//
//  Created by K on 2021/10/11.
//

#import "cls_UIViewFrameCategory.h"
#import <objc/runtime.h>
#import "cls_Tool.h"


@implementation UIView (FrameCategory)


+ (void)loadCate
{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
    
            Method originEat = class_getInstanceMethod([UIView class], NSSelectorFromString(@"layoutSubviews"));
            Method swizzlingEat = class_getInstanceMethod([self class], @selector(mylayoutSubviews));
            class_addMethod([UIView class], @selector(mylayoutSubviews), method_getImplementation(originEat), method_getTypeEncoding(originEat));
            method_exchangeImplementations(originEat, swizzlingEat);
    
        });
}
//

- (void)setFrameBlock:(FrameBlock)cq_buttonframeBlock
{
        
    objc_setAssociatedObject(self, @selector(frameBlock), cq_buttonframeBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(void)setWidth:(int)width
{
    objc_setAssociatedObject(self, @selector(width), @(width), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (int)width
{
    id v = objc_getAssociatedObject(self,   @selector(width));
 
    if ([self isKindOfClass:[UIImageView class]]){
        
        UIImageView *imageview  =  (UIImageView*)self;
        return  [cls_Tool fun_RpxX:imageview.image.size.width] /2;
         
    } else  if ([self isKindOfClass:[UIButton class]])
    {
        UIButton *imageview  =  (UIButton*)self;
        
        if (imageview.currentBackgroundImage!=nil)
        {
            return  [cls_Tool fun_RpxX:imageview.currentBackgroundImage.size.width] /2;
        }else
        {
            return  [cls_Tool fun_RpxX:imageview.currentImage.size.width] /2;
        }
    }else if ([v intValue]>0)
    {
        return [v intValue];
    }
    
    
    return  self.frame.size.width;
}
- (void)setHeight:(int)height
{
    objc_setAssociatedObject(self, @selector(height), @(height), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}
- (int)height
{
    id v = objc_getAssociatedObject(self,   @selector(width));
 
    if ([self isKindOfClass:[UIImageView class]]){
        
        UIImageView *imageview  =  (UIImageView*)self;
        return  [cls_Tool fun_RpxX:imageview.image.size.height] /2;
         
    } else  if ([self isKindOfClass:[UIButton class]])
    {
        UIButton *imageview  =  (UIButton*)self;
        
        if (imageview.currentBackgroundImage!=nil)
        {
            return  [cls_Tool fun_RpxX:imageview.currentBackgroundImage.size.height] /2;
        }else
        {
            return  [cls_Tool fun_RpxX:imageview.currentImage.size.height] /2;
        }
    }else if ([v intValue]>0)
    {
        return [v intValue];
    }
    return  self.frame.size.height;
}

- (void)setCenterY:(int)centerY
{
    objc_setAssociatedObject(self, @selector(centerY), @(centerY), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}
- (int)centerY
{
    id v = objc_getAssociatedObject(self,   @selector(centerY));
    
    if (self.superview != nil){
      int a =   (self.superview.frame.size.height / 2) - ( self.frame.size.height / 2);
        return  a;
    }
    return [v intValue];
}

- (void)setCenterX:(int)centerX
{
    objc_setAssociatedObject(self, @selector(centerX), @(centerX), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (int)centerX{
    id v = objc_getAssociatedObject(self,   @selector(centerX));
    
    if (self.superview != nil){
      int a =   (self.superview.frame.size.width / 2) - ( self.frame.size.width / 2);
        return  a;
    }
    return [v intValue];
}
- (FrameBlock)frameBlock
{
    id v = objc_getAssociatedObject(self,   @selector(frameBlock));
    return v;
}

- (void)getSub:(UIView *)view  {
    NSArray *subviews = [view subviews];
    if ([subviews count] == 0) return;
    for (UIView *subview in subviews) {
        if (subview.frameBlock!=nil) {
            subview.frameBlock(subview);
            
        }
        [self getSub:subview];
    }
}

- (void)mylayoutSubviews
{

    
    [self mylayoutSubviews];

 
    [self getSub:self];
  


}



@end
