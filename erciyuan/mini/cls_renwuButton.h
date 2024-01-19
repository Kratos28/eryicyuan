//
//  cls_renwuButton.h
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_renwuButton : UIButton

@property(nonatomic,assign)BOOL wofang;
- (instancetype)initWithFrame:(CGRect)frame withwofang:(BOOL)wofang;


- (void)fun_texiaocompletion:(void(^)(void))completion;
@end

NS_ASSUME_NONNULL_END
