#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
#import <CoreGraphics/CoreGraphics.h>

@interface YpImMessage : NSObject <NSCopying>
@property (nonatomic) long id;
@property (nonatomic) int64_t msgid;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *sendTime;
@property (nonatomic, copy) NSString *isMute;
@property (nonatomic, copy) NSString *money;
@property (nonatomic, copy) NSString *sender;
@property (nonatomic, copy) NSString *receiver;
@property (nonatomic, copy) NSString *messageType;
@property (nonatomic, copy) NSString *attachment;
@end

@interface YpIdContent : NSObject <NSCopying>
@property (nonatomic) long id;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *money;
@property (nonatomic)  ddd;
@end

@interface YpImMessageDao : NSObject

// basic
+ (instancetype)get;
- (BOOL)openWithPath:(NSString *)path;
- (FMDatabaseQueue *)getQueue;
- (BOOL)insertYpImMessage:(YpImMessage *)record aRid:(int64_t *)rid;
- (BOOL)batchInsertYpImMessage:(NSArray *)records;
- (BOOL)deleteYpImMessageByPrimaryKey:(int64_t)key;
- (BOOL)deleteYpImMessageBySQLCondition:(NSString *)condition;
- (BOOL)batchUpdateYpImMessage:(NSArray *)records;
- (BOOL)updateYpImMessageByPrimaryKey:(int64_t)key aYpImMessage:(YpImMessage *)aYpImMessage;
- (BOOL)updateYpImMessageBySQLCondition:(NSString *)condition aYpImMessage:(YpImMessage *)aYpImMessage;
- (YpImMessage *)selectYpImMessageByPrimaryKey:(int64_t)key;
- (NSArray *)selectYpImMessageBySQLCondition:(NSString *)condition;
- (int)selectYpImMessageCount:(NSString *)condition;

// struct
- (BOOL)updateYpIdContentByPrimaryKey:(int64_t)key aYpIdContent:(YpIdContent *)aYpIdContent;
- (BOOL)updateYpIdContentBySQLCondition:(NSString *)condition aYpIdContent:(YpIdContent *)aYpIdContent;
- (YpIdContent *)selectYpIdContentByPrimaryKey:(int64_t)key;
- (NSArray *)selectYpIdContentBySQLCondition:(NSString *)condition;

@end
