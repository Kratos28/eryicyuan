//
//  cls_yuanyuan.h
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface cls_Arrive : NSObject
@property (nonatomic, assign) bool  pro_nextarrive;
@property (nonatomic, assign) int  pro_arriveAngle;
@property (nonatomic, assign) bool  pro_daoda;

@end


@protocol cls_yuanyuanDelegate;
@interface cls_yuanyuan : UIView
@property (nonatomic, assign) CGFloat pro_duration;
@property (nonatomic, assign) CGFloat pro_startAngle;
@property (nonatomic, assign) NSInteger pro_jinbishuliang;
@property (nonatomic, copy) NSArray<cls_Arrive *>  *pro_arrives;
@property (nonatomic, assign) bool  pro_arrive;
@property (nonatomic, assign) id  <cls_yuanyuanDelegate> pro_delegate;
- (instancetype)initWithFrame:(CGRect)frame withcircleImageView:(NSString *)imageName withAvatarImageName:(NSString *)AvatarImageName withpro_jinbishuliang:(NSInteger)pro_jinbishuliang;
- (void)fun_yuanyuanstartAvatarMovement;
- (void)fun_hideAvatar;
@end


@protocol cls_yuanyuanDelegate <NSObject>
- (void)fun_yuanyuanDelegate:(cls_yuanyuan *)yuan withArrive:(NSInteger)point with:(cls_Arrive *)arrvie;
- (void)fun_currentyuanyuan:(cls_yuanyuan *)yuan;

@end
NS_ASSUME_NONNULL_END
