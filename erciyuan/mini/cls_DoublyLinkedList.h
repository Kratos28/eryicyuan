//
//  cls_DoublyLinkedList.h
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/8.
//

#import <Foundation/Foundation.h>
@class cls_yuanyuanNode,cls_yuanyuan;
NS_ASSUME_NONNULL_BEGIN

@interface cls_DoublyLinkedList : NSObject
@property (nonatomic, strong) cls_yuanyuanNode *pro_head;
@property (nonatomic, strong) cls_yuanyuanNode *pro_tail;
@property (nonatomic, assign) NSUInteger pro_count;

- (void)fun_insertNodeWithData:(id)data;
- (void)fun_deleteNode:(cls_yuanyuanNode *)node;
- (void)fun_printLinkedList;
- (NSMutableArray *)fun_getAllNode;
- (cls_yuanyuanNode *)fun_getNodeWithData:(cls_yuanyuan *)data;
- (cls_yuanyuanNode *)fun_getNodeAtIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
