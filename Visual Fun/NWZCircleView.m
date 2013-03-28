//
//  NWZCircleView.m
//  Visual Fun
//
//  Created by Aaron Douglas on 3/10/13.
//  Copyright (c) 2013 Net Workz LLC. All rights reserved.
//

#import "NWZCircleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation NWZCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
        self.opaque = YES;
        self.layer.cornerRadius = 10;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
//    [[UIColor darkGrayColor] setFill];
//    [path fill];
//    [path setLineWidth:1.0];
//    [[UIColor blueColor] setStroke];
//    [path stroke];
//}

@end
