//
//  cls_shangchengViewController.m
//  erciyuan
//
//  Created by k on 2024/3/3.
//

#import "cls_shangchengViewController.h"
#import "YQInAppPurchaseTool.h"
#import "QF_HZActivityIndicatorView.h"
@interface cls_shangchengViewController ()
@property (nonatomic,strong)NSMutableArray *zuanshis;
@property (nonatomic,strong)NSMutableArray *daojus;
@property (nonatomic,strong)NSMutableArray * data;
@property (nonatomic,strong) NSMutableArray *productArray;
@end

@implementation cls_shangchengViewController

NSString * JavascriptBridge_js() {
#define __wvjb_js_func__(x) #x
    
    
    static NSString * preprocessorJSCode = @__wvjb_js_func__(({
        "product": [
            {
               "pic" :"充值_18_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l1",
               "coin": 6,
               "goods":60,
                "id":"com.sxsn.zs6"
            },
            {
               "pic" :"充值_17_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l2",
               "coin": 30,
               "goods":300,
                "id":"com.sxsn.zs30"
            },
            {
               "pic" :"充值_12_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l3",
               "coin": 68,
               "goods":680,
                "id":"com.sxsn.zs68"
            },
            {
               "pic" :"充值_15_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l4",
               "coin": 128,
               "goods":1280,
                "id":"com.sxsn.zs128"
            },
            {
               "pic" :"充值_13_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l5",
               "coin": 198,
               "goods":1980,
                "id":"com.sxsn.zs198"
            },
            {
               "pic" :"充值_14_",
               "selectedpic" :"4七天签到_slices_4七天签到_slices_l6",
               "coin": 328,
               "goods":3280,
                "id":"com.sxsn.zs328"
            }
        ]

    }));
    
    #undef __wvjb_js_func__
    
    preprocessorJSCode =  [preprocessorJSCode stringByReplacingOccurrencesOfString:@"(" withString:@""];
    preprocessorJSCode =  [preprocessorJSCode stringByReplacingOccurrencesOfString:@")" withString:@""];
    return preprocessorJSCode;
};


//支付成功了，并开始向苹果服务器进行验证（若CheckAfterPay为NO，则不会经过此步骤）
-(void)IAPToolBeginCheckingdWithProductID:(NSString *)productID {
    
    for (int i =0; i<self.data.count; i++) {
         NSDictionary *Dd =  self.data[i];
        if ([productID isEqualToString:Dd[@"id"]]) {
                
            
            UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:@"购买成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                
                cls_userInfo *p =  [cls_userInfo fun_getuserInfo];
                
                p.pro_gold   = [Dd[@"goods"] intValue] + p.pro_gold;
                [p fun_save];;
                [cls_Tool fun_updateNote];
            }];
            [vc addAction:ac1];
            [self presentViewController:vc animated:false completion:nil];
            
            break;;
            
        }
    }
    [QF_HZActivityIndicatorView hide];

}

//IAP工具已获得可购买的商品
-(void)IAPToolGotProducts:(NSMutableArray *)products {
    NSLog(@"GotProducts:%@",products);
    [QF_HZActivityIndicatorView hide];
//    self.productArray = products;
    
    
}

//支付失败/取消
-(void)IAPToolCanceldWithProductID:(NSString *)productID {
    NSLog(@"canceld:%@",productID);
    [QF_HZActivityIndicatorView hide];

}
//支付成
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}



- (void)viewDidLoad {
    [super viewDidLoad];

self.zuanshis = [NSMutableArray array];
self.daojus = [NSMutableArray array];
    self.productArray = [NSMutableArray array];
    self.data = [NSMutableArray array];

    NSDictionary *d = [self dictionaryWithJsonString:JavascriptBridge_js()];
    
    
    int corlmax = 3;
    int itemW = RPX(410);
    int itemH = RPY(400);
    int startX = RPX(380);
    int startY = RPX(650);
    NSDictionary *dict =  nil;
    NSArray * te  = d[@"product"];

    
    for (int i = 0; i < te.count; i++) {
        int row=i/corlmax;//所在行
        int col=i%corlmax;//所在列
        //创建按钮
        UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *bb = te[i][@"pic"];
        NSString *fff = te[i][@"id"];

        [self.data addObject:te[i]];
        [self.productArray addObject:fff];

    }
    
    
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"界面背景"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(RPX(0), RPY(0),self.view.frame.size.width, self.view.frame.size.height);
        
    });
    
    
    
    [self.view addSubview:var_imageview];

    
    YQInAppPurchaseTool *IAPTool = [YQInAppPurchaseTool defaultTool];
    
    //设置代理
    IAPTool.delegate = self;
    
    [QF_HZActivityIndicatorView showLoading:@"请在查询商品，请稍后"];
    [IAPTool requestProductsWithProductArray:self.productArray];
    
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"jiemianlan"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(RPX(0), RPY(0),b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"商店" forState:0];
            var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(50));
            });
       
            [var_imageview addSubview:var_button];
        }
    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"按钮3"] forState:0];
        var_button.frame = CGRectMake(RPX(100), RPY(100),RPX(300), RPY(50));
        [var_button setTitle:@"钻石" forState:0];
        [var_button addTapBlock:^(UIButton * _Nonnull btn) {
            [self fun_setupzuanshi];

            
        }];
            [self.view addSubview:var_button];
        
    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"按钮4"] forState:0];
        var_button.frame = CGRectMake(RPX(500), RPY(100),RPX(200), RPY(50));
        [var_button setTitle:@"道具" forState:0];
        [var_button addTapBlock:^(UIButton * _Nonnull btn) {
   
            [self fun_daoju];

        }];
            [self.view addSubview:var_button];
        
    }
    
    [self fun_setupzuanshi];
    
    
}
- (void)fun_daoju
{
    int  corlmax = 3;

    int itemW =  RPX(300);
    int itemH =  RPY(300);
    int mariginX = RPX(30);
    int startY = RPY(200);
    int mariginH =  RPY(60);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(50);
    
    NSArray *array =    @[
        @{@"name":@"medicine",@"gold":@"鞋子",@"num":@1,@"jinbi":@60,@"price":@6,@"id":@"com.sxsn.zs6"},
    @{@"name":@"Skill",@"gold":@"yifu",@"num":@5,@"jinbi":@300,@"price":@30,@"id":@"com.sxsn.zs30"},
    @{@"name":@"Breakthrough",@"gold":@"mofabang",@"num":@10,@"jinbi":@680,@"price":@68,@"id":@"com.sxsn.zs68"},
    @{@"name":@"Dog",@"gold":@"shoutao",@"num":@1,@"jinbi":@1280,@"price":@128,@"id":@"com.sxsn.zs128"},
    @{@"name":@"birdie",@"gold":@"nengliangping",@"num":@1,@"jinbi":@1980,@"price":@198,@"id":@"com.sxsn.zs198"},
    @{@"name":@"birdie",@"gold":@"zhouyu",@"num":@1,@"jinbi":@3280,@"price":@320,@"id":@"com.sxsn.zs328"}
    ];
//    self.pro_dicst = array;
    for (int i = 0; i < array.count; i++)
    {
        int row = i / corlmax;
        int col = i % corlmax;
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        NSDictionary *dict =  array[i];
//        [b setBackgroundImage:[cls_Tool fun_imageName:dict[@"gold"]] forState:UIControlStateNormal];
        [b setBackgroundImage:[cls_Tool fun_imageName:@"商店框"] forState:UIControlStateNormal];
        
//        [b setImage:[cls_Tool fun_imageName:dict[@"gold"]] forState:UIControlStateNormal];

        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        [b addTarget:self action:@selector(fun_daojuclick:) forControlEvents:64];
        [b addTapBlock:^(UIButton * _Nonnull btn) {
            cls_userInfo *u =  [cls_userInfo fun_getuserInfo];
            
            if (u.pro_gold > [dict[@"price"]intValue])
            {
                
            }
        }];

        
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(RPX(70), RPY(60), RPX(150), RPX(150));
        [btn setImage:[cls_Tool fun_imageName:dict[@"gold"]] forState:UIControlStateNormal];
        [b addSubview:btn];
        
        
        
        UIButton *btn1 = [[UIButton alloc]init];
        btn1.frame = CGRectMake(RPX(70), RPY(250), RPX(50), RPX(50));
        [btn1 setImage:[cls_Tool fun_imageName:@"zuans"] forState:UIControlStateNormal];
        [b addSubview:btn1];
        
        
        
        UIButton *label = [[UIButton alloc]init];
        [b addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
//        [label setImage:[cls_Tool fun_imageName:@"zuans"] forState:UIControlStateNormal];
        [label setTitle:[NSString stringWithFormat:@"%d",[dict[@"jinbi"]intValue]] forState:UIControlStateNormal];

//        [label setTitle:@"1000" forState:UIControlStateNormal];

        [label.widthAnchor constraintEqualToConstant:RPX(200)].active = YES;
        [label.heightAnchor constraintEqualToConstant:RPY(40)].active = YES;
        [label.centerXAnchor constraintEqualToAnchor:b.centerXAnchor constant:15].active = YES;
        NSLayoutConstraint *c =  [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:1 toItem:b attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
        [b addConstraint:c];
        [self.zuanshis addObject:b];
    }
}
- (void)fun_setupzuanshi
{
    int  corlmax = 3;

    int itemW =  RPX(300);
    int itemH =  RPY(300);
    int mariginX = RPX(30);
    int startY = RPY(200);
    int mariginH =  RPY(60);
    
    CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
    CGFloat const startX = RPX(50);
    
    NSArray *array =    @[
        @{@"name":@"medicine",@"gold":@"商店框",@"num":@1,@"jinbi":@60,@"price":@6,@"id":@"com.sxsn.zs6"},
    @{@"name":@"Skill",@"gold":@"商店框",@"num":@5,@"jinbi":@300,@"price":@30,@"id":@"com.sxsn.zs30"},
    @{@"name":@"Breakthrough",@"gold":@"商店框",@"num":@10,@"jinbi":@680,@"price":@68,@"id":@"com.sxsn.zs68"},
    @{@"name":@"Dog",@"gold":@"商店框",@"num":@1,@"jinbi":@1280,@"price":@128,@"id":@"com.sxsn.zs128"},
    @{@"name":@"birdie",@"gold":@"img_store_btn_Pet roll100",@"num":@1,@"jinbi":@1980,@"price":@198,@"id":@"com.sxsn.zs198"},
        @{@"name":@"birdie",@"gold":@"img_store_btn_Pet roll100",@"num":@1,@"jinbi":@3280,@"price":@320,@"id":@"com.sxsn.zs328"}
    ];
//    self.pro_dicst = array;
    for (int i = 0; i < array.count; i++)
    {
        int row = i / corlmax;
        int col = i % corlmax;
        UIButton *b = [[UIButton alloc]init];
        [self.view addSubview:b];
        [b setTitle:@"" forState:UIControlStateNormal];
        NSDictionary *dict =  array[i];
//        [b setBackgroundImage:[cls_Tool fun_imageName:dict[@"gold"]] forState:UIControlStateNormal];
        [b setBackgroundImage:[cls_Tool fun_imageName:@"商店框"] forState:UIControlStateNormal];
        [b setImage:[cls_Tool fun_imageName:@"钻石1"] forState:UIControlStateNormal];

        b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
        b.titleLabel.textAlignment = NSTextAlignmentRight;
        b.tag = i;
        b.translatesAutoresizingMaskIntoConstraints = NO;
        [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
        [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
        [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
        [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
        [b addTarget:self action:@selector(fun_zuanshiclick:) forControlEvents:64];


        UIButton *label = [[UIButton alloc]init];
        [b addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
//        [label setImage:[cls_Tool fun_imageName:@"zuans"] forState:UIControlStateNormal];
        [label setTitle:[NSString stringWithFormat:@"¥%d",[dict[@"price"]intValue]] forState:UIControlStateNormal];

//        [label setTitle:@"1000" forState:UIControlStateNormal];

        [label.widthAnchor constraintEqualToConstant:RPX(200)].active = YES;
        [label.heightAnchor constraintEqualToConstant:RPY(40)].active = YES;
        [label.centerXAnchor constraintEqualToAnchor:b.centerXAnchor constant:0].active = YES;
        NSLayoutConstraint *c =  [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:1 toItem:b attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
        [b addConstraint:c];
        [self.zuanshis addObject:b];
    }
}
- (void)fun_zuanshiclick:(UIButton *)sender
{
    [QF_HZActivityIndicatorView showLoading:@"正在拉起，请稍后"];
    NSDictionary * dd =  self.data[sender.tag];
    [[YQInAppPurchaseTool defaultTool]buyProduct:dd[@"id"]];
}

@end
