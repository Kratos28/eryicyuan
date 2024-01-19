//
//  cls_JHUIControlWrapper.h
//  testProj
//
//  Created by 9130Game on 2024/1/17.
//

#import <Foundation/Foundation.h>
#import "cls_buttonBlock.h"
NS_ASSUME_NONNULL_BEGIN

@interface cls_JHUIControlWrapper : NSObject
@property (nonatomic,    weak) id pro_buttontarget;
@property (nonatomic,    weak) id pro_buttonsender;
@property (nonatomic,    copy) CQ_ButtonEventsBlock pro_blblock;



- (id)initWithTarget:(id)target sender:(id)sender block:(CQ_ButtonEventsBlock)block;
@end

NS_ASSUME_NONNULL_END
