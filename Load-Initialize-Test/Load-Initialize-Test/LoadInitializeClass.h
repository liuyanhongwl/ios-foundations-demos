//
//  LoadInitializeClass.h
//  Load-Initialize-Test
//
//  Created by Hong on 2016/12/20.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperClass : NSObject

@end


@interface ChildClass : SuperClass

@end


@interface InsideInitialize : NSObject

- (void)objectMethod;

@end
