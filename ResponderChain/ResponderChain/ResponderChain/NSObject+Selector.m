//
//  NSObject+Selector.m
//  ResponderChain
//
//  Created by Zhou Kang on 2018/3/20.
//  Copyright © 2018年 Zhou Kang. All rights reserved.
//

#import "NSObject+Selector.h"

@implementation NSObject (Selector)

- (id)performSelector:(SEL)selector withObjects:(NSArray<id> *)objects {
    NSMethodSignature *signature = [NSObject instanceMethodSignatureForSelector:selector];
    if (!signature){
        NSString *reason = [NSString stringWithFormat:@"-[%@ %@] : unrecognized selector sent to instance", [self class], NSStringFromSelector(selector)];
        @throw [[NSException alloc] initWithName:@"Crash" reason:reason userInfo:nil];
        return nil;
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    // 将 _cmd、target 两个默认参数剔除
    NSUInteger argumentCount = signature.numberOfArguments - 2;
    NSUInteger objectCount = objects.count;
    NSUInteger count = MIN(argumentCount, objectCount);
    
    for (int i = 0; i < count; i ++) {
        id obj = objects[i];
        if ([obj isKindOfClass:[NSNull class]]) {
            obj = nil;
        }
        [invocation setArgument:&obj atIndex:i + 2];
    }
    [invocation invoke];
    
    // 获取返回值
    id result = nil;
    if (signature.methodReturnLength != 0) {
        [invocation getReturnValue:&result];
    }
    return result;
}

@end
