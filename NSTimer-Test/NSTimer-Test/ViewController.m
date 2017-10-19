//
//  ViewController.m
//  NSTimer-Test
//
//  Created by hong-drmk on 2017/10/19.
//  Copyright © 2017年 hong-drmk. All rights reserved.
//

#import "ViewController.h"
#import "TimerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button setTitle:@"Timer View Controller" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 100, CGRectGetWidth(self.view.frame) - 20, 40);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton *)button {
    TimerViewController *vc = [[TimerViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

