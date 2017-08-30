//
//  LoadInitializeClass.m
//  Load-Initialize-Test
//
//  Created by Hong on 2016/12/20.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "LoadInitializeClass.h"

/*
    执行时机：+load在程序运行时执行。 +initialize在类的方法第一次调用前执行。
 
    若自身未定义，是否沿用父类的方法： +load不会执行父类的方法。 +initialize会执行父类的方法。
 */

@implementation SuperClass

+ (void)load
{
//    NSLog(@"%@---%s", [self class], __FUNCTION__);
    NSLog(@"%s", __FUNCTION__);
}

+ (void)initialize
{
    NSLog(@"%@---%s", [self class], __FUNCTION__);
//    NSLog(@"%s", __FUNCTION__);
}

@end


@implementation ChildClass

//+ (void)load
//{
//    NSLog(@"%s",__FUNCTION__);
//}

+ (void)initialize
{
    NSLog(@"%@---%s", [self class], __FUNCTION__);
    
    InsideInitialize *inside = [[InsideInitialize alloc] init];
    [inside objectMethod];
}

@end


@implementation InsideInitialize

+ (void)load
{
    NSLog(@"%s",__FUNCTION__);
}

+ (void)initialize
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)objectMethod
{
    NSLog(@"%@---%s", [self class], __FUNCTION__);
}

@end

