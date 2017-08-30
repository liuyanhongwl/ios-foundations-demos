//
//  ViewController.m
//  EventResponder
//
//  Created by Hong on 16/8/16.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Event.h"
#import "NSObject+Event.h"
#import "BView.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.frame);
    CGFloat margin = 20;
    
    UIView *a = [[UIView alloc] init];
    a.name = @"A";
    a.frame = CGRectMake(margin, margin, width - margin * 2, height / 2 - margin * 3);
    a.backgroundColor = [UIColor redColor];
    [self.view addSubview:a];
    
    {
        BView *b = [[BView alloc] init];
        b.name = @"B";
        b.frame = CGRectInset(a.bounds, margin, margin);
        b.backgroundColor = [UIColor blueColor];
        [a addSubview:b];
    }
    
    UIView *c = [[UIView alloc] init];
    c.name = @"C";
    c.frame = CGRectMake(margin, CGRectGetMaxY(a.frame) + margin, CGRectGetWidth(a.frame), CGRectGetHeight(a.frame));
    c.backgroundColor = [UIColor cyanColor];
    c.userInteractionEnabled = NO; //注意这里
    [self.view addSubview:c];
    
    {
        CGFloat width = CGRectGetWidth(c.frame);
        CGFloat height = CGRectGetHeight(c.frame);
        
        UIView *d = [[UIView alloc] init];
        d.name = @"D";
        d.frame = CGRectMake(margin, margin, width - 2 * margin, height / 2 - margin * 3);
        d.backgroundColor = [UIColor greenColor];
        [c addSubview:d];
        
        UIView *e = [[UIView alloc] init];
        e.name = @"E";
        e.frame = CGRectMake(margin, CGRectGetMaxY(d.frame) + margin, CGRectGetWidth(d.frame), CGRectGetHeight(d.frame));
        e.backgroundColor = [UIColor yellowColor];
        [c addSubview:e];
    }
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [c addGestureRecognizer:tap];
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"%s", __func__);
}

@end
