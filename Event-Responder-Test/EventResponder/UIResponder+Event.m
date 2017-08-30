//
//  UIResponder+Event.m
//  EventResponder
//
//  Created by Hong on 16/8/16.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "UIResponder+Event.h"
#import "NSObject+Event.h"
#import <objc/runtime.h>

@implementation UIResponder (Event)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalTouchBegin = class_getInstanceMethod([self class], @selector(touchesBegan:withEvent:));
        Method swizzledTouchBegin = class_getInstanceMethod([self class], @selector(exTouchesBegan:withEvent:));
        method_exchangeImplementations(originalTouchBegin, swizzledTouchBegin);
        
        Method originalTouchEnd = class_getInstanceMethod([self class], @selector(touchesEnded:withEvent:));
        Method swizzledTouchEnd = class_getInstanceMethod([self class], @selector(exTouchesEnded:withEvent:));
        method_exchangeImplementations(originalTouchEnd, swizzledTouchEnd);
    });
}

- (void)exTouchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@(%p)---%s---%@", self.class, self,__func__, self.name);
    [self exTouchesBegan:touches withEvent:event];
}

- (void)exTouchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@(%p)---%s---%@", self.class, self, __func__, self.name);
    [self exTouchesEnded:touches withEvent:event];
}


@end
