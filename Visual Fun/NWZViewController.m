//
//  NWZViewController.m
//  Visual Fun
//
//  Created by Aaron Douglas on 3/10/13.
//  Copyright (c) 2013 Net Workz LLC. All rights reserved.
//

#import "NWZViewController.h"
#import "NWZCircleView.h"

@interface NWZViewController ()

@end

@implementation NWZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    for (int y = 0; y <= 1024; y += 20) {
        for (int x = 0; x <= 1024; x += 20) {
            CGRect circleFrame = CGRectMake(x, y, 20, 20);
            NWZCircleView *view = [[NWZCircleView alloc] initWithFrame:circleFrame];
            [self.view addSubview:view];
        }
    }

    UIPanGestureRecognizer *gr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected:)];
    [self.view addGestureRecognizer:gr];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchDetected:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint point = [gestureRecognizer locationInView:self.view];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        [view ]
        for (UIView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[NWZCircleView class]] == NO) {
                continue;
            }
            
            NWZCircleView *circleView = (NWZCircleView *)subview;
            
            if (circleView.isAnimating == NO && CGRectContainsPoint(circleView.frame, point)) {
//                NSLog(@"Point: (%f, %f)", point.x, point.y);
                circleView.isAnimating = YES;
                [self.view bringSubviewToFront:circleView];
                [UIView animateWithDuration:0.25 animations:^{
//                    circleView.alpha = 0.0;
//                    circleView.transform = CGAffineTransformMakeScale(10, 10);
                    circleView.backgroundColor = [UIColor redColor];
                } completion:^(BOOL finished) {
//                    circleView.hidden = YES;
                    circleView.isAnimating = NO;
                    [UIView animateWithDuration:0.25 animations:^{
//                        circleView.transform = CGAffineTransformIdentity;
                        circleView.alpha = 0;
                    } completion:^(BOOL finished) {
                        circleView.hidden = YES;
                    }];
                }];
            }
        }
    }
}

@end
