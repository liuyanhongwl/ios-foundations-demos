//
//  NSObject+Event.m
//  EventResponder
//
//  Created by Hong on 16/8/16.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "NSObject+Event.h"
#import <objc/runtime.h>

static const NSString *keyName = @"keyName";

@implementation NSObject (Event)

- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, &keyName, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name
{
    NSString *name = objc_getAssociatedObject(self, &keyName);
    return name;
}

@end
