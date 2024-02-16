//
//  cls_equipModel.m
//  Game
//
//  Created by 9130Game on 2023/11/23.
//

#import "cls_equipModel.h"




@implementation cls_equipModel



- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.pro_equipdesc = [coder decodeObjectForKey:@"pro_equipdesc"];
        self.pro_equipfangyu = [coder decodeIntForKey:@"pro_equipfangyu"];
        self.pro_equipgold = [coder decodeIntForKey:@"pro_equipgold"];
        self.pro_equipgongji = [coder decodeIntForKey:@"pro_equipgongji"];
        self.pro_equipimageName = [coder decodeObjectForKey:@"pro_equipimageName"];
        self.pro_equiplv = [coder decodeIntForKey:@"pro_equiplv"];
        self.pro_equipown = [coder decodeBoolForKey:@"pro_equipown"];
        self.pro_equipshanbi = [coder decodeIntForKey:@"pro_equipshanbi"];
        self.pro_equipstatus = [coder decodeIntForKey:@"pro_equipstatus"];
        self.pro_equipxueliang = [coder decodeIntForKey:@"pro_equipxueliang"];
        self.pro_equipwarehouseQuantity = [coder decodeIntForKey:@"pro_equipwarehouseQuantity"];
        self.pro_equipValue = [coder decodeObjectForKey:@"pro_equipValue"];
        self.pro_equipnextValue = [coder decodeObjectForKey:@"pro_equipnextValue"];
        self.pro_shifouchudandai = [coder decodeBoolForKey:@"pro_shifouchudandai"];
        
//        self.pro_baseModelname = [coder decodeObjectForKey:@"pro_baseModelname"];

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:self.pro_equipdesc forKey:@"pro_equipdesc"];
    [coder encodeInt:self.pro_equipfangyu forKey:@"pro_equipfangyu"];
    [coder encodeInt:self.pro_equipgold forKey:@"pro_equipgold"];
    [coder encodeInt:self.pro_equipgongji forKey:@"pro_equipgongji"];
    [coder encodeObject:self.pro_equipimageName forKey:@"pro_equipimageName"];
    [coder encodeInt:self.pro_equiplv forKey:@"pro_equiplv"];
    [coder encodeBool:self.pro_equipown forKey:@"pro_equipown"];
    [coder encodeInt:self.pro_equipshanbi forKey:@"pro_equipshanbi"];
    [coder encodeInt:self.pro_equipstatus forKey:@"pro_equipstatus"];
    [coder encodeInt:self.pro_equipxueliang forKey:@"pro_equipxueliang"];
    [coder encodeInt:self.pro_equipwarehouseQuantity forKey:@"pro_equipwarehouseQuantity"];
    [coder encodeObject:self.pro_equipValue forKey:@"pro_equipValue"];
    [coder encodeObject:self.pro_equipnextValue forKey:@"pro_equipnextValue"];
    [coder encodeBool:self.pro_shifouchudandai forKey:@"pro_shifouchudandai"];

}

+ (void)initialize
{
    [self fun_createEquipModel];
}
+ (BOOL)supportsSecureCoding{
    return YES;
}


+ (NSMutableArray *)fun_Equipvalue
{
    NSMutableArray *temp = [NSMutableArray array];
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 1000;
        v.pro_equipValueModelATK = 20;
        v.pro_equipValueModelConsumegold = 500;
        v.pro_equipValueModelConsumeshuijing = 5;
        v.pro_equipValueModelLV = 1;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 2000;
        v.pro_equipValueModelATK = 40;
        v.pro_equipValueModelConsumegold = 800;
        v.pro_equipValueModelConsumeshuijing = 8;
        v.pro_equipValueModelLV = 2;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 3000;
        v.pro_equipValueModelATK = 60;
        v.pro_equipValueModelConsumegold = 1100;
        v.pro_equipValueModelConsumeshuijing = 11;
        v.pro_equipValueModelLV = 3;
        [temp addObject:v];
    }
    
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 4000;
        v.pro_equipValueModelATK = 80;
        v.pro_equipValueModelConsumegold = 1400;
        v.pro_equipValueModelConsumeshuijing = 14;
        v.pro_equipValueModelLV = 4;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 5000;
        v.pro_equipValueModelATK = 100;
        v.pro_equipValueModelConsumegold = 1700;
        v.pro_equipValueModelConsumeshuijing = 17;
        v.pro_equipValueModelLV = 5;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 6000;
        v.pro_equipValueModelATK = 120;
        v.pro_equipValueModelConsumegold = 2000;
        v.pro_equipValueModelConsumeshuijing = 20;
        v.pro_equipValueModelLV = 6;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 700;
        v.pro_equipValueModelATK = 140;
        v.pro_equipValueModelConsumegold = 2300;;
        v.pro_equipValueModelConsumeshuijing = 23;
        v.pro_equipValueModelLV = 7;
        [temp addObject:v];
    }
    
    {
        cls_equipValueModel *v = [[cls_equipValueModel alloc]init];
        v.pro_equipValueModelHP = 800;
        v.pro_equipValueModelATK = 160;
        v.pro_equipValueModelConsumegold = 2600;;
        v.pro_equipValueModelConsumeshuijing = 9999;
        v.pro_equipValueModelLV = 8;
        [temp addObject:v];
    }
    return temp;
    
}
+ (cls_equipValueModel *)fun_getEquipValueModel:(int)lv
{
    NSMutableArray *temp =  [self fun_Equipvalue];
  __block  cls_equipValueModel *moel = nil;
    [temp enumerateObjectsUsingBlock:^(cls_equipValueModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.pro_equipValueModelLV == lv)
            {
                moel = obj;
                *stop = YES;
            }
    }];
    return moel;
}



+ (NSMutableArray *)fun_getModel
{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil) {
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appName = [NSString stringWithFormat:@"%@_%@",appName,NSStringFromClass([self class])];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSData *data = [defaults objectForKey:appName];
    NSError *error = nil;
    NSSet *allowedClasses = [NSSet setWithObjects:[NSMutableArray class],[NSMutableDictionary class],[NSString class],self.class,cls_equipValueModel.class, nil];
    NSMutableArray *temps = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:&error];
    
    [temps enumerateObjectsUsingBlock:^(cls_equipModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.pro_equipValue  = [self fun_getEquipValueModel:obj.pro_equiplv];
        obj.pro_equipnextValue  = [self fun_getEquipValueModel:obj.pro_equiplv+1];

        [temps replaceObjectAtIndex:idx withObject:obj];
    }];
    
    if (temps)
    {
        return temps;
    }
    return nil;
}

+ (void )fun_createEquipModel
{
    
    /*
     
     
     NSArray *array =    @[
         @{@"name":@"魔法棒",@"gold":@"mofabang",@"num":@1,@"jinbi":@60,@"price":@6,@"id":@"com.sxsn.zs6"},
     @{@"name":@"护身凯甲",@"gold":@"yifu",@"num":@5,@"jinbi":@300,@"price":@30,@"id":@"com.sxsn.zs30"},
     @{@"name":@"天使拳套",@"gold":@"shoutao",@"num":@10,@"jinbi":@680,@"price":@68,@"id":@"com.sxsn.zs68"},
     @{@"name":@"隐身战靴",@"gold":@"鞋子",@"num":@1,@"jinbi":@1280,@"price":@128,@"id":@"com.sxsn.zs128"},
     ];
     */
    NSMutableArray *temp = [NSMutableArray array];
    {
        
        cls_equipModel *zhuangbei = [[cls_equipModel alloc] init];
        zhuangbei.pro_equiplv = 1;
        cls_equipValueModel *valueModel = [self fun_getEquipValueModel:zhuangbei.pro_equiplv];
        zhuangbei.pro_equipfangyu =  arc4random_uniform(200) +100;
        zhuangbei.pro_equipgold = arc4random_uniform(200) +100;
        zhuangbei.pro_equipgongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipimageName = @"mofabang";
        zhuangbei.pro_baseModelname = @"魔法棒";
        zhuangbei.pro_equipown = YES;
        zhuangbei.pro_equipshanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipstatus = 1;
        zhuangbei.pro_equipxueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipwarehouseQuantity = 1;
        zhuangbei.pro_equipValue = valueModel;
        zhuangbei.pro_shifouchudandai = NO;
        [temp addObject:zhuangbei];
    }
    
    
    {
        cls_equipModel *zhuangbei = [[cls_equipModel alloc] init];
        zhuangbei.pro_equipfangyu = arc4random_uniform(200) +100;
        zhuangbei.pro_equipgold = arc4random_uniform(200) +100;
        zhuangbei.pro_equipgongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipimageName = @"yifu";
        zhuangbei.pro_equiplv = 1;
        zhuangbei.pro_baseModelname = @"护身凯甲";
        zhuangbei.pro_equipown = YES;
        zhuangbei.pro_equipshanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipstatus = 1;
        zhuangbei.pro_equipxueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipwarehouseQuantity = 1;
        zhuangbei.pro_shifouchudandai = NO;
        zhuangbei.pro_equipValue = [self fun_getEquipValueModel:zhuangbei.pro_equiplv];
        [temp addObject:zhuangbei];
    }
   
    {
        cls_equipModel *zhuangbei = [[cls_equipModel alloc] init];
        zhuangbei.pro_equipfangyu =  arc4random_uniform(200) +100;
        zhuangbei.pro_equipgold = arc4random_uniform(200) +100;
        zhuangbei.pro_equipgongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipimageName = @"shoutao";
        zhuangbei.pro_equiplv = 1;
        zhuangbei.pro_baseModelname = @"天使拳套";
        zhuangbei.pro_equipown = YES;
        zhuangbei.pro_equipshanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipstatus = 1;
        zhuangbei.pro_equipxueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipwarehouseQuantity = 1;
        zhuangbei.pro_shifouchudandai = NO;
        zhuangbei.pro_equipValue = [self fun_getEquipValueModel:zhuangbei.pro_equiplv];
        [temp addObject:zhuangbei];
    }
    
    {
        cls_equipModel *zhuangbei = [[cls_equipModel alloc] init];
        zhuangbei.pro_equipfangyu =  arc4random_uniform(200) +100;
        zhuangbei.pro_equipgold = arc4random_uniform(200) +100;
        zhuangbei.pro_equipgongji =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipimageName = @"鞋子";
        zhuangbei.pro_equiplv = 1;
        zhuangbei.pro_baseModelname = @"隐身战靴";
        zhuangbei.pro_equipown = YES;
        zhuangbei.pro_equipshanbi =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipstatus = 1;
        zhuangbei.pro_equipxueliang =  arc4random_uniform(200) +100;;
        zhuangbei.pro_equipwarehouseQuantity = 1;
        zhuangbei.pro_shifouchudandai = NO;
        zhuangbei.pro_equipValue = [self fun_getEquipValueModel:zhuangbei.pro_equiplv];
        [temp addObject:zhuangbei];
    }

    

    [self fun_Save:temp];
}

@end
