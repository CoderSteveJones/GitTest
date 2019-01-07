//
//  YMProxy.h
//  内存管理
//
//  Created by 江奔 on 2018/12/26.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMProxy : NSProxy
/** target */
@property (nonatomic, weak) id target;
+ (id)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
