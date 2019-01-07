//
//  ViewController.m
//  FMDBDemo
//
//  Created by 江奔 on 2018/12/28.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import "ViewController.h"
#import <FMDB/FMDB.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTxf;
@property (weak, nonatomic) IBOutlet UITextField *ageTxf;
/** FMDatabase *db */
@property (nonatomic, strong) FMDatabase *db;
/** dataBaseQueue */
@property (nonatomic, strong) FMDatabaseQueue *queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
//    [self dataBaseTest];
   
    [self fmDataBaseQueueTest];
}


/**
 初始化FMDatabaseQueue
 */
- (void)fmDataBaseQueueTest {
    
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *dbPath = [docPath stringByAppendingPathComponent:@"student.db"];
    self.queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    [self.queue inDatabase:^(FMDatabase * _Nonnull db) {
       
        NSString *creatTable = @"create table if not exists student(name text,age integer)";
        if ([db executeUpdate:creatTable]) {
            NSLog(@"建表成功！");
        }else {
            NSLog(@"建表失败！");
        }
    }];
}

// 多线程操作
- (IBAction)fmDataBaseQueueClick:(id)sender {
    
    // 多个线程同时操作数据时 FMDataBaseQueue可以保证线程安全
    dispatch_queue_t queue = dispatch_queue_create("data", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        // 插入演示 使用事务 提高效率
        [self.queue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
            
            NSLog(@"当前线程 -- %@",[NSThread currentThread]);
            BOOL iserror = NO;
            for (int i = 0; i < 100; i ++) {
                NSString *name = [NSString stringWithFormat:@"name - %d",i];
                int age = i + 3;
                iserror = [db executeUpdate:@"insert into student values(?,?)",name,@(age)];
                if (!iserror) {
                    NSLog(@"插入失败！");
                    *rollback = YES;
                    return;
                }else {
                    NSLog(@"插入成功！");
                }
            }
        }];
    });
    
    dispatch_async(queue, ^{
        
        // 删除演示 使用事务 提高效率
        [self.queue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
            
            NSLog(@"当前线程 -- %@",[NSThread currentThread]);
            BOOL iserror = NO;
            iserror = [db executeUpdate:@"delete from student"];
            if (!iserror) {
                NSLog(@"删除失败！");
                *rollback = YES;
                return;
            }else {
                NSLog(@"删除成功！");
            }
        }];
    });
    
   
   
}


////////////////////

/**
 初始化FMDatabase
 */
- (void)dataBaseTest {
    
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *path = [docPath stringByAppendingPathComponent:@"user.db"];
    
    self.db = [FMDatabase databaseWithPath:path];
    if ([self.db open]) {
        NSLog(@"-- 打开数据库成功！");
        if ([self.db executeUpdate:@"create table if not exists user (name text,age integer)"]) {
            NSLog(@"-- 创建表成功！");
            [self.db close];
        }else {
            NSLog(@"-- 创建表失败！");
        }
    }else {
        NSLog(@"-- 打开数据库失败！");
    }
}

// 增
- (IBAction)add:(id)sender {
    
    if ([self.db open]) {
        if ([self.db executeUpdate:@"insert into user values (?, ?)",self.nameTxf.text,self.ageTxf.text]) {
            NSLog(@"-- 插入数据成功！");
            [self.db close];
        }else {
            NSLog(@"-- 插入数据失败！");
        }
    }else {
        NSLog(@"-- 数据库打开失败！");
    }
   
    
}

// 删
- (IBAction)delete:(id)sender {
    
    if ([self.db open]) {
        if ([self.db executeUpdate:@"delete from user"]) {
            NSLog(@"-- 删除数据成功！");
            [self.db close];
        }else {
            NSLog(@"-- 删除数据失败！");
        }
    }else {
        NSLog(@"-- 数据库打开失败！");
    }
   
}


// 改
- (IBAction)modify:(id)sender {
    

    if ([self.db open]) {
        if ([self.db executeUpdate:@"update user set name = '小方' where age = 13"]) {
            NSLog(@"-- 更新数据成功！");
            [self.db close];
        }else {
            NSLog(@"-- 更新数据失败！");
        }
    }else {
        NSLog(@"-- 数据库打开失败！");
    }
   
}

// 查
- (IBAction)query:(id)sender {
    
    if ([self.db open]) {
        FMResultSet *result = [self.db executeQuery:@"select * from user"];
        while ([result next]) {
            NSString *name = [result stringForColumn:@"name"];
            int age = [result intForColumn:@"age"];
            NSLog(@"name == %@,age == %d",name,age);
        }
        [self.db close];
    }else {
        NSLog(@"-- 数据库打开失败！");
    }
}



@end
