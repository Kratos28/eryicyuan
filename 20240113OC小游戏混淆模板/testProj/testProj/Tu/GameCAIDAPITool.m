//
//  GameCAIDAPITool.m
//  testProj
//
//  Created by nine on 2022/11/10.
//  Copyright © 2022 天罡奇缘. All rights reserved.
//

#import "GameCAIDAPITool.h"
#import "ManageTool.h"
#include <sys/sysctl.h>
#import <sys/mount.h>
#import <sys/stat.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "Game_networkManager.h"
#import "Game_ParameterModel.h"

static NSString *osString;

static time_t wlyc_bootSecTime(){
    
    struct timeval boottime; size_t len = sizeof(boottime); int mib[2] = { CTL_KERN, KERN_BOOTTIME };
    
    if( sysctl(mib, 2, &boottime, &len, NULL, 0) < 0 ) { return 0; } return boottime.tv_sec;
    
}

@implementation GameCAIDAPITool
//5.1.1 设备启动时间
+ (NSString *)wlyc_bootTimeInSec {
    return [NSString stringWithFormat:@"%ld",wlyc_bootSecTime()];
    
}

//5.1.2 国家
+ (NSString *)wlyc_countryCode {
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode]; return countryCode;
}

//5.1.3 语言
+(NSString *)wlyc_language {
    NSString *language; NSLocale *locale = [NSLocale currentLocale];
    if ([[NSLocale preferredLanguages] count] > 0) {
        language = [[NSLocale preferredLanguages]objectAtIndex:0];
    } else {
        language = [locale objectForKey:NSLocaleLanguageCode];
    }
    return language;
}

//5.1.4 设备名称
//注：iOS16 通过 UIDevice 获取设备名称时，默认会返回 iPhone 而不再是“xx 的 iPhone”。广协侧已评估过此 影响，不需要因此额外去申请权限获取真实的设备名称。这里接入方按照现有的接入方式使用即可，请勿额外申 请权限，不影响 CAID 的设备识别度。如果自身业务需求要获取“xx 的 iPhone”真实设备名，那在请求 CAID 接 口时，iOS16 设备也请替换为“iPhone”保持统一，后续我们会通过升级算法版本来优化。
+ (NSString *)wlyc_deviceName {
    if ([[[UIDevice currentDevice] name] length] == 0) {
        return nil;
    }
    //常⽤的MD5 32位⼩写算法，不再单独给出
    return [Game_networkManager wlyfive_md5String:[[UIDevice currentDevice] name]];
}

//常⽤的MD5 32位⼩写算法，不再单独给出 return [CAIDMD5Util md5HexDigest:[[UIDevice currentDevice] name]]; }

//5.1.5 系统版本
+(NSString *)wlyc_systemVersion {
    return [[UIDevice currentDevice] systemVersion];
    
}

//5.1.6 设备 Machine
+ (NSString *)wlyc_machine {
    NSString *machine = wlyc_getSystemHardwareByName(wlyc_SIDFAMachine);
    return machine == nil ? @"" : machine;
}

static const char *wlyc_SIDFAMachine = "hw.machine";
static NSString *wlyc_getSystemHardwareByName(const char *typeSpecifier) {
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    NSString *results = [NSString stringWithUTF8String:answer];
    free(answer); return results;
    
}

//5.1.7 运营商
+(NSString* )wlyc_carrierInfo {
#if TARGET_IPHONE_SIMULATOR
    return @"SIMULATOR";
#else
    static dispatch_queue_t _queue;
    static dispatch_once_t once;
    dispatch_once(&once, ^{ _queue = dispatch_queue_create([[NSString stringWithFormat:@"com.carr.%@" , self] UTF8String], NULL);
    });
    __block NSString * carr = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    dispatch_async(_queue, ^(){
        CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
        CTCarrier *carrier = nil;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 12.1) {
            if ([info respondsToSelector:@selector (serviceSubscriberCellularProviders)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
                NSArray *carrierKeysArray = [info.serviceSubscriberCellularProviders .allKeys sortedArrayUsingSelector:@selector(compare:)]; carrier = info.serviceSubscriberCellularProviders [carrierKeysArray.firstObject]; if (!carrier.mobileNetworkCode) { carrier = info.serviceSubscriberCellularProviders [carrierKeysArray.lastObject]; }
#pragma clang diagnostic pop
                
            } } if(!carrier) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                carrier = info.subscriberCellularProvider;
#pragma clang diagnostic pop
                
            }
        
        if (carrier != nil) { NSString *networkCode = [carrier mobileNetworkCode]; NSString *countryCode = [carrier mobileCountryCode]; if (countryCode && [countryCode isEqualToString:@"460"] && networkCode ) { if ([networkCode isEqualToString:@"00"] || [networkCode isEqualToString:@"02"] || [networkCode isEqualToString:@"07"] || [networkCode isEqualToString:@"08"]) {
            
            carr= @"中国移动";
            
        } if ([networkCode isEqualToString:@"01"] || [networkCode isEqualToString:@"06"] || [networkCode isEqualToString:@"09"]) {
            
            carr= @"中国联通";
            
        } if ([networkCode isEqualToString:@"03"] || [networkCode isEqualToString:@"05"] || [networkCode isEqualToString:@"11"]) { carr= @"中国电信";
            
        } if ([networkCode isEqualToString:@"04"]) {
            
            carr= @"中国卫通";
            
        } if ([networkCode isEqualToString:@"20"]) {
            
            carr= @"中国铁通";
            
        } }else { carr = [carrier.carrierName copy]; }
            
        } if (carr.length <= 0) { carr = @"unknown"; } dispatch_semaphore_signal(semaphore);
        
    }); dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, 0.5* NSEC_PER_SEC); dispatch_semaphore_wait(semaphore, t); return [carr copy];
#endif
    
}

//5.1.8 物理内存容量
+ (NSString *)wlyc_memory {
    return [NSString stringWithFormat:@"%lld", [NSProcessInfo processInfo] .physicalMemory];
    
}

//5.1.9 硬盘容量
+(NSString *)wlyc_disk {
    int64_t space = -1;
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (!error) {
        space = [[attrs objectForKey:NSFileSystemSize] longLongValue];
        
    }
    if(space < 0) {
        space = -1;
        
    }
    return [NSString stringWithFormat:@"%lld",space];
}

//5.1.10 系统更新时间
+(NSString *)wlyc_sysFileTime {
    NSString *result = nil;
    NSString *information = @"L3Zhci9tb2JpbGUvTGlicmFyeS9Vc2VyQ29uZmlndXJhdGlvblByb2ZpbGVzL1B1YmxpY0luZm8vTUNNZXRhLnBsaXN0";
    NSData *data=[[NSData alloc]initWithBase64EncodedString:information options:0];
    NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:dataString error:&error];
    if (fileAttributes) {
        id singleAttibute = [fileAttributes objectForKey:NSFileCreationDate];
        if ([singleAttibute isKindOfClass:[NSDate class]]) {
            NSDate *dataDate = singleAttibute;
            result = [NSString stringWithFormat:@"%f",[dataDate timeIntervalSince1970]];
        }
    }
    return result;
}

//5.1.11 设备 Model
static const char *wlyc_SIDFAModel = "hw.model";
+(NSString *)wlyc_model {
    NSString *model = wlyc_getSystemHardwareByName(wlyc_SIDFAModel);
    return model == nil ? @"" : model;
    
}

//5.1.12 时区
+ (NSString *)wlyc_timeZone {
    NSInteger offset = [NSTimeZone systemTimeZone].secondsFromGMT; return [NSString stringWithFormat:@"%ld",(long)offset];
    
}

//5.1.13 mnt_id
+ (NSString *)wlyc_mntId {
    struct statfs buf;
    statfs("/", &buf);
    char* prefix = "com.apple.os.update-"; if(strstr(buf.f_mntfromname, prefix)) {
        return [NSString stringWithFormat:@"%s", buf.f_mntfromname+strlen(prefix)];
    }
    return @"";
}

//5.1.14 设备初始化时间
+ (NSString *)wlyc_fileInitTime {
    struct stat info;
    int result = stat("/var/mobile", &info); if (result != 0) {
        return @""; }
    struct timespec time = info.st_birthtimespec;
    NSString *initTime = [NSString stringWithFormat:@"%ld.%09ld",time.tv_sec, time.tv_nsec];
    return initTime;
}

//获取签名sign
+ (NSString *)wlyc_signWithParams:(NSDictionary *)paramDict {
    
    NSMutableString *signString = [GameCAIDAPITool wlyc_joinStringWithDictionary:paramDict isSort:YES];
    [signString appendString:[Game_ParameterModel plistText:@"str22_signkey_str"]];
    return signString;
}

+ (NSMutableString *)wlyc_joinStringWithDictionary:(NSDictionary *)paramDict isSort:(BOOL)isSort {
    
    NSMutableString *string = [NSMutableString string];
    NSArray *keys = paramDict.allKeys;
    if (isSort) {
        keys = [paramDict.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
    }
    for (NSString *key in keys) {
        if (string.length == 0) {
            [string appendFormat:@"%@=%@",key,paramDict[key]];
        }else {
            [string appendFormat:@"&%@=%@",key,paramDict[key]];
        }
    }
    return string;
}

///请求caid
+ (void)wly_callRequestCaid:(void(^)(NSString *))complete {
    
    //    NSString *str = @"http://adapi.sh9130.com/?ct=caid&ac=info&";
    NSString *tmp = @"?ct=caid&ac=info&";
    NSString *str = [NSString stringWithFormat:@"%@%@", [Game_ParameterModel plistText:@"stre_path_adapi"], tmp];
    NSString *idfvString = [ManageTool wly_getdeviceIDFV1];
    NSDictionary *dict = @{[Game_ParameterModel plistText:@"str_idfv1"]: idfvString,
                           [Game_ParameterModel plistText:@"str_game_pkg1"]: DEF_pkgCode,
                           [Game_ParameterModel plistText:@"strca_boot_sec_time"]: [GameCAIDAPITool wlyc_bootTimeInSec]?:@"",
                           [Game_ParameterModel plistText:@"strca_country_code"]: [GameCAIDAPITool wlyc_countryCode]?:@"",
                           [Game_ParameterModel plistText:@"strca_language"]: [GameCAIDAPITool wlyc_language]?:@"",
                           [Game_ParameterModel plistText:@"strca_device_name"]: [GameCAIDAPITool wlyc_deviceName]?:@"",
                           [Game_ParameterModel plistText:@"strca_system_version"]: [GameCAIDAPITool wlyc_systemVersion]?:@"",
                           [Game_ParameterModel plistText:@"strca_machine"]: [GameCAIDAPITool wlyc_machine]?:@"",
                           [Game_ParameterModel plistText:@"strca_carrier_info"]: [GameCAIDAPITool wlyc_carrierInfo]?:@"",
                           [Game_ParameterModel plistText:@"strca_memory"]: [GameCAIDAPITool wlyc_memory]?:@"",
                           [Game_ParameterModel plistText:@"strca_disk"]: [GameCAIDAPITool wlyc_disk]?:@"",
                           [Game_ParameterModel plistText:@"strca_sys_file_time"]: [GameCAIDAPITool wlyc_sysFileTime]?:@"",
                           [Game_ParameterModel plistText:@"strca_model"]: [GameCAIDAPITool wlyc_model]?:@"",
                           [Game_ParameterModel plistText:@"strca_time_zone"]: [GameCAIDAPITool wlyc_timeZone]?:@"",
                           [Game_ParameterModel plistText:@"strca_mnt_id"]: [GameCAIDAPITool wlyc_mntId]?:@"",
                           [Game_ParameterModel plistText:@"strca_device_init_time"]: [GameCAIDAPITool wlyc_fileInitTime]?:@""
    };
    NSString *var_urlurl = [GameCAIDAPITool wlyc_joinStringWithDictionary:dict isSort:NO];
    str = [str stringByAppendingFormat:@"%@", var_urlurl];
    
    [GameCAIDAPITool wlyc_requestWithURL:str suc:^(NSDictionary *result) {
        NSLog(@"result: %@", result);
        if (result[@"data"] && [result[@"data"] isKindOfClass:[NSDictionary class]] && [result[@"state"] intValue] == 1) {
            if (result[@"data"][@"caid"]) {
                osString = [NSString stringWithFormat:@"%@", result[@"data"][@"caid"]];
                !complete ? : complete(osString);
                [GameCAIDAPITool wlyc_requestLog:nil fail:nil];
            }
        }
    } fail:^(id error) {
        NSLog(@"error: %@", error);
    }];
}

///上报caid
+ (void)wlyc_requestLog:(void (^)(NSDictionary *result))suc fail:(void (^)(id error))fail {
    NSString *mt = @"?method=user.log&";
//    NSString *str = @"https://event.sh9130.com/?method=user.log&";
    NSString *str = [NSString stringWithFormat:@"%@%@", [Game_ParameterModel plistText:@"stre_path_event"], mt];
    NSDictionary *dict = [GameCAIDAPITool wlyc_newlogEventParams];
    NSString *var_urlurl = [GameCAIDAPITool wlyc_joinStringWithDictionary:dict isSort:YES];
    str = [str stringByAppendingFormat:@"%@", var_urlurl];
    NSLog(@"str= %@", str);
    [GameCAIDAPITool wlyc_requestWithURL:str suc:^(NSDictionary *result) {
        NSLog(@"result: %@", result);
    } fail:^(id error) {
        NSLog(@"error: %@", error);
    }];
}

//公共参数
+ (NSDictionary *)wlyc_publicParameter {
    
    NSString *para_macString = [ManageTool wly_wgMdsseet3dcam1];
    NSString *netStateString = @"";
    NSString *dnameString = [ManageTool wly_getDeviceModelString11] ? : @"";
    NSString *idfvString = [ManageTool wly_getdeviceIDFV1] ? : @"";
    NSString *idfaString = [ManageTool wly_getdeviceIDFA12] ? :@"";
    NSString *para_wifiString = @"";
    NSString *deviceVString = [ManageTool wly_getDeviceVersion] ? : @"";
    NSString *timeString = [ManageTool wly_locationwDate1] ? : @"";
    NSString *deviceKey = [ManageTool wly_getFirst_Device] ? : @"";
    NSString *game_vergame_ver = [[[NSBundle mainBundle] infoDictionary] objectForKey:[Game_ParameterModel plistText:@"str_1CFBundleShortVersionString"]]? : @"1";
    
    NSDictionary *sign_dict =@{[Game_ParameterModel plistText:@"str_game_id1"]: DEF_idCode,
                               [Game_ParameterModel plistText:@"str_game_pkg1"] : DEF_pkgCode,
                               [Game_ParameterModel plistText:@"str_partner_id1"] : @"2",
                               [Game_ParameterModel plistText:@"strca_ad_code"] : [Game_ParameterModel plistText:@"strca_appstore"],
                               [Game_ParameterModel plistText:@"str_uuid1"] : idfaString,
                               [Game_ParameterModel plistText:@"str_idfv1"] : idfvString,
                               [Game_ParameterModel plistText:@"str_dname1"] : dnameString,
                               [Game_ParameterModel plistText:@"str_mac1"] : para_macString,
                               [Game_ParameterModel plistText:@"str_net_type1"] : netStateString,
                               [Game_ParameterModel plistText:@"str_wifi1"] : para_wifiString,
                               [Game_ParameterModel plistText:@"str_os_ver1"] : deviceVString,
                               [Game_ParameterModel plistText:@"str_sdk_ver1"] : [Game_ParameterModel plistText:@"str_str_sdk_verv2"],
                               [Game_ParameterModel plistText:@"str_game_ver1"] : game_vergame_ver,
                               [Game_ParameterModel plistText:@"str_device1"] : @"2",
                               [Game_ParameterModel plistText:@"str_time1"] : timeString,
                               [Game_ParameterModel plistText:@"str22_device_akey_str"] : deviceKey,
                               [Game_ParameterModel plistText:@"strca_oaid"] : osString
    };
    return sign_dict;
}

+ (NSDictionary *)wlyc_newlogEventParams {
    
    NSDictionary *dict = @{
        [Game_ParameterModel plistText:@"strca_event"] : [Game_ParameterModel plistText:@"strca_reported_caid"],
        [Game_ParameterModel plistText:@"strca_type"] : [Game_ParameterModel plistText:@"strca_event"]
    };
    NSMutableDictionary *parameDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [parameDict addEntriesFromDictionary:[GameCAIDAPITool wlyc_publicParameter]];
    NSString *signString = [GameCAIDAPITool wlyc_signWithParams:parameDict];
    NSString *signMD5 = [Game_networkManager wlyfive_md5String:signString];
    parameDict[@"sign"] = signMD5;
    return parameDict;
}

+ (void)wlyc_requestWithURL:(NSString *)urlString suc:(void (^)(NSDictionary *result))suc fail:(void (^)(id error))fail {
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:(NSURLRequestReloadIgnoringLocalCacheData) timeoutInterval:15];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data && (error == nil)) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
            if (dict) {
                suc(dict);
            } else {
                fail(error);
            }
        } else {
            fail(error);
        }
    }];
    [task resume];
}

/*
- (NSString *)deviceInfo {
    // 设备公共信息按照字典结构，特定字段名称存储
   NSDictionary *deviceInfo = @{ @"bootTimeInSec":@"1595643553", @"countryCode":@"CN",
   @"language":@"zh-Hans-CN", @"deviceName":@"e910dddb2748c36b47fcde5dd720eec1", @"systemVersion":@"14.0", @"machine":@"iPhone10,3",
   @"carrierInfo":@"中国移动",
   @"memory":@"3955589120", @"disk":@"63900340224", @"sysFileTime":@"1595214620.383940", @"model":@"D22AP", @"timeZone":@"28800"
   };
    
    // JSON序列化
    NSError *error = nil;
    NSString *str = [[NSString alloc] initWithData: [NSJSONSerialization dataWithJSONObject:deviceInfo options:0 error:&error] encoding:NSUTF8StringEncoding];
    // RSA公钥加密转Base64，其中RSA加密方法可以见下。
    // result即为最终上报给服务端的encrypted_device_info信息。
    NSString *result = [self encrypt:str];
    
    return result;
}


// RSA加密并Base64
-(NSString *)encrypt:(NSString *)plainText {
    //该pubKeyRef为分配得到的公钥X50格式9字符串中获得的SecKeyRef，
    //获得SecKeyRef的方法如下getPublicKey
    size_t cipherBufferSize = SecKeyGetBlockSize(pubKeyRef);
    uint8_t *cipherBuffer = NULL;
    cipherBuffer = malloc(cipherBufferSize * sizeof(uint8_t)); memset((void *)cipherBuffer, 0*0, cipherBufferSize);
    NSData *plainTextBytes = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    int blockSize = (int)cipherBufferSize-11; // 这个地方比较重要是加密数组长度
    int numBlock = (int)ceil([plainTextBytes length] / (double)blockSize); NSMutableData *encryptedData = [[NSMutableData alloc] init];
    for (int i=0; i<numBlock; i++) {
        int bufferSize = (int)MIN(blockSize,[plainTextBytes length]-i*blockSize); NSData *buffer = [plainTextBytes subdataWithRange:
                                                                                                    NSMakeRange(i * blockSize, bufferSize)]; OSStatus status = SecKeyEncrypt(pubKeyRef,
                                                                                                                                                                             if (status == noErr)
                                                                                                                                                                             kSecPaddingPKCS1,
                                                                                                                                                                             (const uint8_t *)[buffer bytes],
                                                                                                                                                                             [buffer length],
                                                                                                                                                                             cipherBuffer,
                                                                                                                                                                             &cipherBufferSize);
        {
            NSData *encryptedBytes = [[NSData alloc]
                                      initWithBytes:(const void *)cipherBuffer
                                      length:cipherBufferSize]; } [encryptedDataappendData:encryptedBytes];
        else
        { returnnil; }}
    if (cipherBuffer)
    {   free(cipherBuffer);
    }NSString *encrypotoResult = [encryptedData base64EncodedStringWithOptions: NSDataBase64EncodingEndLineWithLineFeed];
    return encrypotoResult;
}

// RSA解密示例
- (NSData * )decode:(NSData * )cipherData {
size_t keySize = SecKeyGetBlockSize(actionPubKeyRef) * sizeof(uint8_t); double totalLength = [cipherData length];
size_t blockSize = keySize;
int blockCount = ceil(totalLength / blockSize);
NSMutableData * plainData = [NSMutableData data]; for (int i = 0; i < blockCount; i++) {
NSUInteger loc = i * blockSize;
long dataSegmentRealSize = MIN(blockSize, totalLength - loc); NSData * dataSegment = [cipherData subdataWithRange:NSMakeRange(loc,
dataSegmentRealSize)];
unsigned char * plainBuffer = malloc(keySize+128); memset(plainBuffer, 0, keySize+128);
OSStatus status = noErr;
size_t plainBufferSize = keySize+128;
status = SecKeyDecrypt(actionPubKeyRef, kSecPaddingNone,
                                [dataSegment bytes],
                                dataSegmentRealSize,
                                plainBuffer,
                                &plainBufferSize
                                );
         if(status != noErr){
            free(plainBuffer);
return nil; }
NSData * data = [[NSData alloc] initWithBytes:plainBuffer length:plainBufferSize];
NSData * startData = [data subdataWithRange:NSMakeRange(0,1)];
// 开头应该是0001但是原生解出来之后把开头的00忽略了
if ([[self convertDataToHexStr:startData] isEqualToString:@"01"]) { Byte flag[] = {0x00};
NSRange startRange = [data rangeOfData:[NSData dataWithBytes:flag
length:1] options:NSUInteger s = startRange.location + startRange.length; if (startRange.location != NSNotFound && s < data.length) {
data = [data subdataWithRange:NSMakeRange(s, data.length - s)]; }
}
         [plainData appendData:data];
         free(plainBuffer);
      }
      return plainData;
}
-(SecKeyRef)getPublicKey{
    @try {
SecCertificateRef myCertificate;
SecKeyRef result = nil;
NSData *certificateData = [[NSData alloc] initWithBase64EncodedString:pub_key options: NSDataBase64DecodingIgnoreUnknownCharacters];
// pub_key即为分配得到的公钥证书串
 
myCertificate = SecCertificateCreateWithData(kCFAllocatorDefault, (__bridge CFDataRef)certificateData);
if(myCertificate != NULL){
SecPolicyRef myPolicy = SecPolicyCreateBasicX509(); SecTrustRef myTrust;
OSStatus status = SecTrustCreateWithCertificates(myCertificate,
myPolicy,&myTrust);
SecTrustResultType trustResult;
if (status == noErr) {
} status = SecTrustEvaluate(myTrust, &trustResult);
if(status == noErr){
} result=SecTrustCopyPublicKey(myTrust);
            CFRelease(myCertificate);
            CFRelease(myPolicy);
            if(myTrust){
} } CFRelease(myTrust);
} return result;
@catch (NSException *exception) {
NSLog(@"exception : %@",exception); }
}
*/
@end
