//
//  YMPerson.h
//  NSString的Copy
//
//  Created by 江奔 on 2018/12/27.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMPerson : NSObject <NSCopying>
/** age */
@property (nonatomic, assign) int age;
@end

NS_ASSUME_NONNULL_END
