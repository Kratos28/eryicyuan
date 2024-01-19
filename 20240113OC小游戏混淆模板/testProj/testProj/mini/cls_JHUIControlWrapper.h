//
//  cls_JHUIControlWrapper.h
//  testProj
//
//  Created by 9130Game on 2024/1/18.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^pro_ButtonEventsBlock)(id target,UIButton *b);

@interface cls_JHUIControlWrapper : NSObject
@property (nonatomic,    weak) id pro_buttontarget;
@property (nonatomic,    weak) id pro_buttonsender;
@property (nonatomic,    copy) pro_ButtonEventsBlock pro_blblock;


- (id)initWithTarget:(id)target sender:(id)sender block:(pro_ButtonEventsBlock)block;
@end

NS_ASSUME_NONNULL_END
