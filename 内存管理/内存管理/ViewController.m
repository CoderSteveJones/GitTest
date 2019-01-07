//
//  ViewController.m
//  内存管理
//
//  Created by 江奔 on 2018/12/26.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (nonatomic, copy) NSString *str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (NSInteger i = 0; i < 1000; i ++) {
        dispatch_async(queue, ^{
            self.str = [NSString stringWithFormat:@"abcdefg"];
//            self.str = [NSString stringWithFormat:@"abcdefghijk"];
        });
    }

    
    
}


@end
