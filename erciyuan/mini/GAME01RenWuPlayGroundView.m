//
//  GAME01RenWuPlayGroundView.m
//  game01_Example
//
//  Created by K on 2022/3/21.
//  Copyright © 2022 Kratos. All rights reserved.
//

#import "GAME01RenWuPlayGroundView.h"
#import "GAME01PlayGroundPlayGround.h"
#import "GAME01renwu.h"
#import "cls_zr.h"
#import "cls_userInfo.h"
#import "cls_Tool.h"
@implementation GAME01RenWuPlayGroundView

- (instancetype)initWithFrame:(CGRect)frame withshifoudiren:(BOOL)f
{
    self = [super init];
    if (self) {
        self.shifoudiren = f;
        GAME01PlayGroundPlayGround *play = [[GAME01PlayGroundPlayGround alloc] init];
        [self addSubview:play];
        self.playView = play;
        self.flag = true;

        if (f == true) {
            for (int i = 0; i<[[self boss]count]; i++) {
                GAME01renwu *renwu = [[GAME01renwu alloc]initWithDiren:f];
                renwu.model = [self boss][i];
//                renwu.backgroundColor = [UIColor blueColor];
                [play addSubview:renwu];
            }

        }else
        {
            
            NSMutableArray *p = [cls_zr fun_getzr];
            NSMutableArray *temp = [NSMutableArray array];
            while (1) {
                int aff =  rand_num(0, p.count-1);
                cls_zr *z =  p[aff];
                if (![temp containsObject:z]) {
                    [temp addObject:z];
                }
                
                if (temp.count == 1)
                {
                    break;;
                }
                
                
            }
            
            
            
            for (int i = 0; i<temp.count; i++) {
                
                
                
                
                
                
                
                GAME01renwu *renwu = [[GAME01renwu alloc]initWithDiren:f];
                renwu.model =temp[i];
                [play addSubview:renwu];
                
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chuzhan:)];
                [renwu addGestureRecognizer:tap];
            }
        }
        
   
        
        
        
    }
    return self;
}

- (void)touchanimateRight:(GAME01renwu *)cardVie
{
    __weak typeof(self) weakSelf = self;


        [UIView animateWithDuration:0.5 animations:^{
        cardVie.frame = CGRectMake(cardVie.frame.origin.x-RPX(80), cardVie.frame.origin.y ,  cardVie.frame.size.width,  cardVie.frame.size.height);
        } completion:^(BOOL finished) {
            weakSelf.lastView = cardVie;
            
            [[NSNotificationCenter defaultCenter]postNotificationName:gongjiWillwangchengNote object:nil userInfo:@{@"KaiPaiBackgroundView":weakSelf,@"KaPaiView":cardVie}];

        }];
        
    
    
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)touchanimateLeft:(GAME01renwu *)cardVie
{
 
    if (self.flag ==false) {

        [UIView animateWithDuration:0.5 animations:^{
        cardVie.frame = CGRectMake(cardVie.frame.origin.x+RPX(80),  cardVie.frame.origin.y,  cardVie.frame.size.width,  cardVie.frame.size.height);
        } completion:^(BOOL finished) {
            self.lastView = cardVie;
            [[NSNotificationCenter defaultCenter]postNotificationName:gongjiWillwangchengNote object:nil userInfo:@{@"KaiPaiBackgroundView":self,@"KaPaiView":cardVie}];
        }];

    }
  

    
}

- (void)beigongjikouxue
{
    UIView *BGView = self.playView;

    int a =  0 + arc4random()%((BGView.subviews.count-1) - 0 + 1);
    GAME01renwu *c =  nil;
    c = BGView.subviews[a];

        

        
           //随机减少血量
    
    int b =  25+ arc4random()%(30 - 0 + 1);
   

    if (c.diren ==false) {
        //我方扣血数量

        b =  10+ arc4random()%(15 - 0 + 1);

    }else
    {
        //敌人扣血数量


        b =  5+ arc4random()%(10 - 0 + 1);

    }
 
    
    
    
    c.LastValue =  c.model.pro_xueliang;
    c.model.pro_xueliang = c.model.pro_xueliang - b;
    [c kouxue:c.model];
          

    [[NSNotificationCenter defaultCenter]postNotificationName:gongjiDIDwangchengNote object:nil userInfo:@{@"KaiPaiBackgroundView":self,@"KaPaiView":c}];
    
    
}


- (void)chuzhan:(UITapGestureRecognizer *)tap
{
    if (self.flag == false) {
        return;;
    }
    GAME01renwu *cardVie = (GAME01renwu *)[tap view];
 
    self.flag = false;
    
    if (self.shifoudiren == false) {
        
        [self touchanimateLeft:cardVie];

    }else
    {
//        [self touchanimatDown:cardVie];
    }

}
- (NSMutableArray *)boss
{
    NSMutableArray *boss = [NSMutableArray array];
    
    {
        
        cls_zr *zhuangbei = [[cls_zr alloc] init];
        zhuangbei.pro_xueliang = 100;
        zhuangbei.pro_zuidaxueliang = 100;
        zhuangbei.pro_imagename = @"角色1";
        zhuangbei.pro_name = @"boos";
        [boss addObject:zhuangbei];
    }
    
    

    
    
    return boss;;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.playView.frame =self.bounds;
    if (self.shifoudiren) {
   
        for (int i =0; i<self.playView.subviews.count; i++)
        {
            GAME01renwu *renwu = self.playView.subviews[i];
            if (i==0) {
                renwu.frame = CGRectMake(RPX(0), RPY(0), RPX(450), RPY(600));
            }

        }
    }else
    {
        for (int i =0; i<self.playView.subviews.count; i++)
        {
            GAME01renwu *renwu = self.playView.subviews[i];

            if (i==0) {

                renwu.frame = CGRectMake(RPX(0), RPY(0), RPX(450), RPY(600));
            }
        }
    }
    
}

@end
