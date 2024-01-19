//
//  cls_immortalLeagueViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/10.
//

#import "cls_immortalLeagueViewController.h"

@interface cls_immortalLeagueViewController ()
@property (nonatomic, strong) UIButton *pro_importalselectedButton;

@end

@implementation cls_immortalLeagueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_bg_7"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
    
    
    int corlmax = 1;
    int itemW = RPX(800);
    int itemH = RPY(60);
    int mariginX = RPX(10);
    int startY = RPY(220);
    int mariginH = RPY(0);
   

  
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(130);
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        itemH = RPY(60);
    }
    for (int i = 0; i < 7; i++)
    {
        
    
        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        // 创建按钮并设置属性
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        // 设置autolayout约束
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        [b addTarget:self action:@selector(fun_methodSelecte:) forControlEvents:64];
        if (i == 0)
        {
            [self fun_methodSelecte:b];
        }

    }
    
    UILabel *var_label= [[UILabel alloc]init];
    var_label.text =  @"The best in the world";
    var_label.frame = CGRectMake(RPX(970), RPY(370), RPX(300), RPY(150));
    var_label.tag = 1005;
    var_label.textAlignment = NSTextAlignmentCenter;
    var_label.numberOfLines = 0;
    var_label.font = [UIFont systemFontOfSize:15];
    var_label.textColor = [UIColor colorWithRed:143/255.0 green:143/255.0 blue:143/255.0 alpha:1];
    [self.view addSubview:var_label];
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_sq"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:1000 RPY:560 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            
            switch (self.pro_importalselectedButton.tag) {
                case 0:
                {
                    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"Can't join. It's full for now" message:@"Can't join. It's full for now" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                        
                    }];
                    [vc addAction:action];
                    [self presentViewController:vc animated:true completion:nil];
                    
                    break;
                }
                default:
                {
                    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"success" message:@"success" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                        
                    }];
                    [vc addAction:action];
                    [self presentViewController:vc animated:true completion:nil];
                    
                    break;
                }
            }
            
            
            
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    // Do any additional setup after loading the view.
}
- (void)fun_methodSelecte:(UIButton *)sender
{
   UILabel *label =  [self.view viewWithTag:1005];
    switch (sender.tag) {
        case 0:
        {
            label.text = @"The best in the world";
            break;
        }
        case 1:
        {
            label.text = @"susha";
            break;
        }
        case 2:
        {
            label.text = @"Wingsof Sky";
            break;
        }
            
        case 3:
        {
            label.text = @"Bloodthrsty world";
            break;
        }
            
        case 4:
        {
            label.text = @"ultimate seal";
            break;
        }
            
        case 5:
        {
            label.text = @"Xiapyaopai";
            break;
        }
        case 6:
        {
            label.text = @"Huanguoshan";

            break;
        }
        default:
            break;
    }
    
  
    if (sender == self.pro_importalselectedButton)
    {
        // 点击已选中的按钮，取消选中
        sender.selected = NO;
        sender.layer.borderWidth = 0.0;
        self.pro_importalselectedButton = nil;
    } else {
        // 取消上一个选中的按钮的选中状态
        self.pro_importalselectedButton.selected = NO;
        self.pro_importalselectedButton.layer.borderWidth = 0.0;
        // 设置当前选中的按钮
        sender.selected = YES;
        sender.layer.borderWidth = 2.0;
        sender.layer.borderColor = [UIColor colorWithRed:160/255.0 green:0/255.0 blue:88/255.0 alpha:1].CGColor;
        self.pro_importalselectedButton = sender;
    }

  
}


@end
