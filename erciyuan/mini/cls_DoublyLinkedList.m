//
//  cls_DoublyLinkedList.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/8.
//

#import "cls_DoublyLinkedList.h"
#import "cls_yuanyuanNode.h"
#import "cls_yuanyuan.h"
@implementation cls_DoublyLinkedList
- (void)fun_insertNodeWithData:(id)data
{
    cls_yuanyuanNode *newNode = [[cls_yuanyuanNode alloc] init];
    newNode.pro_data = data;
    if (self.pro_head == nil) {
        self.pro_head = newNode;
        self.pro_tail = newNode;
    } else {
        newNode.pro_previous = self.pro_tail;
        self.pro_tail.pro_next = newNode;
        self.pro_tail = newNode;
    }
}


- (cls_yuanyuanNode *)fun_getNodeAtIndex:(NSInteger)index
{
    if (index < 0) {
        return nil;
    }
    
    cls_yuanyuanNode *currentNode = self.pro_head;
    NSInteger currentIndex = 0;
    
    while (currentNode != nil && currentIndex != index) {
        currentNode = currentNode.pro_next;
        currentIndex++;
    }
    
    return currentNode;
}
- (NSUInteger )pro_count
{
    return self.fun_getAllNode.count;
}

- (void)fun_deleteNode:(cls_yuanyuanNode *)node {
    if (node == nil) {
        return;
    }
    
    if (node == self.pro_head) {
        self.pro_head = self.pro_head.pro_next;
        self.pro_head.pro_previous = nil;
    } else if (node == self.pro_tail) {
        self.pro_tail = self.pro_tail.pro_previous;
        self.pro_tail.pro_next = nil;
    } else {
        cls_yuanyuanNode *previousNode = node.pro_previous;
        cls_yuanyuanNode *nextNode = node.pro_next;
        previousNode.pro_next = nextNode;
        nextNode.pro_previous = previousNode;
    }
}
- (void)fun_printLinkedList {
    cls_yuanyuanNode *currentNode = self.pro_head;
    while (currentNode != nil) {
        currentNode = currentNode.pro_next;
    }
}


- (NSMutableArray *)fun_getAllNode
{
    cls_yuanyuanNode *currentNode = self.pro_head;
    NSMutableArray *aara= [NSMutableArray array];
    while (currentNode != nil)
    {
        currentNode = currentNode.pro_next;
        if (currentNode != nil)
        {
            [aara addObject:currentNode];
        }
    }
    return aara;
}
- (cls_yuanyuanNode *)fun_getNodeWithData:(cls_yuanyuan *)data
{
    cls_yuanyuanNode *currentNode = self.pro_head;
    while (currentNode != nil) {
        if ([currentNode.pro_data isEqual:data]) {
            return currentNode;
        }
        currentNode = currentNode.pro_next;
    }
    return nil;
}


@end
