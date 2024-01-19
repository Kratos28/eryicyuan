//
//  cls_SkillupgradeViewController.m
//  chongshouduijue
//
//  Created by 9130Game on 2023/12/26.
//

#import "cls_SkillupgradeViewController.h"
#import "cls_equipModel.h"
#import "cls_warehouseModel.h"
@interface cls_SkillupgradeViewController ()
@property (nonatomic,weak)UILabel * pro_LV;
@property (nonatomic,weak)UILabel * pro_nextLV;
@property (nonatomic,weak)UILabel * pro_jinbiLabel;
@property (nonatomic,weak)UILabel * pro_shuiLabel;
@property (nonatomic,weak)UILabel * pro_detalLabel;
@property (nonatomic,weak)UIButton * pro_selectd;

@end

@implementation cls_SkillupgradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pro_jinbobtn.hidden = YES;

    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"img_skill_bg_skill"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
        });
        [self.view addSubview:var_imageview];
    }
    
  
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"Lv.8";
        var_label.textColor = [UIColor whiteColor];
        var_label.font = [cls_Tool fun_cusstomFontSize:17];
        viewFrameBlock(var_label,^(UIView *b){
            b.frame = CGRectMake(RPX(430), RPY(95), RPX(100),RPX(30));
        });
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#e1e3ef"];
        [self.view addSubview:var_label];
        self.pro_LV = var_label;
    }
    
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"Lv.9";
        var_label.textColor = [UIColor whiteColor];
        var_label.font = [cls_Tool fun_cusstomFontSize:17];
        viewFrameBlock(var_label,^(UIView *b){
            b.frame = CGRectMake(RPX(530), RPY(95), RPX(100),RPX(30));
            
        });
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#e1e3ef"];
        [self.view addSubview:var_label];
        self.pro_nextLV = var_label;
    }
    
    
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"Use the back mahine gun to shoot the enemy";
        var_label.textColor = [UIColor whiteColor];
        var_label.numberOfLines = 0;
        var_label.font = [cls_Tool fun_cusstomFontSize:13];
        viewFrameBlock(var_label,^(UIView *b){
            b.frame = CGRectMake(RPX(390), RPY(140), RPX(170),RPX(80));
            
        });
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#e1e3ef"];
        [self.view addSubview:var_label];
        self.pro_detalLabel = var_label;

    }
    
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"99999";
        var_label.textColor = [UIColor whiteColor];
        var_label.numberOfLines = 0;
        var_label.font = [cls_Tool fun_cusstomFontSize:13];
        viewFrameBlock(var_label,^(UIView *b){
            b.frame = CGRectMake(RPX(420), RPY(260), RPX(60),RPX(20));
            
        });
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#e1e3ef"];
        [self.view addSubview:var_label];
        self.pro_jinbiLabel = var_label;

    }
    
    {
        UILabel *var_label= [[UILabel alloc]init];
        var_label.text = @"99999";
        var_label.textColor = [UIColor whiteColor];
        var_label.numberOfLines = 0;
        var_label.font = [cls_Tool fun_cusstomFontSize:13];
        viewFrameBlock(var_label,^(UIView *b){
            b.frame = CGRectMake(RPX(530), RPY(260), RPX(60),RPX(20));
            
        });
        var_label.textColor = [cls_Tool fun_colorWithHexString:@"#e1e3ef"];
        [self.view addSubview:var_label];
        self.pro_shuiLabel = var_label;

    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_skill_btn_update"] forState:UIControlStateNormal];
        viewFrameBlock(var_button,^(UIView *b){
            b.frame = CGRectMake(RPX(450), RPY(300),b.width, b.height);
        });
        
        [var_button addTarget:self  action:@selector(fun_jphgw:) forControlEvents:64];
        
        
        
        [self.view addSubview:var_button];
    }
    
    
    CGFloat centerX = -RPX(90); // 半圆的中心点x坐标
    CGFloat centerY = RPY(220);
       CGFloat radius = RPX(175); // 半圆的半径
       
       // 创建半圆的路径
       UIBezierPath *path = [UIBezierPath bezierPath];
       [path addArcWithCenter:CGPointMake(centerX, centerY) radius:radius startAngle:-M_PI_2 endAngle:M_PI_2  clockwise:YES];
       
       // 创建半圆的图层
       CAShapeLayer *shapeLayer = [CAShapeLayer layer];
       shapeLayer.path = path.CGPath;
       shapeLayer.fillColor = [UIColor clearColor].CGColor;
       shapeLayer.strokeColor = [UIColor blackColor].CGColor;
       shapeLayer.lineWidth = 2.0;
       
       // 添加半圆的图层到视图
       [self.view.layer addSublayer:shapeLayer];
       int  buttonSize = RPX(50); // 按钮的大小
       // 计算每个按钮之间的角度间隔
       CGFloat angleOffset = -M_PI_2 / 3;
       
     NSArray *equips =  [cls_equipModel fun_getModel];
    
       for (NSInteger i = 0; i < equips.count; i++) {
           CGFloat angle = M_PI_4 + angleOffset * i; // 计算每个按钮的角度
           // 计算每个按钮的中心点坐标
           CGFloat buttonCenterX = centerX + radius * cos(angle) - buttonSize / 2.0;
           CGFloat buttonCenterY = centerY - radius * sin(angle) - buttonSize / 2.0;
           cls_equipModel *moe =  equips[i];
           // 创建按钮
           UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
           button.tag = i;
           button.frame = CGRectMake(buttonCenterX, buttonCenterY, buttonSize, buttonSize);
           button.layer.cornerRadius = buttonSize / 2.0;
           button.backgroundColor = [UIColor redColor]; // 设置按钮的背景色，可以根据需要进行修改
    
           [button setBackgroundImage:[cls_Tool fun_imageName:moe.pro_equipimageName] forState:0];

           [self.view addSubview:button];
           [button addTarget:self action:@selector(fun_clickc:) forControlEvents:64];
           
           
           if (i == 0){
               [self fun_clickc:button];
           }
       }
    
}
- (void)fun_jphgw:(UIButton *)sender
{
    
    NSMutableArray *equips =  [cls_equipModel fun_getModel];
    cls_equipModel *equip = equips[self.pro_selectd.tag];
    
    cls_userInfo *u =  [cls_userInfo fun_getuserInfo];
    cls_warehouseModel *model =  [cls_warehouseModel fun_getWarehouse][1];

 
    
    if (u.pro_gold <  equip.pro_equipValue.pro_equipValueModelConsumegold ||  model.pro_warehouseQuantity < equip.pro_equipValue.pro_equipValueModelConsumeshuijing)
    {
        
        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:@"shortage of material" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [vc addAction:action];
        [self presentViewController:vc animated:true completion:nil];
        
        return;
    }
    
    
    u.pro_gold = u.pro_gold - equip.pro_equipValue.pro_equipValueModelConsumegold;
    model.pro_warehouseQuantity = model.pro_warehouseQuantity - equip.pro_equipValue.pro_equipValueModelConsumeshuijing;
    
   
    equip.pro_equiplv =  equip.pro_equiplv + 1;
    
    [cls_warehouseModel fun_warehouseSingleSave:model];
    NSArray  *ff = [cls_warehouseModel fun_getWarehouse];
    
    
    [u fun_save];

    [cls_equipModel fun_Save:equips];
    [[NSNotificationCenter defaultCenter]postNotificationName:[cls_Tool fun_updatejinbiStr] object:nil];
    [self fun_clickc:self.pro_selectd];
    
}
- (void)fun_clickc:(UIButton *)sender
{
    
    
    
  
    
    [self.pro_selectd removeFromSuperview];
    cls_equipModel *equip =  [cls_equipModel fun_getModel][sender.tag];
    

    UILabel *var_senderL =  [self.pro_selectd fun_viewtagName:@"A"];
    [var_senderL removeFromSuperview];
    UIButton *var_btn = [[UIButton alloc] init];
    var_btn.frame = sender.bounds;
    var_btn.tag = sender.tag;
    var_btn.layer.borderWidth = 2;
    var_btn.layer.borderColor = [UIColor yellowColor].CGColor;
    var_btn.layer.cornerRadius = sender.frame.size.width / 2;
    [sender addSubview:var_btn];
    
    
    
    UILabel *var_label= [[UILabel alloc]init];
    var_label.pro_viewtagname = @"A";
    var_label.text = [NSString stringWithFormat:@"LV.%d",equip.pro_equipValue.pro_equipValueModelLV];
    var_label.font = [cls_Tool fun_cusstomFontSize:14];
    var_label.textColor = [cls_Tool fun_colorWithHexString:@"#FEE4DB"];
    var_label.frame = CGRectMake(RPX(60),  (RPX(30) /2) - RPX(15) /2 , RPX(30), RPX(30) );
    [var_btn addSubview:var_label];
    self.pro_selectd = var_btn;
    self.pro_LV.text = [NSString stringWithFormat:@"LV.%d",equip.pro_equipValue.pro_equipValueModelLV];
    self.pro_nextLV.text = [NSString stringWithFormat:@"LV.%d",equip.pro_equipnextValue.pro_equipValueModelLV];
    self.pro_jinbiLabel.text = [NSString stringWithFormat:@"%d",equip.pro_equipValue.pro_equipValueModelConsumegold];
    self.pro_shuiLabel.text = [NSString stringWithFormat:@"%d",equip.pro_equipValue.pro_equipValueModelConsumeshuijing];
    
 
    
}

@end
