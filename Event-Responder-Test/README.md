- 事件的传递

1. 动作由硬件层传导到操作系统，然后又从底层封装成一个事件。
2. UIApplication->window->寻找处理事件最合适的view(hit test view)。
3. 找到hit-test view后，它会有最高的优先权去响应逐级传递上来的Event，如它不能响应就会传递给它的superview，依此类推，一直传递到UIApplication都无响应者，这个Event就会被系统丢弃了。

- 查找hit test view。

> 从窗口开始递归子view的 hitTest:withEvent: 和 pointInside:withEvent: 方法查找到hit test view。

寻找逻辑的代码如下：

```
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}
``` 
