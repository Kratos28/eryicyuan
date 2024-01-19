//
//  UIButton+BUFIW.m
//  testProj
//
//  Created by 9130Game on 2024/1/18.
//

#import "UIButton+BUFIW.h"
#import <objc/runtime.h>
#import "cls_JHUIControlWrapper.h"
static const char *JHControlDicKey;

@implementation UIButton (Fit)

- (void)fun_removeEvent:(UIControlEvents)events{
    NSMutableDictionary *dic = objc_getAssociatedObject(self, JHControlDicKey);
    if (!dic) {
        dic = @{}.mutableCopy;
        objc_setAssociatedObject(self, JHControlDicKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSNumber *key = @(events);
    NSMutableSet *set = dic[key];
    if (!set) {
        return;
    }
    
    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        [self removeTarget:obj action:NULL forControlEvents:events];
    }];
    
    [dic removeObjectForKey:key];
}
- (pro_ButtonEventsBlock)pro_buttonEventsBlock {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setPro_buttonEventsBlock:(pro_ButtonEventsBlock)cq_buttonEventsBlock {
    
    objc_setAssociatedObject(self,  @selector(pro_buttonEventsBlock), cq_buttonEventsBlock, OBJC_ASSOCIATION_COPY);
}

- (void)fun_handleinTarget:(id)target block:(pro_ButtonEventsBlock)block Event:(UIControlEvents)events
{
 
    if (block) {
        NSMutableDictionary *dic = objc_getAssociatedObject(self, JHControlDicKey);
        if (!dic) {
            dic = @{}.mutableCopy;
            objc_setAssociatedObject(self, JHControlDicKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        NSNumber *key = @(events);
        NSMutableSet *set = dic[key];
        if (!set) {
            set = [NSMutableSet set];
            dic[key] = set;
        }
        
        cls_JHUIControlWrapper *wrapper = [[cls_JHUIControlWrapper alloc] initWithTarget:target sender:self block:block];
        [set addObject:wrapper];
        [self addTarget:wrapper action:@selector(action:) forControlEvents:events];
    }
}

@end
