//
//  LoadInitializeCategoryClass.m
//  Load-Initialize-Test
//
//  Created by Hong on 2016/12/20.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "LoadInitializeCategoryClass.h"

/*
 父类的initialize 和 load 优先于本类。
 
 对于+initialize，只有最后一个类别执行，本类的+initialize和前面类别的+initialize被隐藏。
 
 而对于+load，本类和本类的所有类别都执行，并且如果Apple的文档中介绍顺序一样：先执行类自身的实现，再执行类别中的实现。
 */

@implementation Super

+ (void) load {
//    NSLog(@"%@ %s", [self class], __FUNCTION__);
    NSLog(@"%s", __FUNCTION__);
}

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end



@implementation Child

+ (void) load {
//    NSLog(@"%@ %s", [self class], __FUNCTION__);
    NSLog(@"%s", __FUNCTION__);
}

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end



@implementation Child (Category)

+ (void) load {
//    NSLog(@"%@ %s", [self class], __FUNCTION__);
    NSLog(@"%s", __FUNCTION__);
}

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end



@implementation Child (OtherCategory)

+ (void) load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end
