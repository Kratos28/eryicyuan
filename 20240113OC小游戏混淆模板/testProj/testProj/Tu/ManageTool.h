
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block)\
    if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(dispatch_get_main_queue())) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }
#endif

//#ifdef DEBUG
//#define NSLog(...) NSLog(__VA_ARGS__)
//#else
//#define NSLog(...) /* */
//#endif

//A8H5本地缓存方案测试
//#define DEF_idCode @"88"
//#define DEF_pkgCode @"mrjq_mrqxlxxmrios_AMI"  //版本号 1.0.0
////https://cdn-tkcyj.sh9130.com/lizi/h1/index.html

//九州
#define DEF_idCode [Game_ParameterModel plistText:@"str22_gameid_str"]
#define DEF_pkgCode [Game_ParameterModel plistText:@"str22_gamepkg_str"]

#define DEF_SCREEN_W [UIScreen mainScreen].bounds.size.width
#define DEF_SCREEN_H [UIScreen mainScreen].bounds.size.height
#define DEF_Interface_Orientation 1     //1是竖屏，  2是横屏适配X,-44  3是横屏不适配x，全屏

@interface ManageTool : NSObject

/** 加载闪退策略2，设置崩溃接口：result[@"data"] ;1-判断崩溃 ，0-进入游戏 */
//+ (void)wly_callRequestType:(void (^)(NSDictionary *result))suc fail:(void (^)(id error))fail;
//+ (NSString *)wlyfive_md5String:(NSString *)string;
//首次安装
+ (NSString*)wly_isInstall;
+ (void)wly_setInstall;
+ (BOOL)wly_isIphoneX;
+ (BOOL)wly_SwitchAccount;
//get webview frame
+ (CGRect)wly_getWebViewFrame;
+ (NSString *)wly_getLinkString:(NSString *)mainmain ;

+ (NSString *)wly_getdeviceIDFV1;
+ (NSString *)wly_getdeviceIDFA12;
+ (NSString *)wly_getDeviceModelString11;
+ (NSString *)wly_wgMdsseet3dcam1;
+ (NSString *)wly_locationwDate1;
+ (NSString *)wly_getDeviceVersion;
+ (NSString *)wly_getFirst_Device;
+ (UIInterfaceOrientation )wly_statusBarOrientation;
+ (NSString *)wly_mimeTypeWithExtension:(NSString *)sourceExtension;
//+ (NSString *)plistText:(NSString *)key;
//+ (NSData *)plistText1:(NSData *)key;

+ (void)wlypChainisSave:(NSString *)service withKeData:(id)data;
+ (id)wlyChenload:(NSString *)service;
+ (void)wlyDdelete:(NSString *)service;

//+ (void)requst_ASAAttribution:(void(^)(NSString *))complete;
//+ (void)wly_getIDFAFirstAInstall:(void(^)(NSString *)) complete;
///编码
//+ (NSString *)wlyfive_base64Encode:(NSString *)data ;
/////解码
//+ (NSString *)wlyfive_base64Dencode:(NSString *)data;

+ (BOOL)wlyfive_isHttpLink:(NSString *)var_Check_web1scheme;

@end

