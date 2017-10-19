//
//  NSTimer+Extension.h
//  NSTimer-Test
//
//  Created by hong-drmk on 2017/10/19.
//  Copyright © 2017年 hong-drmk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Extension)

+ (NSTimer *)ets_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                          block:(void (^)(void))block
                                        repeats:(BOOL)yesOrNo;

@end
