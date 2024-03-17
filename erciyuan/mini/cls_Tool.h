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
#define gongjiWillwangchengNote @"gongjiWillwangchengNote"
#define gongjiDIDwangchengNote @"gongjiDIDwangchengNote"

#define siwang @"siwang"
typedef void(^blockokcancel)(int a);
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


static inline int rand_num(int min,int max)
{
    return min + arc4random()%(max - min + 1);
}


static __attribute__((always_inline,unused)) void alertWithok(UIViewController *vc, NSString *title,NSString *ok,NSString *cancel,blockokcancel com)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *avc = [UIAlertController alertControllerWithTitle:title message:title preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:ok style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (com != nil) {
                com(1);
            }
            
        }];
        
        
        UIAlertAction *cancel1 = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (com != nil) {
                com(0);
            }
            
        }];
        [avc addAction:action];
        [avc addAction:cancel1];

        
        
        
        if (@available(iOS 13.0, *)) {
               avc.modalPresentationStyle = UIModalPresentationFullScreen;
           }
        
        [vc presentViewController:avc animated:YES completion:nil];
    });
}


NS_ASSUME_NONNULL_END
