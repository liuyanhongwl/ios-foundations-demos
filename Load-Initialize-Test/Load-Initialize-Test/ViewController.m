//
//  ViewController.m
//  Load-Initialize-Test
//
//  Created by Hong on 2016/12/20.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "ViewController.h"
#import "LoadInitializeClass.h"
#import "LoadInitializeCategoryClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 200, 50);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)btnAction:(UIButton *)button
{
    NSLog(@"\n\n\n");
//    [ChildClass load];
    
    Child *c = [[Child alloc] init];
    [c description];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
