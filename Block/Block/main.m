//
//  main.m
//  Block
//
//  Created by 江奔 on 2018/12/27.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "YMPerson.h"
typedef void(^YMBlock)(void);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
       
        YMBlock block;
        {
            YMPerson *person = [[YMPerson alloc] init];
            person.age = 10;
            __block __weak YMPerson *blockPerson = person;
            block = ^{
                blockPerson.age = 100;
            };
        }
        block();
        NSLog(@"---");

        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

/*
 当block在栈上时，并不会对__block变量产生强引用。
 当__block变量被copy到堆时，会调用__block变量内部的copy函数，copy函数内部会调用_Block_object_assign函数，_Block_object_assign函数会根据所指向对象的修饰符（__strong、__weak、__unsafe_unretained）做出相应的操作，形成强引用（retain）或者弱引用（注意：这里仅限于ARC时会retain，MRC时不会retain）。

 
 如果__block变量从堆上移除，会调用__block变量内部的dispose函数，dispose函数内部会调用_Block_object_dispose函数，_Block_object_dispose函数会自动释放指向的对象（release）。

 */
