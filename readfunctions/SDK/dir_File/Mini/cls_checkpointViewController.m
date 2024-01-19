//
//  cls_checkpointViewController.m
//  Game
//
//  Created by 9130Game on 2023/11/24.
//

#import "cls_checkpointViewController.h"

@interface cls_checkpointViewController ()
@property (nonatomic,strong)UIScrollView *pro_jscrollView;

@end

@implementation cls_checkpointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pro_jinbobtn.hidden = YES;
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.tag = 5555;
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_checkpoint_bg"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    

}

- (void)fun_ScrollView
{
    
//
    [self.pro_jscrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
 
   UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(RPX(130), RPY(100),RPX(1100), RPY(550))];
   [self.view addSubview:scrollView];
    self.pro_jscrollView = scrollView;
    
    
    int corlmax = 10;
    int itemW =  [UIScreen mainScreen].bounds.size.width * 0.15;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        itemW =  [UIScreen mainScreen].bounds.size.width * 0.1;
    }
    int itemH = itemW;
    int mariginX =  RPX(70);
    int startY =  RPY(0);
    int mariginH = [UIScreen mainScreen].bounds.size.height * 0.02;;
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(0);
    
    cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    for (int i = 0; i <10; i++)
    {
        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        // 创建按钮并设置属性
        UIButton *b = [[UIButton alloc]init];
        [scrollView addSubview:b];
        
      
        [b setBackgroundImage:[cls_Tool fun_imageName:@"img_checkpoint_wjs"] forState:0];
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        [b addTarget:self  action:@selector(fun_ff:) forControlEvents:64];
        
       CGSize size = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:[cls_Tool fun_imageName:@"img_checkpoint_wjs"]].size;
        itemW = size.width;
        itemH = size.height;
        
        
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:scrollView.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:scrollView.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        
        if (user.pro_guanshu >= i+1)
        {
            [b setBackgroundImage:[cls_Tool fun_imageName:@"img_checkpoint_yjs"] forState:0];
        }
        
        
        
        UILabel *label = [[UILabel alloc]init];
        label.text = [NSString stringWithFormat:@"0%d",i+1];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.font = [cls_Tool fun_cusstomFontSize:38];
        label.textColor = [cls_Tool fun_colorWithHexString:@"#fed774"];
        [b addSubview:label];

     
        
        
        [label.widthAnchor constraintEqualToConstant:40].active = YES;
        [label.heightAnchor constraintEqualToConstant:40].active = YES;
        NSLayoutConstraint *c =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        NSLayoutConstraint *c1 =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
        [b  addConstraint:c];
        [b  addConstraint:c1];
        
        if (i == 9)
        {
            [scrollView setContentSize:CGSizeMake(RPX(2000), scrollView.frame.size.height)];
        }
        
    }
    
    
    
    
    
    
    cls_userInfo *user1 =  [cls_userInfo fun_getuserInfo];
    UILabel *var_label= [[UILabel alloc]init];
    var_label.text = [NSString stringWithFormat:@"%d",user1.pro_guanshu];
    var_label.frame = CGRectMake(RPX(450), RPY(660), RPX(300), RPY(50));
    var_label.font = [cls_Tool fun_cusstomFontSize:26];
    var_label.textColor = [cls_Tool fun_colorWithHexString:@"#ffffff"];
    [self.view addSubview:var_label];


    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_checkpoint_btn_ks"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:1000 RPY:660 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            
            UIViewController *mainvc =   [[NSClassFromString(@"cls_battleViewController") alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
            
        } Event:64];
        [self.view addSubview:var_button];
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self fun_ScrollView];

}

- (void)fun_ff:(UIButton *)sender
{
//    sender.selected = YES;
}

@end
