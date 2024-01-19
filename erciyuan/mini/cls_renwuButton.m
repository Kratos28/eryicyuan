//
//  cls_renwuButton.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/13.
//

#import "cls_renwuButton.h"
#import "cls_Tool.h"

@interface cls_renwuButton()
@property (nonatomic,strong)NSMutableArray * pro_views;
@end

@implementation cls_renwuButton
- (instancetype)initWithFrame:(CGRect)frame withwofang:(BOOL)wofang
{
    self = [super initWithFrame:frame];
    if (self){
        self.wofang = wofang;
        self.pro_views = [NSMutableArray array];
        if (self.wofang)
        {
            UIImageView *animatedImageView = [[UIImageView alloc] init];
            animatedImageView.image = [cls_Tool fun_imageName:@"img_cw"];
            animatedImageView.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_cw"]];
            [self addSubview:animatedImageView];
            [self.pro_views addObject:animatedImageView];
            
            UIImageView *animatedImageView1 = [[UIImageView alloc] init];
            animatedImageView1.image = [cls_Tool fun_imageName:@"img_rw"];
            animatedImageView1.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:150 RPY:0 withImage:[cls_Tool fun_imageName:@"img_rw"]];
            [self addSubview:animatedImageView1];
            [self.pro_views addObject:animatedImageView1];
        }else
        {
            UIImageView *animatedImageView = [[UIImageView alloc] init];
            animatedImageView.image = [cls_Tool fun_imageName:@"img_d1"];
            animatedImageView.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_cw"]];
            [self addSubview:animatedImageView];
            [self.pro_views addObject:animatedImageView];

            
            UIImageView *animatedImageView1 = [[UIImageView alloc] init];
            animatedImageView1.image = [cls_Tool fun_imageName:@"img_d2"];
            animatedImageView1.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:150 RPY:0 withImage:[cls_Tool fun_imageName:@"img_rw"]];
            [self addSubview:animatedImageView1];
            [self.pro_views addObject:animatedImageView1];

        }
        
    }
    return self;
}

- (void)fun_texiaocompletion:(void(^)(void))completion
{
    
    NSMutableArray *array = [NSMutableArray array];
    UIView *v =  self.pro_views[arc4random_uniform(2)];
    UIImageView *animatedImageView = [[UIImageView alloc] initWithFrame:v.bounds];

    if (self.wofang == NO)
    {
        int a = arc4random_uniform(4);
        switch (a) {
            case 0:
            {
                UIImage *image = [cls_Tool fun_imageName:@"img_ly_c1"];
                UIImage *image1 = [cls_Tool fun_imageName:@"img_ly_c2"];
                UIImage *image2 = [cls_Tool fun_imageName:@"img_ly_c3"];
                UIImage *image3 = [cls_Tool fun_imageName:@"img_ly_c4"];
                UIImage *image4 = [cls_Tool fun_imageName:@"img_ly_c5"];
                
                
                
                [array addObject:image];
                [array addObject:image1];
                [array addObject:image2];
                [array addObject:image3];
                [array addObject:image4];
                animatedImageView.frame = CGRectMake(RPX(0), RPY(0), v.bounds.size.width, v.bounds.size.height);
                break;
            }
                
            case 1:
            {
                UIImage *image = [cls_Tool fun_imageName:@"img_zf_c1"];
                UIImage *image1 = [cls_Tool fun_imageName:@"img_zf_c2"];
                UIImage *image2 = [cls_Tool fun_imageName:@"img_zf_c3"];
                
                
        
                
                
                
                [array addObject:image];
                [array addObject:image1];
                [array addObject:image2];
            
                animatedImageView.frame = CGRectMake(RPX(0), RPY(300), v.bounds.size.width, RPY(100));
                break;
            }
                
            case 2:
            {
                
                UIImage *image = [cls_Tool fun_imageName:@"img_ld_c1"];
                UIImage *image1 = [cls_Tool fun_imageName:@"img_ld_c2"];
                UIImage *image2 = [cls_Tool fun_imageName:@"img_ld_c3"];
               
    

                
                [array addObject:image];
                [array addObject:image1];
                [array addObject:image2];
         
                animatedImageView.frame = CGRectMake(RPX(0), RPY(300), v.bounds.size.width, RPY(200));
                break;
            }
                
            case 3:
            {
                
                UIImage *image = [cls_Tool fun_imageName:@"img_Aegis_ld1"];
                UIImage *image1 = [cls_Tool fun_imageName:@"img_Aegis_ld2"];
                UIImage *image2 = [cls_Tool fun_imageName:@"img_Aegis_ld3"];


                
                [array addObject:image];
                [array addObject:image1];
                [array addObject:image2];
         
                animatedImageView.frame = CGRectMake(RPX(0), RPY(300), v.bounds.size.width, RPY(200));

                break;
            }
            default:
                break;
        }
        
//        UIImageView *animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(v.center.x- (RPX(200) /2 ), v.center.y - (RPY(100) /2 ), RPX(200), RPY(100))];
        animatedImageView.animationImages = array;
        animatedImageView.animationDuration = 1.0;
        animatedImageView.animationRepeatCount = 1;
    
        
        
        [v addSubview:animatedImageView];
        [animatedImageView startAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          
            
            
             UIViewAnimationOptions options = UIViewAnimationOptionCurveLinear;
               [UIView animateWithDuration:0.2 delay:0 options:options animations:^{
                   v.frame = CGRectMake(v.frame.origin.x+2, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
               } completion:^(BOOL finished) {
                   
                   
                   [UIView animateWithDuration:0.2 delay:0 options:options animations:^{
                       v.frame = CGRectMake(v.frame.origin.x -2, v.frame.origin.y , v.frame.size.width, v.frame.size.height);
                   } completion:^(BOOL finished) {
                     
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                           if (completion)
                            {
                                completion();
                            }
                            [animatedImageView removeFromSuperview];
                        });
                       
                       
                   }];
                   
               
               }];
            
            
         });

        
    }else
    {
        UIImageView *animatedImageView = [[UIImageView alloc] initWithFrame:v.bounds];

        int a =  arc4random() % 2;
        switch (a) {
            case 0:
            {
                
                UIImage *image = [cls_Tool fun_imageName:@"img_dt1_c1"];
                UIImage *image1 = [cls_Tool fun_imageName:@"img_dt1_c2"];
                UIImage *image2 = [cls_Tool fun_imageName:@"img_dt1_c3"];
                UIImage *image3 = [cls_Tool fun_imageName:@"img_dt1_c4"];
                UIImage *image4 = [cls_Tool fun_imageName:@"img_dt1_c5"];
                UIImage *image5 = [cls_Tool fun_imageName:@"img_dt1_c6"];
                
                

                
                [array addObject:image];
                [array addObject:image1];
                [array addObject:image2];
                [array addObject:image3];
                [array addObject:image4];
                [array addObject:image5];
                animatedImageView.frame = CGRectMake(0, RPY(100), RPX(300), RPX(300));

                break;
            }
                
            case 1:
            {
                UIImage *image = [cls_Tool fun_imageName:@"img_dt2_c1"];
                UIImage *image1 = [cls_Tool fun_imageName:@"img_dt2_c2"];
                UIImage *image2 = [cls_Tool fun_imageName:@"img_dt2_c3"];
                UIImage *image3 = [cls_Tool fun_imageName:@"img_dt2_c4"];
                UIImage *image4 = [cls_Tool fun_imageName:@"img_dt2_c5"];
                UIImage *image5 = [cls_Tool fun_imageName:@"img_dt2_c6"];
                
                
                [array addObject:image];
                [array addObject:image1];
                [array addObject:image2];
                [array addObject:image3];
                [array addObject:image4];
                animatedImageView.frame = CGRectMake(0, RPY(100), RPX(300), RPX(300));

                break;
            }
                
       
          
            default:
                break;
        }
        
        
        
        
        if (v == self.pro_views[0]){
            animatedImageView.frame = CGRectMake(0, RPY(150), RPX(300), RPX(300));
        }
        animatedImageView.animationImages = array; // 这里的 image1, image2, image3 等是你的序列帧图像
        animatedImageView.animationDuration = 1.0; // 动画持续时间
        animatedImageView.animationRepeatCount = 1; // 0 表示无限循环
        [v addSubview:animatedImageView];
        [animatedImageView startAnimating];
        
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          
            
            
             UIViewAnimationOptions options = UIViewAnimationOptionCurveLinear;
               [UIView animateWithDuration:0.2 delay:0 options:options animations:^{
                   v.frame = CGRectMake(v.frame.origin.x-2, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
               } completion:^(BOOL finished) {
                   
                   
                   [UIView animateWithDuration:0.2 delay:0 options:options animations:^{
                       v.frame = CGRectMake(v.frame.origin.x + 2, v.frame.origin.y , v.frame.size.width, v.frame.size.height);
                   } completion:^(BOOL finished) {
                     
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                           if (completion)
                            {
                                completion();
                            }
                            [animatedImageView removeFromSuperview];
                        });
                       
                       
                   }];
                   
               
               }];
            
            
         });
        
        
   
    
        
    }
}



@end
