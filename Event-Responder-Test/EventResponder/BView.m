//
//  BView.m
//  EventResponder
//
//  Created by Hong on 16/8/16.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "BView.h"

@implementation BView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //todo something
    NSLog(@"B 先做些什么, 再往上一个响应者传递");
    
    [self.nextResponder touchesBegan:touches withEvent:event];
}

@end
