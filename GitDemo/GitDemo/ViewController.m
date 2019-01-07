//
//  ViewController.m
//  GitDemo
//
//  Created by 江奔 on 2018/12/24.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSInteger _ticketCount;
    NSInteger _sellTicketCount;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _ticketCount = 50;
    _sellTicketCount = 0;
    
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTicket) object:nil];
    
    thread1.name = @"线程1";
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTicket) object:nil];

    thread2.name = @"线程2";
    
    [thread1 start];
    [thread2 start];
}

- (void)sellTicket {
    
    while (_ticketCount > 0) {
        
        sleep(.2);
        _ticketCount --;
        _sellTicketCount ++;
        
        NSLog(@" -- %@ - %ld ",[NSThread currentThread].name,_ticketCount);
    }
}

@end
