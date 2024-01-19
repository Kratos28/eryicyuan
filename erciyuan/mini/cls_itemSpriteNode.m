//
//  cls_itemSpriteNode.m
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/8.
//

#import "cls_itemSpriteNode.h"
#import "cls_Tool.h"
#import "cls_warehouseModel.h"
@implementation cls_itemSpriteNode
{
    SKLabelNode *pro_itemcountdownLabel;
    int pro_itemcountdownValue;
    NSTimer *timer;

    SKSpriteNode *pro_itemnode;
    SKLabelNode *pro_labelwarehouseQuantity;
}


- (instancetype)initWithColor:(UIColor *)color size:(CGSize)size
{
    self = [super initWithColor:color size:size];
    if (self)
    {
        self.userInteractionEnabled = true;

        SKSpriteNode *item = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImage:[cls_Tool fun_imageName:@"img_battle_icon_agent"]]];
        item.position = CGPointMake(0, 0);
        item.size = size;
        [self addChild:item];
        pro_itemnode = item;
        
       cls_warehouseModel *model = [cls_warehouseModel fun_getWarehouse][0];
        SKLabelNode *label =[SKLabelNode  labelNodeWithFontNamed:@"AppleSDGothicNeo-Bold"];
        label.text = [NSString stringWithFormat:@"%d",model.pro_warehouseQuantity];
        label.fontSize =RPX(20);
        label.fontColor = [UIColor whiteColor];
        label.position = CGPointMake(RPX(15), RPY(-18));
        [item addChild:label];
        pro_labelwarehouseQuantity = label;
        self.pro_itemSpriteenabled = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_pro_itemSpriteenabled == false) return;;
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_pro_itemSpriteenabled == false) return;;
    {
        if (_cls_itemssfwqdidTouchInside){
            _cls_itemssfwqdidTouchInside(self);
      
            
            
        }
    }
   
}
- (void)setPro_itemSpriteenabled:(bool)pro_itemSpriteenabled
{
    _pro_itemSpriteenabled = pro_itemSpriteenabled;
    if (pro_itemSpriteenabled)
    {

        
        [[self childNodeWithName:@"shapde"] removeFromParent];
    }else
    {
        
        SKShapeNode *shapde = [[SKShapeNode alloc]init];
        shapde.position = CGPointZero;
        shapde.fillColor = [[SKColor grayColor]colorWithAlphaComponent:0.5];;
        shapde.zPosition = 1;
        CGRect rect = CGRectMake(-pro_itemnode.frame.size.width /2, -pro_itemnode.frame.size.height /2, pro_itemnode.frame.size .width,pro_itemnode.frame.size.height); // 矩形的位置和大小
        CGMutablePathRef path = CGPathCreateMutable();

        
        NSInteger startAngle =0;

        CGFloat startAngleRadians = startAngle * M_PI / 180.0;

        CGFloat endAngleRadians = startAngleRadians + 2 * M_PI;

        CGPathAddRect(path, nil,  pro_itemnode.frame);
        
        shapde.name = @"shapde";
        shapde.path = path;
        CGPathRelease(path);
        
        [self addChild:shapde];

    }

}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_pro_itemSpriteenabled == false) return;;
    cls_warehouseModel *model = [cls_warehouseModel fun_getWarehouse][0];

    if (model.pro_warehouseQuantity >= 1)
    {
        if (_cls_itemssfwqdidTouchInside){

            _cls_itemssfwqdidTouchInside(self);
            
            model.pro_warehouseQuantity --;
            pro_labelwarehouseQuantity.text = [NSString stringWithFormat:@"%d",model.pro_warehouseQuantity];
            [cls_warehouseModel fun_warehouseSingleSave:model];
            
            [self fun_itemstartCountdown];
        }
    }


}
-(void)fun_itemstartCountdown {
    self.pro_itemSpriteenabled = NO;
    
    pro_itemcountdownValue = 10;
      pro_itemcountdownLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Bold"];
    pro_itemcountdownLabel.text = @"10";
    pro_itemcountdownLabel.fontSize = RPX(35);
    pro_itemcountdownLabel.fontColor = [UIColor whiteColor];
    pro_itemcountdownLabel.position = CGPointMake(RPX(0), RPY(-10));
      pro_itemcountdownLabel.zPosition = 10;
        
      [pro_itemnode addChild:pro_itemcountdownLabel];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats:YES];
    
}
-(void)stopCountdown {
    [pro_itemcountdownLabel removeFromParent];
    self.pro_itemSpriteenabled  = YES;
    pro_itemcountdownValue = 10;
    [timer invalidate];
}

-(void)updateCountdown {
    pro_itemcountdownValue = pro_itemcountdownValue - 1;;
    pro_itemcountdownLabel.text = [NSString stringWithFormat:@"%d", pro_itemcountdownValue];
    if (pro_itemcountdownValue <= 0) {
        [self stopCountdown];
    }
}
@end
