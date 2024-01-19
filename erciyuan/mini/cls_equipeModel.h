//
//  cls_zhuangbei.h
//  Game
//
//  Created by 9130Game on 2023/10/26.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@interface cls_equipeModel : NSObject<NSCoding, NSSecureCoding>
@property (nonatomic,copy) NSString * pro_desc;
@property (nonatomic,assign) int16_t pro_fangyu;
@property (nonatomic,assign) int16_t pro_gold;
@property (nonatomic,assign) int16_t pro_gongji;
@property (nonatomic,copy) NSString *pro_imageName;
@property (nonatomic,assign) int16_t pro_lv;
@property (nonatomic,copy) NSString *pro_name;
@property (nonatomic,assign) BOOL pro_own;
@property (nonatomic,assign) int16_t pro_shanbi;
@property (nonatomic,assign) int16_t pro_status;
@property (nonatomic,assign) int16_t pro_xueliang;


@end

NS_ASSUME_NONNULL_END
