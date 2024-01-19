//
//  cls_Tool.h
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
#define updatejinbi @"pro_updatejinbi"
#define siwangNoteName @"pro_siwangNote"
#define xiayiguanStr @"xiayiguan"
#define  xiayiguanNote   [[NSNotificationCenter defaultCenter]postNotificationName:xiayiguanStr object:nil]
#define  updateNote   [[NSNotificationCenter defaultCenter]postNotificationName:updatejinbi object:nil]


#define RPX(x) [cls_Tool fun_RpxX:(x)]
#define RPY(y) [cls_Tool fun_RpxY:(y)]

@interface cls_Tool : NSObject
+ (UIFont *)fun_cusstomFontSize:(CGFloat)size;
+ (UIColor *)fun_colorWithHexString:(NSString *)hexString;
+ (UIImage *)fun_imageName:(NSString *)name;
+ (CGRect)fun_frameWithProportionalValuesForRPX:(CGFloat)x RPY:(CGFloat)y withImage:(UIImage *)uiimage;
+ (CGFloat)fun_RpxX:(CGFloat)defaultLength;
+ (CGFloat)fun_RpxY:(CGFloat)defaultLength;
+ (NSString*)fun_iphoneType;
+ (NSString *)fun_plistText:(NSString *)key;

@end




NS_ASSUME_NONNULL_END
