//
//  UIAlertView+utils.h
//  personal
//
//  Created by Silvio Halperin on 12/6/11.
//  Copyright (c) 2011 Three Pillar Global. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (utils)

+(void)spinningAlertViewWithTitle:(NSString*)title;

+(void)dismissWithTitle:(NSString*)title andMessage:(NSString*)message animated:(BOOL)animated;

+(void)dismissWithTitle:(NSString*)title andMessage:(NSString*)message afterTime: (NSTimeInterval)time animated:(BOOL)animated;

+(void)dismissAnimated: (BOOL)animated;

@end
