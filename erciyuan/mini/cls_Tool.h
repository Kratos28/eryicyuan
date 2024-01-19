//
//  cls_Tool.h
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "cls_ViewNameTag.h"
#import "cls_UIViewFrameCategory.h"
#import "cls_buttonBlock.h"
NS_ASSUME_NONNULL_BEGIN

#ifndef weakify
#define weakify(VAR) __weak __typeof__(VAR) __weak_ ## VAR = (VAR)
#endif

#ifndef strongify
#define strongify(VAR) __strong __typeof__(VAR)  VAR = (__weak_ ## VAR)
#endif

#ifndef viewFrameBlock
#define viewFrameBlock(var,block)\
{\
weakify(self);\
var.frameBlock = ^(UIView *b){ \
dispatch_async(dispatch_get_main_queue(), ^{\
__unused strongify(self);\
    block(b);\
});\
};\
}
#endif





#ifndef buttonBlock
#define buttonBlock(var,block)\
{\
weakify(self);\
[var addTapBlock:^(UIButton * _Nonnull btn) { \
dispatch_async(dispatch_get_main_queue(), ^{\
__unused strongify(self);\
block(btn);\
});\
}];\
}
#endif


#define RPX(x) [cls_Tool fun_RpxX:(x)]
#define RPY(y) [cls_Tool fun_RpxY:(y)]

@interface cls_Tool : NSObject
+ (UIFont *)fun_cusstomFontSize:(CGFloat)size;
+ (UIColor *)fun_colorWithHexString:(NSString *)hexString;
+ (UIImage *)fun_imageName:(NSString *)name;
+ (CGRect)fun_frameWithProportionalValuesForRPX:(CGFloat)x RPY:(CGFloat)y withImage:(UIImage *)uiimage;
+ (CGFloat)fun_RpxX:(CGFloat)defaultLength;
+ (CGFloat)fun_RpxY:(CGFloat)defaultLength;
+ (BOOL)fun_ispad;
+ (NSString *)fun_updatejinbiStr;
+ (void)fun_updateNote;
+ (NSMutableAttributedString *)fun_colorText:(NSString *)text withMatch:(NSString *)matchstring fontSize:(int)font;
@end




NS_ASSUME_NONNULL_END
