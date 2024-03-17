//
//  GAME01renwu.m
//  game01_Example
//
//  Created by K on 2022/3/21.
//  Copyright © 2022 Kratos. All rights reserved.
//

#import "GAME01renwu.h"
#import "cls_zr.h"
#import "cls_Tool.h"
#import "ProgressView.h"
@interface GAME01renwu()
@property (nonatomic,strong) UIImageView *bgImage;;
@end

@implementation GAME01renwu

- (instancetype)initWithDiren:(BOOL)diren
{
    self  = [super init];
    if (self) {
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = true;
        
        
        self.diren = diren;
//        self.layer.borderWidth = 1;
//        self.layer.masksToBounds = true;
//        self.layer.borderColor = diren ==NO ? [UIColor cyanColor].CGColor:[UIColor redColor].CGColor;
        self.proview = [[ProgressView alloc] init];
        self.proview.barColor = [UIColor blackColor];
        if (diren) {
            self.proview.trackColor = [UIColor colorWithRed:244/255.0 green:139/255.0 blue:47/255.0 alpha:1];

        }else
        {
            self.proview.trackColor = [UIColor colorWithRed:241/255.0 green:70/255.0 blue:134/255.0 alpha:1];

        }
        
        self.proview.progress =100;
        [self addSubview:self.proview];
        
        
        
        
        self.bgImage = [[UIImageView alloc] init];

        [self addSubview:self.bgImage];
        
        
 
    }
    return self;
}


- (void)kouxue:(cls_zr *)hero;
{
    
    float value = (float)(hero.pro_xueliang) / hero.pro_zuidaxueliang;
    value =  value * 100;
    self.LastValue = hero.pro_xueliang;

    float flo =  (float) (float)((float)value /(float)100);
    
    
    self.proview.progress = value;
     CGRect rect = self.frame;

    [UIView animateWithDuration:0.1 animations:^{
        self.frame =   CGRectMake(rect.origin.x+5, rect.origin.y+5, rect.size.width, rect.size.height);


    } completion:^(BOOL finished) {
        self.frame = rect;

    }];
 

    if (hero.pro_xueliang<=0) {
        [self performSelector:@selector(Dead) withObject:nil afterDelay:0.5];
    }
}
- (void)Dead
{
    [self removeFromSuperview];
}

- (void)setModel:(cls_zr *)model
{
    _model = model;
    self.bgImage.image = [UIImage imageNamed:model.pro_imagename];
}

- (void)layoutSubviews
{
    
    
    [super layoutSubviews];
    self.proview.frame = CGRectMake(0, 0, self.frame.size.width,  RPY(20));;
    self.bgImage.frame = CGRectMake(0, RPY(40), self.frame.size.width,  self.frame.size.height);

    
}


@end
