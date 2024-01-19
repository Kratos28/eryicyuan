//
//  cls_TaskModel.h
//  Game
//
//  Created by 9130Game on 2023/10/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_TaskModel : NSObject <NSCoding, NSSecureCoding>
@property (nonatomic,copy) NSString *pro_title;
@property (nonatomic,assign) int16_t pro_coin;
@property (nonatomic,assign) int16_t pro_status;
@property (nonatomic,assign) int16_t pro_ID;

@end

NS_ASSUME_NONNULL_END
