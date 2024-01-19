//
//  cls_HealthBarView.h
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class cls_HealthBarView;

@protocol HealthBarViewDele <NSObject>
- (void)fun_HealthBarViewwiwangDelegate:(cls_HealthBarView *)barView;
@end

@interface cls_HealthBarView : UIView
@property (nonatomic,assign)id <HealthBarViewDele>delegate;
- (instancetype)initWithFrame:(CGRect )rect withwofang:(BOOL)wofang;
@property (nonatomic, assign) CGFloat pro_currentValue; // 健康百分比
@end

NS_ASSUME_NONNULL_END
