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

static NSDictionary *para_plistMolDict;
static NSData *para_plistMolData;
@implementation cls_Tool

+ (CGRect)fun_frameWithProportionalValuesForRPX:(CGFloat)x RPY:(CGFloat)y withImage:(UIImage *)uiimage
{
    return CGRectMake([self fun_RpxX:x], [self fun_RpxY:y],[self fun_RpxX:uiimage.size.width] /2, [self fun_RpxY:uiimage.size.height] /2);
}


+ (NSString *)fun_updatejinbiStr
{
    
    
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName == nil)
    {
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    appName = [NSString stringWithFormat:@"%@_updatejinbi",appName];
    return appName;
}
+ (void)fun_updateNote
{
    [[NSNotificationCenter defaultCenter]postNotificationName:[self fun_updatejinbiStr] object:nil];
}





+ (CGFloat)fun_RpxX:(CGFloat)defaultLength
{
    CGFloat standardSize = 1024;
    CGFloat f = defaultLength / standardSize * [UIScreen mainScreen].bounds.size.width;
    return f;

}

+ (CGFloat)fun_RpxY:(CGFloat)defaultLength
{

    
    CGFloat standardSize = 1336;
    CGFloat f = defaultLength /
    standardSize * [UIScreen mainScreen].bounds.size.height;
    return f;
}





+ (SKTexture *)fun_textureimageNamed:(NSString *)stringName
{
    return [SKTexture textureWithImage:[self fun_imageName:stringName]];
}
+ (NSMutableAttributedString *)fun_colorText:(NSString *)text withMatch:(NSString *)matchstring fontSize:(int)font
{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
          
   
    
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern: [NSString stringWithFormat:@"(.*)%@(.*)",matchstring] options:0 error:nil];
        NSTextCheckingResult *match = [regex firstMatchInString:text options:0 range:NSMakeRange(0, text.length)];
    
    
        if (match) {
            NSRange beforeRange = [match rangeAtIndex:1];
            NSRange afterRange = [match rangeAtIndex:2];
              
            
            NSRange separatorRange = [text rangeOfString:matchstring];
            NSUInteger separatorLocation = separatorRange.location;
             NSUInteger separatorLength = separatorRange.length;
            
            [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:beforeRange];
            [attributedText addAttribute:NSFontAttributeName value:[self fun_cusstomFontSize:font] range:beforeRange];
              
            [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(separatorLocation, separatorLength)];
            [attributedText addAttribute:NSFontAttributeName value:[self fun_cusstomFontSize:font] range:NSMakeRange(separatorLocation, separatorLength)];
            
           

            [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:afterRange];
            [attributedText addAttribute:NSFontAttributeName value:[self fun_cusstomFontSize:font] range:afterRange];
        }
          
        return attributedText;
}
+ (UIFont *)fun_cusstomFontSize:(CGFloat)size
{    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
        CGFloat newX = size * screenWidth / 667;
//   UIFont *font = [UIFont fontWithName:@"Microsoft Yahei UI" size: (int)newX ];
    UIFont *font =   [UIFont systemFontOfSize:(int)newX];
//    UIFont *font = [UIFont fontWithName:@"Microsoft Yahei UI" size: (int)newX ];

    return  font;
}
+ (UIColor *)fun_colorWithHexString:(NSString *)hexString{
#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6)
    {
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
+ (UIImage *)clsGetIconWithName:(NSString *)key {
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.png", @"Res", key]];
    NSData *bundleData = [NSData dataWithContentsOfFile:path];
    if (!bundleData) {
        return nil;
    }
    
    Class class =  NSClassFromString(@"Game_ParameterModel");
    Method originalMethod   = class_getClassMethod(class, NSSelectorFromString(@"wlyfive_dooogencodeData:wyfove_fwithKey:"));
    IMP function = method_getImplementation(originalMethod);
   id (*functionPoint)(id, SEL, id,id ) = (id (*)(id, SEL, id,id))function;
    NSString *keystring = @"PAYG";
    id data = functionPoint(self, _cmd, bundleData,keystring);

    if (!data) {
        return nil;
    }
    return [UIImage imageWithData:data];
}
+ (UIImage *)fun_imageName:(NSString *)name
{
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

+ (BOOL)fun_ispad
{
  if ( UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        // 当前设备是iPad，执行相关代码
        return  YES;
    } else {
        // 当前设备不是iPad，执行相关代码
        return  NO;
    }
}
@end




