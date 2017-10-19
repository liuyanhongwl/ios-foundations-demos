//
//  TargetWeakObject.m
//  NSTimer-Test
//
//  Created by hong-drmk on 2017/10/19.
//  Copyright © 2017年 hong-drmk. All rights reserved.
//

#import "TargetWeakObject.h"

@implementation TargetWeakObject

- (SEL)timerSelector {
    return @selector(timerHandleAction:);
}

- (void)timerHandleAction:(NSTimer *)timer {
    NSLog(@"%s", __FUNCTION__);
    if ([self.target respondsToSelector:self.targetSelector]) {
        [self.target performSelector:self.targetSelector withObject:timer];
    }
}

@end
