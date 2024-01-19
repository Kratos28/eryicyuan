//
//  po.h
//  01game
//
//  Created by 9130Game on 2023/8/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface game_requestHotp : NSObject
+ (void)xyxm_getWithURLStr:(NSString *)URLString  parameters:(id __nullable )parameters  success:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure;

+ (void)xyxm_hotpoint:(NSSet *)touche;
@end

NS_ASSUME_NONNULL_END
