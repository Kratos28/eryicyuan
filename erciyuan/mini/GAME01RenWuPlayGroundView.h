//
//  GAME01RenWuPlayGroundView.h
//  game01_Example
//
//  Created by K on 2022/3/21.
//  Copyright © 2022 Kratos. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  GAME01PlayGroundPlayGround, GAME01renwu;
NS_ASSUME_NONNULL_BEGIN

@interface GAME01RenWuPlayGroundView : UIView
- (instancetype)initWithFrame:(CGRect)frame withshifoudiren:(BOOL)f;
@property (nonatomic,assign)BOOL shifoudiren;
@property (nonatomic,strong)GAME01PlayGroundPlayGround *playView;
@property (nonatomic,assign) BOOL flag;; //判断我方是否能攻击
@property (nonatomic,strong) GAME01renwu *lastView;
- (void)beigongjikouxue;
- (void)touchanimateLeft:(GAME01renwu *)cardVie;
- (void)touchanimateRight:(GAME01renwu *)cardVie;

@end

NS_ASSUME_NONNULL_END
