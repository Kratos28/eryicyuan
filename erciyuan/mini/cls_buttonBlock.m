//
//  UIButton+TTBUTTON.m
//  chongshou
//
//  Created by 9130Game on 2023/12/14.
//

#import "cls_buttonBlock.h"
#import <objc/runtime.h>
@implementation UIButton (TTBUTTON)


-(void)setBlock:(void(^)(UIButton*))block
{

   objc_setAssociatedObject(self,@selector(block), block,OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void(^)(UIButton*))block
{
   return objc_getAssociatedObject(self,@selector(block));
}

-(void)addTapBlock:(void(^)(UIButton*))block

{

   self.block= block;
    [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)click:(UIButton*)btn

{

   if(self.block) {
       self.block(btn);
   }

}
@end
