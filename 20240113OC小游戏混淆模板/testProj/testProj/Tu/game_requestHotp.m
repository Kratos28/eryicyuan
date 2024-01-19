//
//  po.m
//  01game
//
//  Created by 9130Game on 2023/8/22.
//

#import "game_requestHotp.h"
#import "Game_ParameterModel.h"
#import <UIKit/UIKit.h>
#import <AdSupport/ASIdentifierManager.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import "ManageTool.h"
@implementation game_requestHotp
+ (void)xyxm_getWithURLStr:(NSString *)URLString  parameters:(id __nullable )parameters  success:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure
{
    
    
    @synchronized(self) {
        
        
        NSString *json = xyxm_convertDictionaryToJsonString(parameters);
        NSLog(@"参数 %@",parameters);
        NSString *urlString = [NSString stringWithFormat:@"%@%@",URLString,json];
        
        

        
        NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

        NSURL *url = [NSURL URLWithString:encodedString];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                // 处理返回的数据
                NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                
              NSDictionary *dict =   [game_requestHotp xyxm_dictionaryFromJSONString:responseString];
              if ([dict isKindOfClass:[NSDictionary class]])
              {
                  success(dict);
              }
                
            }
        }];
        [dataTask resume];
        
    }
    
   
}


+ (NSDictionary *)xyxm_dictionaryFromJSONString:(NSString *)jsonString {
    NSError *error;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    if (error) {
//        NSLog(@"Error parsing JSON string: %@", error.localizedDescription);
        return nil;
    }
    
    return dictionary;
}

NSString *xyxm_convertDictionaryToJsonString(NSDictionary *dictionary) {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    
    if (!jsonData) {
//        NSLog(@"Error converting dictionary to JSON string: %@", error.localizedDescription);
        return nil;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}


+ (void)xyxm_hotpoint:(NSSet *)touches
{

    UITouch *touch = touches.anyObject;
    CGPoint touchPoint = [[touches  anyObject] locationInView:touch.view];

    [self xyxm_point_requst:[NSValue valueWithCGPoint:touchPoint]];
}


+ (void)xyxm_point_requst:(NSValue *)touchPoint1{
    if (![ManageTool wly_SwitchAccount]) {
        return;
    }
    CGPoint touchPoint =  [touchPoint1 CGPointValue];
    

    
    
    NSString *ext1 = [NSString stringWithFormat:@"%d,%d|%d,%d",(int)touchPoint.x,(int)touchPoint.y,(int)[[UIScreen mainScreen]bounds].size.width,(int)[[UIScreen mainScreen]bounds].size.height];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    
   NSString *event =  [Game_ParameterModel plistText:@"strca_event"];
    NSString *fsgame_id =  [Game_ParameterModel plistText:@"str_game_id1"];
    NSString *sfsgame_pkg =  [Game_ParameterModel plistText:@"str_game_pkg1"];
    NSString *sdfspartner_id =  [Game_ParameterModel plistText:@"str_partner_id1"];
    NSString *uuid =  [Game_ParameterModel plistText:@"str_uuid1"];
    NSString *afanet_type =  [Game_ParameterModel plistText:@"str_net_type1"];
    NSString *client =  [Game_ParameterModel plistText:@"param_str_client"];
    NSString *platform =  [Game_ParameterModel plistText:@"str_platform"];

    NSString *h5Logurl =  [Game_ParameterModel plistText:@"str_h5Log"];
    
    [param setValue:@"hot_point" forKey:event];
    [param setValue:[Game_ParameterModel plistText:@"str22_gameid_str"] forKey:fsgame_id];
    [param setValue:[Game_ParameterModel plistText:@"str22_gamepkg_str"] forKey:sfsgame_pkg];
    [param setValue:@"2" forKey:sdfspartner_id];
    [param setValue:[ManageTool wly_getdeviceIDFA12] forKey:uuid];
    [param setValue:@"wifi" forKey:afanet_type];
    [param setValue:[Game_ParameterModel plistText:@"param_str_client"] forKey:client];
    [param setValue:@"ios" forKey:platform];
    [param setValue:ext1 forKey:@"ext1"];
    [game_requestHotp xyxm_getWithURLStr:[NSString stringWithFormat:@"%@?type=event&data=",h5Logurl] parameters:param success:^(id  _Nonnull responseObject) {
        
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}


@end
