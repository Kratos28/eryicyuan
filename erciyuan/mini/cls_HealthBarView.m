//
//  cls_HealthBarView.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/10.
//

#import "cls_HealthBarView.h"
#import "cls_Tool.h"

@interface cls_HealthBarView()
@property (nonatomic,assign)bool pro_iswofang;
@property(nonatomic,assign)CGFloat maxValue;
@end

@implementation cls_HealthBarView

- (void)setPro_currentValue:(CGFloat)currentValue {
    _pro_currentValue = currentValue;
    [self setNeedsDisplay]; // 刷新界面
}
- (instancetype)initWithFrame:(CGRect )rect withwofang:(BOOL)wofang
{
    self = [super initWithFrame:rect];
    if (self)
    {
        self.pro_iswofang = wofang;
        self.maxValue = 100.0; // 默认最大值为100
        self.pro_currentValue = 100.0; // 默
        
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    if (self.pro_iswofang == true )
    {
        // 获取背景图片和健康图片
        UIImage *backgroundImage = [cls_Tool fun_imageName:@"img_t3"];
        UIImage *healthImage = [cls_Tool fun_imageName:@"img_t1"];
        // 计算血条的宽度比例
        CGFloat widthRatio = self.pro_currentValue / self.maxValue;
        CGFloat healthBarWidth = rect.size.width * widthRatio;
        // 绘制背景图片
        [backgroundImage drawInRect:rect];
        // 绘制健康图片
        CGRect healthRect = CGRectMake(0, 0, healthBarWidth, rect.size.height);
        [healthImage drawInRect:healthRect];
        if (healthBarWidth <= 2){
            [self.delegate fun_HealthBarViewwiwangDelegate:self];
        }
    }else
    {
        // 获取背景图片和健康图片
        UIImage *backgroundImage = [cls_Tool fun_imageName:@"img_t3"];
        UIImage *healthImage = [cls_Tool fun_imageName:@"img_t2"];
        // 计算血条的宽度比例
        CGFloat widthRatio = self.pro_currentValue / self.maxValue;
        CGFloat healthBarWidth = rect.size.width * widthRatio;
        // 绘制背景图片
        [backgroundImage drawInRect:rect];
        // 绘制健康图片
        CGRect healthRect = CGRectMake(0, 0, healthBarWidth, rect.size.height);
        [healthImage drawInRect:healthRect];
        if (healthBarWidth <= 2){
            [self.delegate fun_HealthBarViewwiwangDelegate:self];
        }
    }
  

}


@end
