//
//  NSObject+Selector.h
//  ResponderChain
//
//  Created by Zhou Kang on 2018/3/20.
//  Copyright © 2018年 Zhou Kang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Selector)

- (id)performSelector:(SEL)selector withObjects:(NSArray <id> *)objects;

@end
