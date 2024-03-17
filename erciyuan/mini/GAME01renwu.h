//
//  GAME01renwu.h
//  game01_Example
//
//  Created by K on 2022/3/21.
//  Copyright © 2022 Kratos. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class cls_zr,ProgressView;
@interface GAME01renwu : UIView

@property (nonatomic,strong) ProgressView *proview;
@property (nonatomic,assign) float LastValue;
@property (nonatomic,strong)cls_zr *model;
@property (nonatomic,assign)bool diren;
- (void)kouxue:(cls_zr * )hero;
- (instancetype)initWithDiren:(BOOL)diren;

@end

NS_ASSUME_NONNULL_END
