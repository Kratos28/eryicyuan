#import "YpImMessageDao.h"
#import <FMDB/FMDB.h>

#define DATABASE_NAME @"welldown_enc.sqlite"

@implementation YpImMessage
- (id)copyWithZone:(NSZone *)zone {
    YpImMessage *copy = (YpImMessage *)[[[self class] allocWithZone:zone] init];
    copy.id = self.id;
    copy.msgid = self.msgid;
    copy.content = self.content;
    copy.sendTime = self.sendTime;
    copy.isMute = self.isMute;
    copy.money = self.money;
    copy.sender = self.sender;
    copy.receiver = self.receiver;
    copy.messageType = self.messageType;
    copy.attachment = self.attachment;
    return copy;
}
- (NSString *)description {
    NSMutableString *result = [NSMutableString string];
    [result appendFormat:@"id %@, \r", @(self.id)];
    [result appendFormat:@"msgid %@, \r", @(self.msgid)];
    [result appendFormat:@"content %@, \r", self.content];
    [result appendFormat:@"sendTime %@, \r", self.sendTime];
    [result appendFormat:@"isMute %@, \r", self.isMute];
    [result appendFormat:@"money %@, \r", self.money];
    [result appendFormat:@"sender %@, \r", self.sender];
    [result appendFormat:@"receiver %@, \r", self.receiver];
    [result appendFormat:@"messageType %@, \r", self.messageType];
    [result appendFormat:@"attachment %@, \r", self.attachment];
    return result;
}
@end

@implementation YpIdContent
- (id)copyWithZone:(NSZone *)zone {
    YpIdContent *copy = (YpIdContent *)[[[self class] allocWithZone:zone] init];
    copy.id = self.id;
    copy.content = self.content;
    copy.money = self.money;
    copy.ddd = self.ddd;
    return copy;
}
- (NSString *)description {
    NSMutableString *result = [NSMutableString string];
    [result appendFormat:@"id %@, \r", @(self.id)];
    [result appendFormat:@"content %@, \r", self.content];
    [result appendFormat:@"money %@, \r", self.money];
    [result appendFormat:@"ddd %@, \r", @(self.ddd)];
    return result;
}
@end

@implementation YpImMessageDao {
    FMDatabaseQueue*   _dbQueue;
    NSString*          _path;
}

// basic
+ (instancetype)get {
    static YpImMessageDao *sI;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sI = [[YpImMessageDao alloc] initPrivate];
    });
    return sI;
}
- (BOOL)openWithPath:(NSString *)path {
    @synchronized(self) {
        if(_dbQueue != nil) {
            if([path isEqual:_path]) return YES;
        }
        _path = path;
        NSString *dbDirectoryPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:path];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbDirectoryPath]) {
            [fileManager createDirectoryAtPath:dbDirectoryPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        NSString* dbPath = [dbDirectoryPath stringByAppendingPathComponent:DATABASE_NAME];
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }
    [self _createTables];
    return YES;
}
- (FMDatabaseQueue *)getQueue {
    return _dbQueue;
}
- (instancetype)init {
    @throw [NSException exceptionWithName:@"Can't init!" reason:@"instance class!" userInfo:nil];
    return nil;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)resetDatebaseDBQueue {
    @synchronized(self) {
        _dbQueue = nil;
        _path = nil;
    }
}
- (instancetype)initPrivate {
    self = [super init];
    if (!self) {
        return nil;
    }
    _dbQueue = nil;
    _path = nil;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetDatebaseDBQueue) name:@"kYPDatebaseServiceResetDBQueue" object:nil];
    return self;
}
- (void)_createTables {
    __block NSString* sql = nil;
    sql = @"SELECT * FROM yp_im_message limit 1";
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:sql];
        if(resultSet != nil) {
            if([resultSet columnIndexForName:@"msgid"] < 0) {
                sql = @"ALTER TABLE yp_im_message ADD COLUMN msgid INTEGER";
                [db executeUpdate:sql];
            }
            if([resultSet columnIndexForName:@"content"] < 0) {
                sql = @"ALTER TABLE yp_im_message ADD COLUMN content TEXT";
                [db executeUpdate:sql];
            }
            if([resultSet columnIndexForName:@"sendTime"] < 0) {
                sql = @"ALTER TABLE yp_im_message ADD COLUMN sendTime TEXT";
                [db executeUpdate:sql];
            }
            if([resultSet columnIndexForName:@"isMute"] < 0) {
                sql = @"ALTER TABLE yp_im_message ADD COLUMN isMute TEXT";
                [db executeUpdate:sql];
            }
            if([resultSet columnIndexForName:@"money"] < 0) {
                sql = @"ALTER TABLE yp_im_message ADD COLUMN money TEXT";
                [db executeUpdate:sql];
            }
            if([resultSet columnIndexForName:@"sender"] < 0) {
                sql = @"ALTER TABLE yp_im_message ADD COLUMN sender TEXT";
                [db executeUpdate:sql];
            }
            if([resultSet columnIndexForName:@"receiver"] < 0) {
                sql = @"ALTER TABLE yp_im_message ADD COLUMN receiver TEXT";
                [db executeUpdate:sql];
            }
            if([resultSet columnIndexForName:@"messageType"] < 0) {
                sql = @"ALTER TABLE yp_im_message ADD COLUMN messageType TEXT";
                [db executeUpdate:sql];
            }
            if([resultSet columnIndexForName:@"attachment"] < 0) {
                sql = @"ALTER TABLE yp_im_message ADD COLUMN attachment TEXT";
                [db executeUpdate:sql];
            }
            [resultSet close];
        } else {
            sql = @" CREATE TABLE IF NOT EXISTS yp_im_message(id INTEGER PRIMARY KEY AUTOINCREMENT, msgid INTEGER, content TEXT, sendTime TEXT, isMute TEXT, money TEXT, sender TEXT, receiver TEXT, messageType TEXT, attachment TEXT)";
            if ([db executeUpdate:sql]) {
                NSLog(@"create table yp_im_message success");
            } else {
                NSLog(@"create table yp_im_message failed");
                return;
           }
       }
   }];
}
- (BOOL)insertYpImMessage:(YpImMessage *)record aRid:(int64_t *)rid {
    if (!_dbQueue) return NO;
    NSString* sql = @"INSERT INTO yp_im_message (msgid, content, sendTime, isMute, money, sender, receiver, messageType, attachment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    __block BOOL errorOccurred = NO;
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollBack) {
        errorOccurred = ![db executeUpdate:sql, @(record.msgid), record.content, record.sendTime, record.isMute, record.money, record.sender, record.receiver, record.messageType, record.attachment];
        if (errorOccurred) {
            *rollBack = YES;
        } else {
            if (rid != nil) *rid = [db lastInsertRowId];
        }
    }];
    return !errorOccurred;
}
- (BOOL)batchInsertYpImMessage:(NSArray *)records {
    if (records.count == 0) return YES;
    if (!_dbQueue) return NO;
    NSString* sql = @"INSERT INTO yp_im_message (msgid, content, sendTime, isMute, money, sender, receiver, messageType, attachment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    __block BOOL errorOccurred = NO;
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollBack) {
        for (YpImMessage* record in records) {
            errorOccurred = ![db executeUpdate:sql, @(record.msgid), record.content, record.sendTime, record.isMute, record.money, record.sender, record.receiver, record.messageType, record.attachment];
            if (errorOccurred) {
            }
        }
    }];
    return YES;
}
- (BOOL)deleteYpImMessageByPrimaryKey:(int64_t)key {
    if (!_dbQueue) return NO;
    NSString* sql = @"DELETE FROM yp_im_message WHERE id=?";
    __block BOOL errorOccurred = NO;
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollBack) {
        errorOccurred = ![db executeUpdate:sql, @(key)];
        if (errorOccurred) {
            *rollBack = YES;
        }
    }];
    return !errorOccurred;
}
- (BOOL)deleteYpImMessageBySQLCondition:(NSString *)condition {
    if (!_dbQueue) return NO;
    NSString *sql = @"DELETE FROM yp_im_message";
    if(condition != nil) {
        sql = [NSString stringWithFormat:@"%@ WHERE %@", sql, condition];
    }
    __block BOOL errorOccurred = NO;
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollBack) {
        errorOccurred = ![db executeUpdate:sql];
        if (errorOccurred) {
            *rollBack = YES;
        }
    }];
    return !errorOccurred;
}
- (BOOL)batchUpdateYpImMessage:(NSArray *)records {
    if (records.count == 0) return YES;
    if (!_dbQueue) return NO;
    NSString* sql = @"UPDATE yp_im_message SET id=?, msgid=?, content=?, sendTime=?, isMute=?, money=?, sender=?, receiver=?, messageType=?, attachment=? WHERE id=?";
    __block BOOL errorOccurred = NO;
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollBack) {
        for (YpImMessage *record in records) {
            errorOccurred = ![db executeUpdate:sql, @(record.id), @(record.msgid), record.content, record.sendTime, record.isMute, record.money, record.sender, record.receiver, record.messageType, record.attachment, @(record.id)];
            if (errorOccurred) {
            }
        }
    }];
    return YES;
}
- (BOOL)updateYpImMessageByPrimaryKey:(int64_t)key aYpImMessage:(YpImMessage *)aYpImMessage {
    if (!_dbQueue) return NO;
    NSString* sql = @"UPDATE yp_im_message SET id=?, msgid=?, content=?, sendTime=?, isMute=?, money=?, sender=?, receiver=?, messageType=?, attachment=? WHERE id=?";
    __block BOOL errorOccurred = NO;
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollBack) {
        errorOccurred = ![db executeUpdate:sql, @(aYpImMessage.id), @(aYpImMessage.msgid), aYpImMessage.content, aYpImMessage.sendTime, aYpImMessage.isMute, aYpImMessage.money, aYpImMessage.sender, aYpImMessage.receiver, aYpImMessage.messageType, aYpImMessage.attachment, @(key)];
        if (errorOccurred) {
            *rollBack = YES;
        }
    }];
    return !errorOccurred;
}
- (BOOL)updateYpImMessageBySQLCondition:(NSString *)condition aYpImMessage:(YpImMessage *)aYpImMessage {
    if (!_dbQueue) return NO;
    NSString* sql = @"UPDATE yp_im_message SET id=?, msgid=?, content=?, sendTime=?, isMute=?, money=?, sender=?, receiver=?, messageType=?, attachment=?";
    if(condition != nil) {
        sql = [NSString stringWithFormat:@"%@ WHERE %@", sql, condition];
    }
    __block BOOL errorOccurred = NO;
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollBack) {
        errorOccurred = ![db executeUpdate:sql, @(aYpImMessage.id), @(aYpImMessage.msgid), aYpImMessage.content, aYpImMessage.sendTime, aYpImMessage.isMute, aYpImMessage.money, aYpImMessage.sender, aYpImMessage.receiver, aYpImMessage.messageType, aYpImMessage.attachment];
        if (errorOccurred) {
            *rollBack = YES;
        }
    }];
    return !errorOccurred;
}
- (YpImMessage *)selectYpImMessageByPrimaryKey:(int64_t)key {
    if (!_dbQueue) return nil;
    __block YpImMessage* record = [[YpImMessage alloc] init];
    NSString* sql = @"SELECT id, msgid, content, sendTime, isMute, money, sender, receiver, messageType, attachment FROM yp_im_message WHERE id=?";
    __block BOOL found = NO;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:sql, @(key)];
        while (resultSet.next) {
            record.id = [resultSet longLongIntForColumn:@"id"];
            record.msgid = [resultSet longLongIntForColumn:@"msgid"];
            record.content = [resultSet stringForColumn:@"content"];
            record.sendTime = [resultSet stringForColumn:@"sendTime"];
            record.isMute = [resultSet stringForColumn:@"isMute"];
            record.money = [resultSet stringForColumn:@"money"];
            record.sender = [resultSet stringForColumn:@"sender"];
            record.receiver = [resultSet stringForColumn:@"receiver"];
            record.messageType = [resultSet stringForColumn:@"messageType"];
            record.attachment = [resultSet stringForColumn:@"attachment"];
            found = YES;
            break;
        }
        [resultSet close];
    }];
    if(!found) return nil;
    return record;
}
- (NSArray *)selectYpImMessageBySQLCondition:(NSString *)condition {
    if (!_dbQueue) return nil;
    __block NSMutableArray* records = [[NSMutableArray alloc] init];
    NSString* sql = @"SELECT id, msgid, content, sendTime, isMute, money, sender, receiver, messageType, attachment FROM yp_im_message";
    if(condition != nil) {
        sql = [NSString stringWithFormat:@"%@ WHERE %@", sql, condition];
    }
    __block BOOL found = NO;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:sql];
        while (resultSet.next) {
            YpImMessage* record = [[YpImMessage alloc] init];
            record.id = [resultSet longLongIntForColumn:@"id"];
            record.msgid = [resultSet longLongIntForColumn:@"msgid"];
            record.content = [resultSet stringForColumn:@"content"];
            record.sendTime = [resultSet stringForColumn:@"sendTime"];
            record.isMute = [resultSet stringForColumn:@"isMute"];
            record.money = [resultSet stringForColumn:@"money"];
            record.sender = [resultSet stringForColumn:@"sender"];
            record.receiver = [resultSet stringForColumn:@"receiver"];
            record.messageType = [resultSet stringForColumn:@"messageType"];
            record.attachment = [resultSet stringForColumn:@"attachment"];
            found = YES;
            [records addObject:record];
        }
        [resultSet close];
    }];
    if(!found) return nil;
    return records;
}
- (int)selectYpImMessageCount:(NSString *)condition {
    if (!_dbQueue) return -1;
    __block int count = 0;
    NSString* sql = @"SELECT COUNT(*) FROM yp_im_message";
    if(condition != nil) {
        sql = [NSString stringWithFormat:@"%@ WHERE %@", sql, condition];
    }
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:sql];
        if (resultSet.next) {
            count = [resultSet intForColumnIndex:0];
        }
        [resultSet close];
    }];
    return count;
}

// struct
- (BOOL)updateYpIdContentByPrimaryKey:(int64_t)key aYpIdContent:(YpIdContent *)aYpIdContent {
    if (!_dbQueue) return NO;
    NSString* sql = @"UPDATE yp_im_message SET id=? and content=? and money=? and ddd=? WHERE id=?";
    __block BOOL errorOccurred = NO;
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollBack) {
        errorOccurred = ![db executeUpdate:sql, @(aYpIdContent.id), aYpIdContent.content, aYpIdContent.money, @(aYpIdContent.ddd), @(key)];
        if (errorOccurred) {
            *rollBack = YES;
        }
    }];
    return !errorOccurred;

}
- (BOOL)updateYpIdContentBySQLCondition:(NSString *)condition aYpIdContent:(YpIdContent *)aYpIdContent {
    if (!_dbQueue) return NO;
    NSString* sql = @"UPDATE yp_im_message SET id=? and content=? and money=? and ddd=?";
    if(condition != nil) {
        sql = [NSString stringWithFormat:@"%@ WHERE %@", sql, condition];
    }
    __block BOOL errorOccurred = NO;
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollBack) {
        errorOccurred = ![db executeUpdate:sql, @(aYpIdContent.id), aYpIdContent.content, aYpIdContent.money, @(aYpIdContent.ddd)];
        if (errorOccurred) {
            *rollBack = YES;
        }
    }];
    return !errorOccurred;

}
- (YpIdContent *)selectYpIdContentByPrimaryKey:(int64_t)key {
    if (!_dbQueue) return nil;
    __block YpIdContent* record = [[YpIdContent alloc] init];
    NSString* sql = @"SELECT id, content, money, ddd FROM yp_im_message WHERE id=?";
    __block BOOL found = NO;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:sql, @(key)];
        while (resultSet.next) {
            record.id = [resultSet longLongIntForColumn:@"id"];
            record.content = [resultSet stringForColumn:@"content"];
            record.money = [resultSet stringForColumn:@"money"];
            record.ddd = [resultSet stringForColumn:@"ddd"];
            found = YES;
            break;
        }
        [resultSet close];
    }];
    if(!found) return nil;
    return record;

}
- (NSArray *)selectYpIdContentBySQLCondition:(NSString *)condition {
    if (!_dbQueue) return nil;
    __block NSMutableArray* records = [[NSMutableArray alloc] init];
    NSString* sql = @"SELECT id, content, money, ddd FROM yp_im_message";
    if(condition != nil) {
        sql = [NSString stringWithFormat:@"%@ WHERE %@", sql, condition];
    }
    __block BOOL found = NO;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:sql];
        while (resultSet.next) {
            YpIdContent* record = [[YpIdContent alloc] init];
            record.id = [resultSet longLongIntForColumn:@"id"];
            record.content = [resultSet stringForColumn:@"content"];
            record.money = [resultSet stringForColumn:@"money"];
            record.ddd = [resultSet stringForColumn:@"ddd"];
            found = YES;
            [records addObject:record];
        }
        [resultSet close];
    }];
    if(!found) return nil;
    return records;

}

@end
