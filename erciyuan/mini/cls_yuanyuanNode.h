//
//  cls_yuanyuanNode.h
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/8.
//

#import <Foundation/Foundation.h>
@class cls_yuanyuan;
NS_ASSUME_NONNULL_BEGIN

@interface cls_yuanyuanNode : NSObject
@property (nonatomic, strong) cls_yuanyuan *pro_data;
@property (nonatomic, strong) cls_yuanyuanNode *pro_previous;
@property (nonatomic, strong) cls_yuanyuanNode *pro_next;
@end

NS_ASSUME_NONNULL_END
