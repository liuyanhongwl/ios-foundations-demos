//
//  TargetWeakObject.h
//  NSTimer-Test
//
//  Created by hong-drmk on 2017/10/19.
//  Copyright © 2017年 hong-drmk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TargetWeakObject : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL targetSelector;
@property (nonatomic, assign, readonly) SEL timerSelector;

@end
