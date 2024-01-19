//
//  cls_shopViewController.m
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/6.
//

#import "cls_shopViewController.h"
#import "cls_warehouseModel.h"
#import "cls_Tool.h"
@interface cls_shopViewController ()
@property (nonatomic,copy)NSArray *pro_dicst;
@end

@implementation cls_shopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    viewFrameBlock(self.pro_jinbobtn,^(UIView *b){
        b.frame = CGRectMake(RPX(100), RPY(5), b.width, b.height);
        
    });
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"img_store_bg_store"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
            
        });
        [self.view addSubview:var_imageview];
    }
    
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.userInteractionEnabled  = YES;
        var_imageview.image = [cls_Tool fun_imageName:@"img_store_bg_store2"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(b.centerX, b.centerY,RPX(550), RPY(300));
        });
        [self.view addSubview:var_imageview];
        
        
        

        int  corlmax = 3;
    
        int itemW =  RPX(60);
        int itemH =  RPY(25);
        int mariginX = RPX(85);
        int startY = RPY(140);
        int mariginH =  RPY(60);
        
        CGFloat const totalWidth = corlmax * itemW + (corlmax - 1) * mariginX;
        CGFloat const startX = RPX(150);
        
 
        
        NSArray *array =    @[
            @{@"name":@"medicine",@"gold":@"img_store_btn_gold100",@"num":@1,@"jinbi":@100},
        @{@"name":@"Skill",@"gold":@"img_store_btn_gold1000",@"num":@5,@"jinbi":@1000},
        @{@"name":@"Breakthrough",@"gold":@"img_store_btn_gold5000",@"num":@10,@"jinbi":@1000},
        @{@"name":@"Dog",@"gold":@"img_store_btn_gold10000",@"num":@1,@"jinbi":@10000},
        @{@"name":@"birdie",@"gold":@"img_store_btn_Pet roll100",@"num":@1,@"jinbi":@10000},
        ];
        self.pro_dicst = array;
        for (int i = 0; i < array.count; i++)
        {
            int row = i / corlmax;
            int col = i % corlmax;
            UIButton *b = [[UIButton alloc]init];
            [var_imageview addSubview:b];
            [b setTitle:@"" forState:UIControlStateNormal];
            NSDictionary *dict =  array[i];
            [b setBackgroundImage:[cls_Tool fun_imageName:dict[@"gold"]] forState:UIControlStateNormal];
            b.titleLabel.font = [UIFont boldSystemFontOfSize:([UIScreen mainScreen].bounds.size.width * 0.1)];
            b.backgroundColor = [UIColor redColor];
            b.titleLabel.textAlignment = NSTextAlignmentRight;
            b.tag = i;
            b.translatesAutoresizingMaskIntoConstraints = NO;
            [b.widthAnchor constraintEqualToConstant:itemW].active = YES;
            [b.heightAnchor constraintEqualToConstant:itemH].active = YES;
            [b.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:startX + col * (mariginX + itemW)].active = YES;
            [b.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:startY + row * (mariginH + itemH)].active = YES;
            
            
            [b addTarget:self action:@selector(fun_click:) forControlEvents:64];
            
        }
        
    }

}
- (void)fun_click:(UIButton *)sender
{
    NSDictionary *dict  =  self.pro_dicst[sender.tag];
    NSString *name  =  dict[@"name"];
    int  quanity  =  [dict[@"num"] intValue];
    int  gold  =  [dict[@"jinbi"] intValue];
    cls_userInfo *user =  [cls_userInfo fun_getuserInfo];
    if (user.pro_gold <  gold)
    {
        
        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:@"be short of gold coins" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [vc addAction:action];
        [self presentViewController:vc animated:true completion:nil];
        return;;
    }
    
    NSArray *temps =  [cls_warehouseModel fun_getWarehouse];
    [temps enumerateObjectsUsingBlock:^(cls_warehouseModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
        if ([obj.pro_warehousename isEqualToString:name])
        {
            
            user.pro_gold = user.pro_gold - gold;
            [user fun_save];
            obj.pro_warehouseQuantity += quanity;
            [cls_warehouseModel fun_warehouseSingleSave:obj];
            [[NSNotificationCenter defaultCenter]postNotificationName:[cls_Tool fun_updatejinbiStr] object:nil];
        }
    }];
    
}

@end
