//
//  cls_StashViewController.m
//  chongshouduijue
//
//  Created by 9130Game on 2023/12/25.
//

#import "cls_StashViewController.h"
#import "cls_warehouseModel.h"
@interface cls_StashViewController ()
@property (strong,strong)UIButton *sender;
@property (strong,strong)UIImageView *pro_selectImageView;
@property (strong,strong)UILabel *pro_selectLabel;
@property (strong,strong)UILabel *pro_selectquantity;
@property (strong,strong)UILabel *pro_selectdecs;

@property (strong,strong)UILabel *pro_selectItemNum;
@end

@implementation cls_StashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pro_jinbobtn.hidden = YES;
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"img_stash_bg_stash"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, 0,b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
    }
    

    
    
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"img_stash_icon_stash"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(b.centerX, b.centerY,b.width, b.height);
            
        });
        var_imageview.pro_viewtagname = @"var_imageview";
        [self.view addSubview:var_imageview];
        var_imageview.userInteractionEnabled = YES;

        
        {
            UIImageView *var_imagevie1w = [[UIImageView alloc]init];
            var_imagevie1w.image = [cls_Tool fun_imageName:@"img_stash_icon_Skill fragment"];
            viewFrameBlock(var_imagevie1w,^(UIView *b){
                b.frame = CGRectMake(RPX(390), RPY(50),b.width, b.height);
                
            });
            [var_imageview addSubview:var_imagevie1w];
            self.pro_selectImageView = var_imagevie1w;
        }
        
        {
            UILabel *var_label = [[UILabel alloc]init];
            var_label.text = @"Agent";
            var_label.textColor = [UIColor whiteColor];
            var_label.font = [cls_Tool fun_cusstomFontSize:15];
            viewFrameBlock(var_label,^(UIView *b){
                b.frame = CGRectMake(RPX(460), RPY(50),RPX(100), RPX(30));
                
            });
            [var_imageview addSubview:var_label];
            self.pro_selectLabel = var_label;
        }
    
        {
            UILabel *var_label = [[UILabel alloc]init];
            var_label.text = @"Quantiy:99";
            var_label.textColor = [UIColor colorWithRed:238/255.0 green:200/255.0 blue:146/255.0 alpha:1];
            var_label.font = [cls_Tool fun_cusstomFontSize:12];
            viewFrameBlock(var_label,^(UIView *b){
                b.frame = CGRectMake(RPX(460), RPY(75),RPX(80), RPX(25));
                
            });
            [var_imageview addSubview:var_label];
            self.pro_selectquantity = var_label;
        }
        
        
        
            {
                UILabel *var_label = [[UILabel alloc]init];
                var_label.text = @"Reply to a certain number of fragments";
                var_label.numberOfLines = 0;
                var_label.textColor = [UIColor colorWithRed:238/255.0 green:200/255.0 blue:146/255.0 alpha:1];
                var_label.font = [cls_Tool fun_cusstomFontSize:RPX(12)];
                viewFrameBlock(var_label,^(UIView *b){
                    b.frame = CGRectMake(RPX(400), RPY(130),RPX(130), RPX(70));
                    
                });
                [var_imageview addSubview:var_label];
                self.pro_selectdecs = var_label;

            }
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_stash_btn_Ues"] forState:UIControlStateNormal];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(470), RPY(270),b.width, b.height);
            });
            [var_button addTarget:self action:@selector(fun_wpj:) forControlEvents:64];
     
            [self.view addSubview:var_button];
        }
    
    
    NSArray *zhuangbeis = [cls_warehouseModel fun_getWarehouse];
    int corlmax = MIN(zhuangbeis.count, 3);
    corlmax = 5;
    
    
    int itemW =  [UIScreen mainScreen].bounds.size.width * 0.15;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        itemW =  [UIScreen mainScreen].bounds.size.width * 0.1;
    }
    int itemH = itemW;
    int mariginX = RPX(12);
    int startY = RPY(50);
    int mariginH = [UIScreen mainScreen].bounds.size.height * 0.02;;
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(30);
    
    
    for (int i = 0; i < zhuangbeis.count; i++) {
        
        cls_warehouseModel *model = zhuangbeis[i];
        int row = i / corlmax;//所在行
        int col = i % corlmax;//所在列
        UIButton *b = [[UIButton alloc]init];
        [var_imageview addSubview:b];
        [b setBackgroundImage:[cls_Tool fun_imageName:model.pro_warehouseimageName] forState:UIControlStateNormal];
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        itemW = b.width;
        itemH = b.height;
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:var_imageview.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:var_imageview.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        
        
        
        UILabel *label = [[UILabel alloc]init];
        label.text = [NSString stringWithFormat:@"%d",model.pro_warehouseQuantity];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.pro_viewtagname = @"label";
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.font  = [cls_Tool fun_cusstomFontSize:12];
        [b addSubview:label];
        
        
        [label.widthAnchor constraintEqualToConstant:RPX(20)].active = YES;
        [label.heightAnchor constraintEqualToConstant:RPX(20)].active = YES;
        //        [label.bottomAnchor constraintEqualToAnchor:b.bottomAnchor constant:0].active = YES;
        NSLayoutConstraint *c =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
        NSLayoutConstraint *c1 =   [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:b attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [b  addConstraint:c];
        [b  addConstraint:c1];
        [b addTarget:self  action:@selector(fun_click:) forControlEvents:64];
        if (i == 0){
            [self fun_click:b];
        }
    }
  
    
   
}

- (void)fun_wpj:(UIButton *)sender
{
    cls_warehouseModel *zhuangbei = [cls_warehouseModel fun_getWarehouse][self.sender.tag];
    if (zhuangbei.pro_warehouseQuantity <=0)
    {
        return;;
    }
    
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"used" message:@"used" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
   
        
    }];
    [vc addAction:action];
    [self presentViewController:vc animated:true completion:nil];
   UIImageView * var_imageview=  [self.view fun_viewtagName:@"var_imageview"];
    zhuangbei.pro_warehouseQuantity --;
    [cls_warehouseModel fun_warehouseSingleSave:zhuangbei];
    
    self.pro_selectItemNum .text = [NSString stringWithFormat:@"%d",zhuangbei.pro_warehouseQuantity];
    self.pro_selectquantity.text = [NSString stringWithFormat:@"Quantity:%d",zhuangbei.pro_warehouseQuantity];

}
- (void)fun_click:(UIButton *)sender
{
    [self.sender removeFromSuperview];
    cls_warehouseModel *model =  [cls_warehouseModel fun_getWarehouse][sender.tag];
    
    UIButton *btn = [[UIButton alloc]init];
    btn.layer.borderColor = [UIColor yellowColor].CGColor;
    btn.layer.borderWidth = 1;
    btn.tag = sender.tag;
    [sender addSubview:btn];
    UILabel *l =  [sender fun_viewtagName:@"label"];
    self.pro_selectItemNum = l;
    
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn.widthAnchor constraintEqualToConstant:sender.width].active = YES;
    [btn.heightAnchor constraintEqualToConstant:sender.height].active = YES;
    [btn.leadingAnchor constraintEqualToAnchor:sender.leadingAnchor constant:0].active = YES;
    [btn.topAnchor constraintEqualToAnchor:sender.topAnchor constant:0].active = YES;
    
    
    
    self.sender = btn;
    
    self.pro_selectImageView.image = [cls_Tool fun_imageName:model.pro_warehouseimageName];
    self.pro_selectLabel.text = model.pro_warehousename;
    self.pro_selectquantity.text = [NSString stringWithFormat:@"Quantity:%d",model.pro_warehouseQuantity];
    self.pro_selectdecs.text = model.pro_warehousedesc;
}
- (void)dealloc
{
    NSLog(@"事发就能凭借该片");
}


@end
