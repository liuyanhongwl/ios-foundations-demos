//
//  View.m
//  TestBlock
//
//  Created by Hong on 16/9/7.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "View.h"

@implementation View

- (void)dealloc
{
    NSLog(@"view %ld dealloc", self.tag);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
