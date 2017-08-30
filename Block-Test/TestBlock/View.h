//
//  View.h
//  TestBlock
//
//  Created by Hong on 16/9/7.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView

@property (nonatomic, copy) void (^block)();

@end
