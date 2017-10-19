//
//  TimerViewController.m
//  NSTimer-Test
//
//  Created by hong-drmk on 2017/10/19.
//  Copyright © 2017年 hong-drmk. All rights reserved.
//

#import "TimerViewController.h"
#import "NSTimer+Extension.h"
#import "TargetWeakObject.h"

@interface TimerViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"Dismiss" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 100, CGRectGetWidth(self.view.frame) - 20, 40);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    [self scheduledTimer1];
//    [self scheduledTimer2];
//    [self scheduledTimer3];
    [self timer4];
}

- (void)scheduledTimer1 {
    //方法一
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    /*
     引用关系：
     runloop->timer
     self->timer->self
     timer执行是添加到runloop中的
     另外timer有效时都会保留target
     */
}

- (void)scheduledTimer2 {
    //方法二
    self.timer = [NSTimer ets_scheduledTimerWithTimeInterval:1 block:^{
        NSLog(@"方法二：%s", __FUNCTION__);
    } repeats:YES];
    /*
     引用关系：
     runloop->timer
     self->timer->NSTimer类对象（类对象是单例，无需回收）
     离开页面，发现执行了self的dealloc方法，但是定时器还在执行，
     是因为timer没有失效，runloop持有timer，应该调用-invalidate方法使timer失效。
     */
}

- (void)scheduledTimer3 {
    //方法三
    TargetWeakObject *obj = [[TargetWeakObject alloc] init];
    obj.target = self;
    obj.targetSelector = @selector(timerAction);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:obj selector:obj.timerSelector userInfo:nil repeats:YES];
    /*
     引用关系：
     runloop->timer
     self->timer->obj--weak--> self
     打破循环引用
     */
}

- (void)timer4 {
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    NSLog(@"%d", self.timer.valid);
    /*
     self->timer->self
     即使没有添加到runloop中，timer.valid是YES，timer保留target(self)，离开页面self不能销毁。
     */
}

- (void)buttonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)timerAction {
    NSLog(@"%s", __FUNCTION__);
}

- (void)dealloc {
    NSLog(@"%s dealloc", __FUNCTION__);
    //使定时器失效，注释掉定时器会内存泄漏，并且保持执行。
    [self.timer invalidate];
}

/*
 总结：
 - NSTimer 需要加到runloop才会执行，runloop会保留NSTimer
 - 有效的NSTimer会保留target，不管有没有加到runloop中
 - 打破循环引用：写NSTimer的分类，让timer的target指向NSTimer类对象。
 - 打破循环引用：在self和timer之间添加一层，使self->timer->obj--weak--> self
 
 参考：
 - [NSTimer 使用进阶](http://www.cocoachina.com/ios/20161028/17877.html)
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
