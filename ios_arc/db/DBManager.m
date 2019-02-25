//
//  DBManager.m
//  ios_arc
//
//  Created by lala on 2019/2/23.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager

static DBManager* manager = nil;
FMDatabase *db;

+(DBManager*)sharedManager{
    static dispatch_once_t once;
    
    _dispatch_once(&once, ^{
        manager = [[self alloc] init];
        //init db
        NSString *path = [[FileUtil documentDirectoryPath] stringByAppendingPathComponent:@"main.db"];
        db = [FMDatabase databaseWithPath:path];
        
    });
    
    return manager;
}

-(void)createMainTable{
    if (![db open]) {
        NSLog(@"db open fail");
        return;
    }
    NSString *sql = @"create table if not exists test('ID' INTEGER PRIMARY KEY AUTOINCREMENT ,'name' TEXT NOT NULL)";
    BOOL result = [db executeUpdate:sql];
    [db close];
}

-(void)insertTestData{
    if (![db open]) {
        NSLog(@"db open fail");
        return;
    }
    BOOL result = [db executeUpdate:@"insert into 'test'('name') values(?)" withArgumentsInArray:@[@"lala"]];
    [db close];
}

-(NSMutableArray*)queryTestData{
    if (![db open]) {
        NSLog(@"db open fail");
        return nil;
    }
    FMResultSet *result = [db executeQuery:@"select *from 'test'"];
    
    NSMutableArray *attr = [NSMutableArray array];
    while ([result next]) {
        NSString *name = [result stringForColumn:@"name"];
        [attr addObject:name];
        NSLog(@"name=%@",name);
    }
    
    [db close];
    return attr;
}

-(int)queryTestDataCount{
    if (![db open]) {
        NSLog(@"db open fail");
        return 0;
    }
    
    int count = 0;
    count = [db intForQuery:@"select count(*) from 'test'"];
    
    [db close];
    return count;
}

@end
