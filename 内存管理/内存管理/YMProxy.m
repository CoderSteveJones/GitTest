//
//  YMProxy.m
//  内存管理
//
//  Created by 江奔 on 2018/12/26.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import "YMProxy.h"

@implementation YMProxy

+ (id)proxyWithTarget:(id)target {
    
    /// 初始化代理对象
    YMProxy *proxy = [YMProxy alloc];
    proxy.target = target;
    return proxy;
}

// 消息转发阶段会调用的方法 当proxy对象找不到控制器中的方法时，会调用这个方法，进行方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    return [self.target methodSignatureForSelector:sel];
}

// 方法签名返回值有值的时候，调用此方法 让控制器调用传过来的方法
- (void)forwardInvocation:(NSInvocation *)invocation {
    
    [invocation invokeWithTarget:self.target];
}

@end
