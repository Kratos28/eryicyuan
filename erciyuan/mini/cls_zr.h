//
//  cls_zr.h
//  erciyuan
//
//  Created by k on 2024/3/17.
//

#import "cls_baseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface cls_zr : cls_baseModel
@property (nonatomic,copy) NSString * pro_name;
@property (nonatomic,assign) int16_t pro_xueliang;
@property (nonatomic,assign) int16_t pro_zuidaxueliang;
@property (nonatomic,copy) NSString * pro_imagename;
@property (nonatomic,assign) int16_t pro_lv;

+ (void)fun_zrSaveSignins:(NSMutableArray *)temp;
+ (void)fun_zrsigninSave:(cls_zr *)signin;
+ (NSMutableArray *)fun_getzr;

@end

NS_ASSUME_NONNULL_END
