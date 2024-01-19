//
//  cls_guankaViewController.m
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/8.
//

#import "cls_guankaViewController.h"
#import "cls_GameSenceViewController.h"
@interface cls_guankaViewController ()
@property (nonatomic,strong)UIScrollView *pro_scrollview;
@property (nonatomic, strong) NSMutableArray *pro_addedViews;
@end

@implementation cls_guankaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pro_jinbobtn.hidden = YES;
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"img_leve_bg_map"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
        });
        [self.view addSubview:var_imageview];
    }
    
    
    
    
    UILabel *var_label= [[UILabel alloc]init];
    var_label.text = @"Act 1";
    var_label.font = [cls_Tool fun_cusstomFontSize:17];
    var_label.textColor = [cls_Tool fun_colorWithHexString:@"#e1e3ef"];
    viewFrameBlock(var_label,^(UIView *b){
        b.frame = CGRectMake(RPX(50), RPY(20), RPX(50), RPX(30));
    });
    [self.view addSubview:var_label];
    
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_leve_icon_next"] forState:UIControlStateNormal];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(610), RPY(170),b.width, b.height);
        });
        
        buttonBlock(var_button, ^(UIButton  *btn){
            [self.pro_scrollview setContentOffset:CGPointMake(self.pro_scrollview.width, 0) animated:YES];
        });

    
        
        
        [self.view addSubview:var_button];
    }
    
    
    // 创建可变数组来存储已添加的视图
    self.pro_addedViews = [NSMutableArray array];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.pagingEnabled = YES;
    scrollView.frame = CGRectMake(RPX(30), RPY(50), RPX(580), RPY(300));
    [self.view addSubview:scrollView];


    // 创建10个视图添加到UIScrollView中
      for (int i = 0; i < 20; i++) {
          UIButton *view = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, RPX(50), RPX(50))];
          view.titleLabel.font = [UIFont boldSystemFontOfSize:35];

                CGFloat randomX = 0;
                CGFloat randomY = 0;
                BOOL isOverlapping = YES;
                while (isOverlapping) {
                    isOverlapping = NO;

                    if (i == 0) {
                        randomX = arc4random_uniform(5);
                    } else {
                        CGFloat previousViewRightX = CGRectGetMaxX([self.pro_addedViews[i-1] frame]);
                        randomX = previousViewRightX + arc4random_uniform(5) + 12;
                        if (randomX >=scrollView.frame.size.width *2)
                        {
                            randomX = previousViewRightX + arc4random_uniform(5) + 12;
                        }
                    }

                    randomY = arc4random_uniform(CGRectGetHeight(scrollView.bounds) - RPX(50));
                    for (UIView *subview in self.pro_addedViews) {
                        CGRect subviewFrame = subview.frame;
                        if (CGRectIntersectsRect(subviewFrame, CGRectMake(randomX, randomY, RPX(50), RPX(50)))) {
                            isOverlapping = YES;
                            break;
                        }
                    }
                }

                CGRect frame = view.frame;
                frame.origin.x = randomX;
                frame.origin.y = randomY;
                view.frame = frame;

                [scrollView addSubview:view];
                [self.pro_addedViews addObject:view];
      }
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width* 2, scrollView.frame.size.height);
    self.pro_scrollview = scrollView;
    
    
    

}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    cls_userInfo *us =  [cls_userInfo fun_getuserInfo];
    for (int i =0 ; i<self.pro_addedViews.count; i++)
    {
        
        UIButton *view = self.pro_addedViews[i];
        
        UIImageView  * ivimage = [view fun_viewtagName:@"iv"];
        [ivimage removeFromSuperview];
        if (us.pro_guanshu <= i){
            [view setBackgroundImage:[cls_Tool fun_imageName:@"img_leve_icon_Level3"] forState:0];
            [view setTitle:nil forState:0];
            [view removeTarget:self action:@selector(fun_kaisi:) forControlEvents:64];
        }else if ((us.pro_guanshu -1) == i )
        {
            [view setBackgroundImage:[cls_Tool fun_imageName:@"img_leve_icon_Level2"] forState:0];
            [view setTitle:[NSString stringWithFormat:@"%d",i+1] forState:0];
        
            
            [view addTarget:self action:@selector(fun_kaisi:) forControlEvents:64];
            UIImageView  * ivimage = [view fun_viewtagName:@"iv"];
            [ivimage removeFromSuperview];
            
            UIImageView *iv = [[UIImageView alloc]initWithImage:[cls_Tool fun_imageName:@"img_leve_icon_selet"]];
            iv.pro_viewtagname =  @"iv";
            viewFrameBlock(iv,^(UIView *b){
                b.frame = CGRectMake(b.centerX + RPX(5),  -RPY(30), RPX(30),RPX(30));
                
            });
            [view addSubview:iv];

        }else
        {
            [view setBackgroundImage:[cls_Tool fun_imageName:@"img_leve_icon_Level"] forState:0];
            [view setTitle:[NSString stringWithFormat:@"%d",i+1] forState:0];
            [view removeTarget:self action:@selector(fun_kaisi:) forControlEvents:64];

        }
        
    }
}
- (void)fun_kaisi:(UIButton *)sender
{
    UIViewController *mainvc =   [[cls_GameSenceViewController alloc]init];
    mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
    mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:mainvc animated:NO completion:nil];
}
@end
