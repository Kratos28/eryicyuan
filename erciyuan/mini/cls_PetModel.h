//
//  cls_PetModel.h
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cls_PetModel : NSObject <NSCoding, NSSecureCoding>
@property (nonatomic,copy) NSString * pro_petdesc;
@property (nonatomic,assign) int16_t pro_petfangyu;
@property (nonatomic,assign) int16_t pro_petgold;
@property (nonatomic,assign) int16_t pro_petATK;
@property (nonatomic,copy) NSString *pro_petimageName;
@property (nonatomic,assign) int16_t pro_petlv;
@property (nonatomic,copy) NSString *pro_petname;
@property (nonatomic,assign) BOOL pro_petown;
@property (nonatomic,assign) int16_t pro_petspeed;
@property (nonatomic,assign) int16_t pro_petstatus;
@property (nonatomic,assign) int16_t pro_petHP;
@end

NS_ASSUME_NONNULL_END
