//
//  ViewController.m
//  线程同步
//
//  Created by 江奔 on 2018/12/24.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
@interface ViewController ()
@property (nonatomic, assign) OSSpinLock lock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.lock = OS_SPINLOCK_INIT;
    
}


@end
