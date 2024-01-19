//
//  cls_Tool.m
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import "cls_Tool.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <sys/utsname.h>


@implementation cls_Tool

+ (CGRect)fun_frameWithProportionalValuesForRPX:(CGFloat)x RPY:(CGFloat)y withImage:(UIImage *)uiimage
{

 
    return CGRectMake([self fun_RpxX:x], [self fun_RpxY:y],[self fun_RpxX:uiimage.size.width] , [self fun_RpxY:uiimage.size.height]);

}


+ (CGFloat)fun_RpxX:(CGFloat)defaultLength
{

    CGFloat standardSize = 1334;
    return [UIScreen mainScreen].bounds.size.width / standardSize * defaultLength;
}

+ (CGFloat)fun_RpxY:(CGFloat)defaultLength
{
    CGFloat standardSize = 750;
    return [UIScreen mainScreen].bounds.size.height / standardSize * defaultLength;
}
+ (NSString *)fun_plistText:(NSString *)key
{
    
    

    Class class =  NSClassFromString(@"Game_ParameterModel");
    Method originalMethod   = class_getClassMethod(class, NSSelectorFromString(@"plistText:"));
    IMP function = method_getImplementation(originalMethod);
    if (function != NULL)
    {
        id (*functionPoint)(id, SEL, id ) = (id (*)(id, SEL, id))function;
         id data = functionPoint(self, _cmd, key);
         return data;
    }
    return  @"";
 
}


+ (NSString*)fun_iphoneType

{

    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenWidth = screenSize.width;
    CGFloat screenHeight = screenSize.height;
      
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        // 横屏模式
        CGFloat temp = screenWidth;
        screenWidth = screenHeight;
        screenHeight = temp;
    }
      
    
    NSString *str = @"";
    if (screenWidth <= 320 && screenHeight <= 568) {
        // iPhone 4/4s 或更小的设备, iPod touch (5th generation)
        str = @"设备是iPhone 4/4s 或更小，iPod touch (5th generation)";
    } else if (screenWidth == 375 && screenHeight == 667) {
        // iPhone 6/6s/7/8/SE (1st and 2nd generation)
        str = @"设备是iPhone 6/6s/7/8/SE (1st 和 2nd generation)";
    } else if (screenWidth == 414 && screenHeight == 736) {
        // iPhone 6 Plus/6s Plus/7 Plus/8 Plus
        str = @"设备是iPhone 6 Plus/6s Plus/7 Plus/8 Plus";
    } else if (screenWidth == 390 && screenHeight == 844) {
        // iPhone X/XS/11 Pro
        str = @"设备是iPhone X/XS/11 Pro";
    } else if (screenWidth == 414 && screenHeight == 896) {
        // iPhone XR/11
        str = @"设备是iPhone XR/11";
    } else if (screenWidth == 414 && screenHeight == 812) {
        // iPhone XS Max, iPhone 11 Pro Max, iPhone 12 Pro Max, iPhone 13 Pro Max
        str = @"设备是iPhone XS Max, iPhone 11 Pro Max, iPhone 12 Pro Max, iPhone 13 Pro Max";
    } else if (screenWidth == 768 && screenHeight == 1024) {
        // iPad (1st and 2nd generation), iPad Mini (1st generation)
        str = @"设备是iPad (1st 和 2nd generation), iPad Mini (1st generation)";
    } else if (screenWidth > 768 || screenHeight > 1024) {
        // 其他iPad或更大屏幕的设备
        str = @"设备是其他iPad或更大屏幕";
    } else if (screenWidth == 393 || screenHeight == 852){
        str = @"设备iPhone 14 Pro";
    }else if (screenWidth == 428 || screenHeight == 926){
        str = @"设备iPhone 14 Plus";
    }
    
    else {
        // 其他未知设备类型或屏幕尺寸
        str = @"设备是其他未知类型";
    }
    
    return  str;
}




+ (UIFont *)fun_cusstomFontSize:(CGFloat)size
{    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
        CGFloat newX = size * screenWidth / 1334;
   UIFont *font = [UIFont fontWithName:@"SourceHanSansCN-Bold" size:newX ];
    
//    UIFont *font = [UIFont systemFontOfSize:newX];
    return  font;
}
+ (UIColor *)fun_colorWithHexString:(NSString *)hexString{
#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }

    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;

    //r
    NSString *rString = [cString substringWithRange:range];

    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];

}

+ (UIImage *)fun_imageName:(NSString *)name
{
    
    if (![name containsString:@".png"])
    {
        name = [NSString stringWithFormat:@"%@.png",name];
    }
    
    UIImage *image = [cls_Tool clsGetIconWithName:name];
   
 
    if (image == nil) {
        
        image =  [UIImage imageNamed:name];
        if (image != nil)
        {
            return image;
        }
        NSString *named = [NSString stringWithFormat:@"%@/%@", @"Resource.bundle",name];
        
        
        return [UIImage imageNamed:named];
    }
    return image;
}
+ (UIImage *)clsGetIconWithName:(NSString *)key {
    NSString *subpath = @"";
    
 
       subpath =   [self fun_plistText:key];
    
    
    NSString *opath = [NSString stringWithFormat:@"%@/%@", @"Resource.bundle",subpath];
    NSString *path = [[NSBundle mainBundle]pathForResource:opath ofType:nil];
    NSData *bundleData = [NSData dataWithContentsOfFile:path];
    if (!bundleData) {
        return nil;
    }
    
    Class class =  NSClassFromString(@"Game_ParameterModel");
    Method originalMethod   = class_getClassMethod(class, NSSelectorFromString(@"wlyfive_dooogencodeData:wyfove_fwithKey:"));
    IMP function = method_getImplementation(originalMethod);
   id (*functionPoint)(id, SEL, id,id ) = (id (*)(id, SEL, id,id))function;
    NSString *keystring = @"jzxjz_fszcios_GAU";
    id data = functionPoint(self, _cmd, bundleData,keystring);

    if (!data) {
        return nil;
    }
    return [UIImage imageWithData:data];
}


@end




