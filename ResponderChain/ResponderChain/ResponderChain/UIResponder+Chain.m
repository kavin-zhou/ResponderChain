//
//  UIResponder+Chain.m
//  ResponderChain
//
//  Created by Zhou Kang on 2018/3/20.
//  Copyright © 2018年 Zhou Kang. All rights reserved.
//

#import "UIResponder+Chain.h"
#import <objc/runtime.h>

@implementation UIResponder (Chain)

- (void)eventWithSelectorName:(NSString *)selectorName
                       object:(id)object
                     userInfo:(NSDictionary *)userInfo {
    return [[self nextResponder] eventWithSelectorName:selectorName
                                                object:object
                                              userInfo:userInfo];
}

@end
