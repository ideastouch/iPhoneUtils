//
//  UIView+utils.m
//  CinesHoyts
//
//  Created by gustavo halperin on 3/20/12.
//  Copyright (c) 2012 Three Pillard Global. All rights reserved.
//

#import "UIView+utils.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (utils)

- (void)insertBorder
{
    const CGFloat *background = CGColorGetComponents(self.backgroundColor.CGColor);
    CGRect frameUpBorder =   CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 0, 0);
    CAGradientLayer *gradientUpBorder = [CAGradientLayer layer];
    frameUpBorder.size.width = self.bounds.size.width;
    frameUpBorder.size.height = 2;
    gradientUpBorder.frame = frameUpBorder;
    
    gradientUpBorder.colors = [NSArray arrayWithObjects: 
                               (id)[[UIColor colorWithRed:background[0] * 0.85 
                                                    green:background[1] * 0.85 
                                                     blue:background[2] * 0.85
                                                    alpha:1.000] CGColor],
                               (id)[[UIColor colorWithRed:0.85 + background[0] * 0.15
                                                    green:0.85 + background[1] * 0.15 
                                                     blue:0.85 + background[2] * 0.15 
                                                    alpha:1.000] CGColor], 
                               nil];
    
    [self.layer insertSublayer:gradientUpBorder atIndex:0];
}

- (void)insertGrandient: (float)gradient
{
    if (gradient < 0 || gradient >= 1) {
        return;
    }
    const CGFloat *background = CGColorGetComponents(self.backgroundColor.CGColor);
    CGRect frameUpBorder =   CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 0, 0);
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    CGRect frame = CGRectMake(self.bounds.origin.x,
                              self.bounds.origin.y + frameUpBorder.size.height,
                              self.bounds.size.width,
                              self.bounds.size.height - frameUpBorder.size.height);
    gradientLayer.frame = frame;
    
    gradientLayer.colors =  [NSArray arrayWithObjects: 
                             (id)[[UIColor colorWithRed:background[0] green:background[1] blue:background[2] alpha:background[3]]
                                  CGColor],
                             (id)[[UIColor colorWithRed:background[0] * gradient
                                                  green:background[1] * gradient
                                                   blue:background[2] * gradient alpha:background[3]]
                                  CGColor], 
                             nil];
    
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end
