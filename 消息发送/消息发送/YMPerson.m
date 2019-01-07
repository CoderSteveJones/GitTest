//
//  YMPerson.m
//  消息发送
//
//  Created by 江奔 on 2018/12/26.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import "YMPerson.h"
#import <objc/runtime.h>
#import "YMCat.h"
@implementation YMPerson

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    if (aSelector == @selector(run)) {
        
        // v @ : 分别b表示返回值为void,还包含-run的两个默认参数，id类型self, SEL类型_cmd
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}


- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    /// 指定任务target 调用YMCat中的-run  从而实现消息转发
    [anInvocation invokeWithTarget:[[YMCat alloc] init]];
}

@end
