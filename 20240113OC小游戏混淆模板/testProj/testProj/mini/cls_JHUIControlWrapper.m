//
//  cls_JHUIControlWrapper.m
//  testProj
//
//  Created by 9130Game on 2024/1/18.
//

#import "cls_JHUIControlWrapper.h"

@implementation cls_JHUIControlWrapper
- (id)initWithTarget:(id)target sender:(id)sender block:(pro_ButtonEventsBlock)block{
    if (self = [super init]) {
        self.pro_buttontarget = target;
        self.pro_buttonsender = sender;
        self.pro_blblock = block;
    }
    return self;
}

- (void)action:(id)sender{
    self.pro_blblock(_pro_buttontarget, _pro_buttonsender);
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:_pro_buttonsender];
        
    _pro_buttontarget = nil;
    _pro_buttonsender = nil;
    _pro_blblock = nil;
    

}
@end
