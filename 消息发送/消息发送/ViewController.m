//
//  ViewController.m
//  消息发送
//
//  Created by 江奔 on 2018/12/26.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import "ViewController.h"
#import "YMPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    YMPerson *p = [[YMPerson alloc] init];
    [p run];
}


@end
