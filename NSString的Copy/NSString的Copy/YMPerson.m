//
//  YMPerson.m
//  NSString的Copy
//
//  Created by 江奔 on 2018/12/27.
//  Copyright © 2018 zhenhong. All rights reserved.
//

#import "YMPerson.h"

@implementation YMPerson

- (id)copyWithZone:(NSZone *)zone {
    
    YMPerson *person = [YMPerson allocWithZone:zone];
    person.weight = self.weight;
    return person;
}

@end
