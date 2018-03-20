//
//  UIResponder+Chain.h
//  ResponderChain
//
//  Created by Zhou Kang on 2018/3/20.
//  Copyright © 2018年 Zhou Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Chain)

- (void)eventWithSelectorName:(NSString *)selectorName
                       object:(id)object
                     userInfo:(NSDictionary *)userInfo;

@end
