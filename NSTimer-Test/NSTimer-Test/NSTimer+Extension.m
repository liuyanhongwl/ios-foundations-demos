//
//  NSTimer+Extension.m
//  NSTimer-Test
//
//  Created by hong-drmk on 2017/10/19.
//  Copyright © 2017年 hong-drmk. All rights reserved.
//

#import "NSTimer+Extension.h"

@implementation NSTimer (Extension)

+ (NSTimer *)ets_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                          block:(void (^)(void))block
                                        repeats:(BOOL)yesOrNo {
    return [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(ets_invokeBlock:) userInfo:block repeats:yesOrNo];
}

+ (void)ets_invokeBlock:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
