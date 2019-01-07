//
//  main.m
//  NSString的Copy
//
//  Created by 江奔 on 2018/12/27.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "YMPerson.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        YMPerson *p = [[YMPerson alloc] init];
        p.age = 20;
        
        YMPerson *p1 = [p copy];
        p1.age = 30;
        
        NSLog(@" p == %p, p1 == %p",p,p1);
        NSLog(@" p.age == %d p1.age == %d",p.age,p1.age);
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
