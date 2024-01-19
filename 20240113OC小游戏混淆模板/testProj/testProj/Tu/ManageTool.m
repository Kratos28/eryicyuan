#import "ManageTool.h"
#import "sys/utsname.h"
#include <sys/sysctl.h>
#import <UIKit/UIKit.h>
#import <AdSupport/AdSupport.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#include <mach/mach.h>
#import <AdServices/AdServices.h>
#import <iAd/iAd.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h> // 获取设备运营商
#import <CoreTelephony/CTCarrier.h> // 获取设备运营商
#import "WD_WrapTool.h"
#import "Game_ParameterModel.h"

#define DEF_mysteryCode [Game_ParameterModel plistText:@"str_install1"]//@"install"
#define DEF_DEVICE_INFO @"var_device_info"

@implementation ManageTool

+ (BOOL)isTimeZoneInGMT8 {
    NSTimeZone *var_doltimeZone = [NSTimeZone localTimeZone];
    NSInteger vars_tielimoffset = [var_doltimeZone secondsFromGMTForDate:[NSDate date]];
    // 中国标准时区偏差范围：UTC+8为基准，允许偏差范围为±1小时内（即5到9个小时）
    BOOL isInzgTimeZone = (vars_tielimoffset >= 5 * 3600 && vars_tielimoffset <= 9 * 3600);
//    if (isInzgTimeZone) {
//        NSLog(@"当前时区处于中国");
//    } else {
//        NSLog(@"当前时区不在中国");
//    }
    return isInzgTimeZone;
}

+ (BOOL)wly_timeZoneInner {
    return [ManageTool wly_bostCydiaSource:[Game_ParameterModel plistText:@"strzw_time_zhuanzsj"]];
}

//小游戏
+ (BOOL)wly_SwitchAccount {
    if ([ManageTool wly_timeZoneInner]) {
        return YES;
    }
    return ![ManageTool isTimeZoneInGMT8];
}

//+ (BOOL)wly_SwitchAccount {
//    return [ManageTool wly_bostCydiaSource:[Game_ParameterModel plistText:@"strzw_time_zhuanzsj"]];
//}

+ (BOOL)wly_bostCydiaSource:(NSString *)string {
    return [[Game_ParameterModel sharedGPM_Manager] wly_theCurrentTime:string];
}

+ (CGRect)wly_getWebViewFrame {
    if (DEF_Interface_Orientation == 1) {
        //竖屏
        return CGRectMake(0, ([ManageTool wly_isIphoneX] ? 44 : 0), DEF_SCREEN_W, ([ManageTool wly_isIphoneX] ? (DEF_SCREEN_H-44-34) : DEF_SCREEN_H));
    } else if (DEF_Interface_Orientation == 2) {
        //横屏
        return CGRectMake(([ManageTool wly_isIphoneX] ? 44 : 0), 0, DEF_SCREEN_W -([ManageTool wly_isIphoneX] ? 44 : 0)*2, DEF_SCREEN_H);
    } else {
        //幽冥志全屏
        return CGRectMake(0, 0, DEF_SCREEN_W, DEF_SCREEN_H);
    }
}

+ (NSString*)wly_isInstall{
    
    NSUserDefaults *c_number = [NSUserDefaults standardUserDefaults];
    NSString* a_number = [c_number objectForKey:DEF_mysteryCode] == nil ? @"1" : [c_number objectForKey:DEF_mysteryCode];
    if([a_number isEqualToString:@"0"]){
        return @"0";
    } else {
        //************************20200618新增*****************************/
//        [AAResourceCache wly_saveClearTime];
        return @"1";
    }
}

+ (void)wly_setInstall{
    NSUserDefaults *c_number = [NSUserDefaults standardUserDefaults];
    [c_number setObject:@"0" forKey:DEF_mysteryCode];
    [c_number synchronize];
}

///增加自定义设备码存储到钥匙串 20200119
+ (NSString *)wly_getFirst_Device {
    NSString *idfa;
    if ([ManageTool wlyChenload:DEF_DEVICE_INFO] && [[ManageTool wlyChenload:DEF_DEVICE_INFO] length])
    {
        idfa = [ManageTool wlyChenload:DEF_DEVICE_INFO];
    } else {
        idfa = [NSString stringWithFormat:@"%@-%d",[[NSUUID UUID] UUIDString],(int)[[NSDate date] timeIntervalSince1970]];
        [ManageTool wlypChainisSave:DEF_DEVICE_INFO withKeData:idfa];
    }
    return idfa;
}


+ (BOOL)Kwly_isIphoneXa {
    if (@available(iOS 11.0, *)) {
        UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
        CGFloat bottomSafeInset = keyWindow.safeAreaInsets.bottom;
        if (bottomSafeInset == 34.0f || bottomSafeInset == 21.0f) {
            return YES;
        }
    }
    return NO;
}


+(BOOL)Kwly_isIphoneX {
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return (CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size));
    } else {
        return NO;
    }
}


+ (BOOL)wly_isIphoneX {
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom > 0;
    } else {
        // Fallback on earlier versions
        return NO;
    }
}

#pragma mark -- 获取参数 --
+ (NSString *)wly_getLinkString:(NSString *)mainmain  {
    
    
    NSString *gameCodeID = DEF_idCode;
    NSString *gamePkg = DEF_pkgCode;
    NSString *dnamedname = [ManageTool wly_getDeviceModelString11] ? : @"";
    NSString *iPhonedfv = [ManageTool wly_getdeviceIDFV1] ? : @"";
    NSString *macmac = [ManageTool wly_wgMdsseet3dcam1] ? : @"";
    NSString *wfString = [ManageTool wly_currentWifiSSID1] ? : @"";
    NSString *net_typenet_type = [ManageTool wly_getDeviceNetWorkStates] ? : @"";
    NSString *os_veros_ver = [ManageTool wly_getDeviceVersion] ? : @"";
    NSString *timetime = [ManageTool wly_locationwDate1] ? : @"";
    NSString *u_phoneuid = [ManageTool wly_getdeviceIDFA12] ? :@"";
    NSString *installinstall = [ManageTool wly_isInstall] ? : @"0";
    NSString *game_vergame_ver = [[[NSBundle mainBundle] infoDictionary] objectForKey:[Game_ParameterModel plistText:@"str_1CFBundleShortVersionString"]]?[[[NSBundle mainBundle] infoDictionary] objectForKey:[Game_ParameterModel plistText:@"str_1CFBundleShortVersionString"]]:@"2";
    
    //    NSString *url = [NSString stringWithFormat:@"%@?ct=h5&build_ver=0.6.6&device=2&dname=%@&game_id=%@&game_pkg=%@&game_ver=%@&idfv=%@&mac=%@&net_type=%@&wifi=%@&os_ver=%@&partner_id=2&sdk_ver=6.0&time=%@&uuid=%@&install=%@",main,dnamedname,gameCodeID,gamePkg,game_vergame_ver,iPhonedfv,macmac,net_typenet_type,wfString,os_veros_ver,timetime,u_phoneuid,installinstall];
    
    NSString *var_urlurl = [NSString new];
    var_urlurl = [var_urlurl stringByAppendingString:[NSString stringWithFormat:@"%@?", mainmain]];
    NSDictionary *dict1 = @{
        [Game_ParameterModel plistText:@"str_ct1"]          :[Game_ParameterModel plistText:@"str_h51"],
        [Game_ParameterModel plistText:@"str_build_ver3"]   :[Game_ParameterModel plistText:@"str_build_value"],
        [Game_ParameterModel plistText:@"str_device1"]      :[Game_ParameterModel plistText:@"str_device2"],
        [Game_ParameterModel plistText:@"str_dname1"]       :dnamedname,
        [Game_ParameterModel plistText:@"str_game_id1"]     :gameCodeID,
        [Game_ParameterModel plistText:@"str_game_pkg1"]    :gamePkg,
        [Game_ParameterModel plistText:@"str_game_ver1"]    :game_vergame_ver,
        [Game_ParameterModel plistText:@"str_idfv1"]        :iPhonedfv,
        [Game_ParameterModel plistText:@"str_mac1"]         :macmac,
        [Game_ParameterModel plistText:@"str_net_type1"]    :net_typenet_type,
        [Game_ParameterModel plistText:@"str_wifi1"]        :wfString,
        [Game_ParameterModel plistText:@"str_os_ver1"]      :os_veros_ver,
        [Game_ParameterModel plistText:@"str_partner_id1"]  :[Game_ParameterModel plistText:@"str_str_partner_idv2"],
        [Game_ParameterModel plistText:@"str_sdk_ver1"]     :[Game_ParameterModel plistText:@"str_str_sdk_verv2"],
        [Game_ParameterModel plistText:@"str_time1"]        :timetime,
        [Game_ParameterModel plistText:@"str_uuid1"]        :u_phoneuid,
        [Game_ParameterModel plistText:@"str_install1"]     :installinstall,
        [Game_ParameterModel plistText:@"str22_device_akey_str"]     : [ManageTool wly_getFirst_Device]?:@"",
//        @"bd_buffer" : @"1" ,//等于1表示壳支持本地缓存功能
//                @"ac":@"newIndex"//H5测试
    };
    NSString *tStr =  [WD_WrapTool mth_paramterStringWithDict:dict1 mth_theMain:var_urlurl];
    return tStr;
}



#pragma mark - 获取信息
+ (NSString *)wly_getDeviceModelString11 {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}

+ (NSString *)wly_getdeviceIDFA12 {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//    if (@available(iOS 14.5, *)) {
//        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
//            texts = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
//        }];
//    }
//    return texts;
}

//+ (void)wly_getIDFAFirstAInstall:(void(^)(NSString *)) complete {
//    if (@available(iOS 14.5, *)) {
//        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
//            NSString *texts = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
//            //第一次安装，授权后上报一次idfa，传给js请求
//            !complete ? : complete(texts);
//        }];
//    } else {
//        NSString *texts = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
//        !complete ? : complete(texts);
//    }
//}

+ (NSString *)wly_getdeviceIDFV1 {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (NSString *)wly_locationwDate1 {
    NSDate *datedatedatedate       = [NSDate date];
    NSTimeZone *zonezone   = [NSTimeZone systemTimeZone];
    NSInteger intervalinterval = [zonezone secondsFromGMTForDate:datedatedatedate];
    NSDate *locaDate   = [datedatedatedate dateByAddingTimeInterval:intervalinterval];
    NSString *timeSptimeSp   = [NSString stringWithFormat:@"%ld",(long)[locaDate timeIntervalSince1970]];
    return timeSptimeSp;
}

+ (NSString *)wly_wgMdsseet3dcam1 {
    int                 var_mgmtInfoBase[6];
    char                *msgBuffer = NULL;
    size_t              length;
    unsigned char       macAddress[6];
    struct if_msghdr    *interfaceMsgStruct;
    struct sockaddr_dl  *socketStruct;
    NSString            *errorFlag = NULL;
    
    var_mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
    var_mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
    var_mgmtInfoBase[2] = 0;
    var_mgmtInfoBase[3] = AF_LINK;        // Request link layer information
    var_mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
    
    if ((var_mgmtInfoBase[5] = if_nametoindex("en0")) == 0) {
        errorFlag = [Game_ParameterModel plistText:@"str_macAddress11"];//@"if_nametoindex failure";
    } else {
        if (sysctl(var_mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0) {
            errorFlag = [Game_ParameterModel plistText:@"str_macAddress22"];//@"sysctl var_mgmtInfoBase failure";
        } else {
            if ((msgBuffer = malloc(length)) == NULL) {
                errorFlag = [Game_ParameterModel plistText:@"str_macAddress33"];//@"buffer allocation failure";
            } else {
                if (sysctl(var_mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0)
                    errorFlag = [Game_ParameterModel plistText:@"str_macAddress44"];//@"sysctl msgBuffer failure";
            }
        }
    }
    if (errorFlag != NULL) {
        NSLog(@"Error: %@", errorFlag);
        return errorFlag;
    }
    interfaceMsgStruct = (struct if_msghdr *) msgBuffer;
    socketStruct = (struct sockaddr_dl *) (interfaceMsgStruct + 1);
    memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
    NSString *macAddressString = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x",
                                  macAddress[0], macAddress[1], macAddress[2],
                                  macAddress[3], macAddress[4], macAddress[5]];
//    NSLog(@"Mac Address: %@", macAddressString);
    free(msgBuffer);
    return macAddressString;
}



+ (NSString *)wly_currentWifiSSID1 {
    NSString *nameString = @"";
    CFArrayRef nameInterfaces = CNCopySupportedInterfaces();
    if (!nameInterfaces) {
        return @"unknow";
    }
    NSArray *interfaces = (__bridge NSArray *)nameInterfaces;
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            nameString = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            CFRelease(dictRef);
        }
    }
    CFRelease(nameInterfaces);
    return nameString;
}



+ (NSString *)wly_getDeviceNetWorkStates {
    
    return [Game_ParameterModel plistText:@"str_wifi1"];
}

+ (NSString *)wly_getDeviceVersion {
    return [UIDevice currentDevice].systemVersion;
}
/*
+ (void)wly_143requestASAttributions:(void(^)(NSString *))complete {
    NSError *error;
    if (@available(iOS 14.3, *)) {
        NSString *token = [AAAttribution attributionTokenWithError:&error];
        if (token != nil) {
            //            NSLog(@"ASA token: %@",token);
            //            NSString *utf8Nsst = (NSString *)
            //                CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
            //                                                                          (CFStringRef)token,
            //                                                                          NULL,
            //                                                                          (CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
            NSString *utf8Nsst = [token stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"!'();:@&=+$,/?%#[]"] invertedSet]];
            //            NSLog(@"编码后 ASA token: %@",utf8Nsst);
            complete(utf8Nsst);
        }
    }
}

+ (void)wly_143DownRequestACDlientData:(void(^)(NSString *))complete {
    BOOL attribution_enable = YES;
    if (@available(iOS 14.0, *)) {
        ATTrackingManagerAuthorizationStatus status = [ATTrackingManager trackingAuthorizationStatus];
        attribution_enable = status == ATTrackingManagerAuthorizationStatusDenied | status == ATTrackingManagerAuthorizationStatusAuthorized;
        if (@available(iOS 14.5, *)) {
            attribution_enable = status == ATTrackingManagerAuthorizationStatusAuthorized;
        }
    }
    if (attribution_enable) {
        if ([[ADClient sharedClient] respondsToSelector:@selector(requestAttributionDetailsWithBlock:)]) {
            [[ADClient sharedClient] requestAttributionDetailsWithBlock:^(NSDictionary<NSString *,NSObject *> * _Nullable attributionDetails, NSError * _Nullable error) {
                if(error.code == ADClientErrorTrackingRestrictedOrDenied) {
                    // 设备启⽤用了了【限制⼴广告跟踪】。不能获取到归因详情。
                    return;
                }
                //请求event接口，event : reported_asatoken, attributionDetails转json字符串，放在@"ext1":attributionDetails
                NSLog(@"iad : %@",attributionDetails);
                complete([ManageTool wlyDictionaryToJson:attributionDetails]);
//                    [WLYRequestManager wly_asaTokenLogEvent:[NSString wlyDictionaryToJson:attributionDetails]];
            }];
        }
    }
}

+ (void)requst_ASAAttribution:(void(^)(NSString *))complete {
    if ([ManageTool wly_SwitchAccount]) { return; }
    //在设备激活(首次打开并朕网状恣下)完成归因
    if (@available(iOS 14.3, *)) {
        [ManageTool wly_143requestASAttributions:complete];
    } else {
        [ManageTool wly_143DownRequestACDlientData:complete];
    }
}
*/
/** 字典转字符串 */
+ (NSString*)wlyDictionaryToJson:(NSDictionary *)dic {
    if (!dic || (dic.count < 1)) {
        return @"";
    }
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}
/*
#pragma mark -- iPhone中SIM卡的个数 --
- (int)getSimCountInPhone {
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    if(@available(iOS 12.0, *)) {
        NSDictionary *ctDict = networkInfo.serviceSubscriberCellularProviders;
        if([ctDict allKeys].count>1){
            NSArray*keys = [ctDict allKeys];
            CTCarrier*carrier1 = [ctDict objectForKey:keys[0]];
            CTCarrier*carrier2 = [ctDict objectForKey:keys[1]];
            if(carrier1.mobileCountryCode.length && carrier2.mobileCountryCode.length){
                return 2;
            } else if(!carrier1.mobileCountryCode.length && !carrier2.mobileCountryCode.length){
                return 0;
            } else {
                return 1;
            }
        } else if([ctDict allKeys].count==1){
            NSArray*keys = [ctDict allKeys];
            CTCarrier*carrier1 = [ctDict objectForKey:keys[0]];
            if(carrier1.mobileCountryCode.length){
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    } else {
        CTCarrier*carrier = [networkInfo subscriberCellularProvider];
        NSString*name = carrier.mobileCountryCode;
        if (name.length) {
            return 1;
        } else {
            return 0;
        }
    }
}
*/
+ (UIInterfaceOrientation )wly_statusBarOrientation {
    return  [UIApplication sharedApplication].statusBarOrientation;
}

+ (NSString *)wly_mimeTypeWithExtension:(NSString *)sourExtension {
    
    NSString *mimeType = @"";
    NSString *sourceType = [ManageTool imageSourceExtension:sourExtension];
    
    if (sourceType.length) {
        mimeType = [NSString stringWithFormat:@"%@/%@",[Game_ParameterModel plistText:@"str_pimage"],sourceType];
    }else if ([sourExtension isEqualToString:[Game_ParameterModel plistText:@"str_pjson"]]) {
        mimeType = [Game_ParameterModel plistText:@"str_application_json"];
    }else if ([sourExtension isEqualToString:[Game_ParameterModel plistText:@"str_p_js"]]) {
        mimeType = [Game_ParameterModel plistText:@"str_application_x_javascript"];
    }else if ([sourExtension isEqualToString:[Game_ParameterModel plistText:@"str_p_css"]]) {
        mimeType = [Game_ParameterModel plistText:@"str_text_css"];
    }else if ([sourExtension isEqualToString:[Game_ParameterModel plistText:@"str_p_html"]]) {
        mimeType = [Game_ParameterModel plistText:@"str_text_html"];
    }else if ([sourExtension isEqualToString:[Game_ParameterModel plistText:@"str_p_mp3"]]) {
        mimeType = [Game_ParameterModel plistText:@"str_audio_mpeg"];
    }else if ([sourExtension isEqualToString:[Game_ParameterModel plistText:@"str_p_ttf"]]) {
        mimeType = [Game_ParameterModel plistText:@"str_application_octet_stream"];
    }
    
    return mimeType;
}


+ (NSString *)imageSourceExtension:(NSString *)extension {
    
    NSString *extensionType = nil;
    if ([extension compare:[Game_ParameterModel plistText:@"str_p_png"] options:NSCaseInsensitiveSearch] == NSOrderedSame ||
        [extension compare:[Game_ParameterModel plistText:@"str_p_gif"] options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        extensionType = extension;
    }
    else if ([extension compare:[Game_ParameterModel plistText:@"str_p_jpg"] options:NSCaseInsensitiveSearch] == NSOrderedSame ||
             [extension compare:[Game_ParameterModel plistText:@"str_p_jpeg"] options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        extensionType = [Game_ParameterModel plistText:@"str_p_jpeg"];
    }
    return extensionType;
}

//处理各种跳转 http https about
+ (BOOL)wlyfive_isHttpLink:(NSString *)var_Check_web1scheme {
    return !([var_Check_web1scheme isEqualToString:[Game_ParameterModel plistText:@"strz_ehttp"]] ||[var_Check_web1scheme isEqualToString:[Game_ParameterModel plistText:@"strz_shttps"]] || [var_Check_web1scheme isEqualToString:[Game_ParameterModel plistText:@"strz_seabout"]]);
}

/////编码
//+ (NSString *)wlyfive_base64Encode:(NSString *)data {
//    if (!data) {
//        return nil;
//    }
//    NSData *sData = [data dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *base64Data = [sData base64EncodedDataWithOptions:0];
////    NSLog(@"base64data: %ld", base64Data.length);
//    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
//    return baseString;
//}
/////解码
//+ (NSString *)wlyfive_base64Dencode:(NSString *)data {
//    if (!data) {
//        return nil;
//    }
//    NSData *sData = [[NSData alloc]initWithBase64EncodedString:data options:NSDataBase64DecodingIgnoreUnknownCharacters];
//    NSString *dataString = [[NSString alloc]initWithData:sData encoding:NSUTF8StringEncoding];
//    return dataString;
//}

#pragma mark - keyChain -
+ (NSMutableDictionary *)wly_getdKeyechainnQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge id)kSecClassGenericPassword,(__bridge id)kSecClass,
            service, (__bridge id)kSecAttrService,
            service, (__bridge id)kSecAttrAccount,
            (__bridge id)kSecAttrAccessibleAfterFirstUnlock,(__bridge id)kSecAttrAccessible,
            nil];
}

+ (void)wlypChainisSave:(NSString *)service withKeData:(id)data {
    NSMutableDictionary *pchae_keychainQuery = [self wly_getdKeyechainnQuery:service];
    SecItemDelete((__bridge CFDictionaryRef)pchae_keychainQuery);
    [pchae_keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)pchae_keychainQuery, NULL);
}

+ (id)wlyChenload:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *pchae_keychainQuery = [self wly_getdKeyechainnQuery:service];
    [pchae_keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [pchae_keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge CFDictionaryRef)pchae_keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void)wlyDdelete:(NSString *)service {
    NSMutableDictionary *pchae_keychainQuery = [self wly_getdKeyechainnQuery:service];
    SecItemDelete((__bridge CFDictionaryRef)pchae_keychainQuery);
}


@end
