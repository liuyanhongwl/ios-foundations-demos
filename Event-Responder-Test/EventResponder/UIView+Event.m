//
//  UIView+Event.m
//  EventResponder
//
//  Created by Hong on 16/8/16.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "UIView+Event.h"
#import "NSObject+Event.h"
#import <objc/runtime.h>

@implementation UIView (Event)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalHitTest = class_getInstanceMethod([self class], @selector(hitTest:withEvent:));
        Method swizzledHitTest = class_getInstanceMethod([self class], @selector(exHitTest:withEvent:));
        method_exchangeImplementations(originalHitTest, swizzledHitTest);
        
        Method originalPointInside = class_getInstanceMethod([self class], @selector(pointInside:withEvent:));
        Method swizzledPointInside = class_getInstanceMethod([self class], @selector(exPointInside:withEvent:));
        method_exchangeImplementations(originalPointInside, swizzledPointInside);
    });
}

- (UIView *)exHitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@(%p)---in---%s---%@", self.class, self, __func__, self.name);
    UIView *view = [self exHitTest:point withEvent:event];
    NSLog(@"%@(%p)---out---%s---%@", self.class, self, __func__, self.name);
    return view;
}

- (BOOL)exPointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@(%p)---%s---%@", self.class, self, __func__, self.name);
    BOOL inside = [self exPointInside:point withEvent:event];
    NSLog(@"%@(%p)---%s---%@---is inside=%d", self.class, self, __func__, self.name, inside);
    return inside;
}

@end
