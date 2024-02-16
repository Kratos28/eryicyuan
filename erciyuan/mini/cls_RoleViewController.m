//
//  cls_RoleViewController.m
//  erciyuan
//
//  Created by k on 2024/2/8.
//

#import "cls_RoleViewController.h"
#import "cls_equipModel.h"
@interface cls_RoleViewController ()
@property(nonatomic,strong)NSMutableArray *aa;
@end

@implementation cls_RoleViewController

- (NSMutableArray *)aa{
    if (_aa == nil){
        _aa = [NSMutableArray array];
        
    }
    return _aa;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"角色1场景"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(RPX(0), RPY(0),self.view.width, self.view.height);
        
    });
    [self.view addSubview:var_imageview];

    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"jiemianlan"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(RPX(0), RPY(0),b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"角色" forState:0];
            var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(50));
            });
       
            [var_imageview addSubview:var_button];
        }
    }
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"角色1"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(b.centerX, b.centerY,b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
    }
    
    
    
    UIButton *var_button = [[UIButton alloc]init];
    [var_button setBackgroundImage:[cls_Tool fun_imageName:@"caisxieann"] forState:0];
    var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
    viewFrameBlock(var_button,^(UIView *b){
        b.frame = CGRectMake(RPX(120), RPY(900),RPX(400), RPY(100));
    });
    
    [var_button addTapBlock:^(UIButton * _Nonnull btn) {
            
    }];
    [var_button addTarget:self action:@selector(caisxieann:) forControlEvents:64];

    [self.view addSubview:var_button];
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"chuandaiann"] forState:0];
        var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(550), RPY(900),RPX(400), RPY(100));
        });
        [self.view addSubview:var_button];

        [var_button addTarget:self action:@selector(chuandaiann:) forControlEvents:64];

    }
    

    [self zhaungbei];
    
    
    [self dibu];
    
}

- (void)zhaungbei
{
    
    NSMutableArray *equips =  [cls_equipModel fun_getModel];
    int  corlmax = 2;
    int itemW =  RPX(200);
    int itemH =  RPX(200);
    int mariginX = RPX(400);
    int startY = RPY(200);
    int mariginH =  RPY(60);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(100);
    
    [self.aa enumerateObjectsUsingBlock:^(UIButton *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
        
    }];
    
//    NSArray *array =    @[
//        @{@"name":@"魔法棒",@"gold":@"mofabang",@"num":@1,@"jinbi":@60,@"price":@6,@"id":@"com.sxsn.zs6"},
//    @{@"name":@"护身凯甲",@"gold":@"yifu",@"num":@5,@"jinbi":@300,@"price":@30,@"id":@"com.sxsn.zs30"},
//    @{@"name":@"天使拳套",@"gold":@"shoutao",@"num":@10,@"jinbi":@680,@"price":@68,@"id":@"com.sxsn.zs68"},
//    @{@"name":@"隐身战靴",@"gold":@"鞋子",@"num":@1,@"jinbi":@1280,@"price":@128,@"id":@"com.sxsn.zs128"},
//    ];
    
    
    
//    self.pro_dicst = array;
    for (int i = 0; i <equips.count; i++)
    {
        int row = i / corlmax;
        int col = i % corlmax;
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        cls_equipModel *dict =  equips[i];
//        [b setBackgroundImage:[cls_Tool fun_imageName:dict[@"gold"]] forState:UIControlStateNormal];
        [b setBackgroundImage:[cls_Tool fun_imageName:@"zhuangbeikuang"] forState:UIControlStateNormal];
//        [b setImage:[cls_Tool fun_imageName:dict[@"gold"]] forState:UIControlStateNormal];
        
        if (dict.pro_shifouchudandai)
        {
            
            [b setImage:[cls_Tool fun_imageName:dict.pro_equipimageName] forState:0];
        }
        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
//        [b addTarget:self action:@selector(fun_click:) forControlEvents:64];
        [self.aa addObject:b];
        
        
        UIButton *label = [[UIButton alloc]init];
        [b addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
//        [label setImage:[cls_Tool fun_imageName:@"zuans"] forState:UIControlStateNormal];
        if (dict.pro_shifouchudandai)
        {
            [label setTitle:[NSString stringWithFormat:@"%@",dict.pro_baseModelname] forState:UIControlStateNormal];
        }
//        [label setTitle:@"1000" forState:UIControlStateNormal];

        [label.widthAnchor constraintEqualToConstant:RPX(200)].active = YES;
        [label.heightAnchor constraintEqualToConstant:RPY(40)].active = YES;
        [label.centerXAnchor constraintEqualToAnchor:b.centerXAnchor constant:0].active = YES;
        NSLayoutConstraint *c =  [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:1 toItem:b attribute:NSLayoutAttributeBottom multiplier:1 constant:-5];
        [b addConstraint:c];
        
    }
}
- (void)caisxieann:(UIButton *)btn
{
    NSMutableArray *equips =  [cls_equipModel fun_getModel];
    for (int i = 0; i<equips.count; i++) {
        cls_equipModel *mo  =  equips[i];
        mo.pro_shifouchudandai = NO;
        [cls_equipModel fun_SingleSave:mo];
    }
    [self zhaungbei];
}
- (void)chuandaiann:(UIButton *)btn
{
    NSMutableArray *equips =  [cls_equipModel fun_getModel];
    for (int i = 0; i<equips.count; i++) {
        cls_equipModel *mo  =  equips[i];
        mo.pro_shifouchudandai = YES;
        [cls_equipModel fun_SingleSave:mo];
        
    }
    [self zhaungbei];
}
- (void)dibu
{
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"shuxlan"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(b.centerX,RPY(1000),b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
        
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"等级:1" forState:0];
            var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(50));
            });
       
            [var_imageview addSubview:var_button];
        }
        
        
        
        UILabel *labe = [[UILabel alloc]init];
        labe.text = @"神秘的少女占星术士，声称自己是《伟大的占星术士》，拥有与名号相符的不俗实力，博学而高傲。尽管过着拮据、清贫的声吼，但她坚决不用占卜来牟利。。。";
        viewFrameBlock(labe,^(UIView *b){
            b.frame = CGRectMake(RPX(30), RPY(230),RPX(970), RPY(100));
        });
        labe.numberOfLines = 0;
        labe.textColor  = [UIColor grayColor];
        labe.font = [cls_Tool fun_cusstomFontSize:20];

        [var_imageview addSubview:labe];

        
        
        
        UILabel *lab1e = [[UILabel alloc]init];
        lab1e.text = @"综合评分:10345";
        viewFrameBlock(lab1e,^(UIView *b){
            b.frame = CGRectMake(b.centerX, RPY(100),RPX(400), RPY(50));
        });
        lab1e.numberOfLines = 0;
        lab1e.textAlignment = NSTextAlignmentCenter;
        lab1e.textColor  = [UIColor blackColor];
        lab1e.font = [cls_Tool fun_cusstomFontSize:30];

        [var_imageview addSubview:lab1e];
    }
}


@end
