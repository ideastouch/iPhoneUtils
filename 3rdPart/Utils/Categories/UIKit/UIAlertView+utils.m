//
//  UIAlertView+utils.m
//  personal
//
//  Created by Silvio Halperin on 12/6/11.
//  Copyright (c) 2011 Three Pillar Global. All rights reserved.
//

#import "UIAlertView+utils.h"

UIAlertView *alertView = nil;

@implementation UIAlertView (utils)

+(void)spinningAlertViewWithTitle:(NSString*)title
{
    alertView = [[UIAlertView alloc] initWithTitle:nil message:title
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:nil, nil];
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    loading.frame= CGRectMake(139.0f-18.0f, 55.0f,
                              37.0f, 37.0f);
    [alertView addSubview:loading];
    [loading startAnimating];
    [alertView show];
}

+(void)dismissAnimated: (BOOL)animated
{
    [alertView dismissWithClickedButtonIndex:0 animated:animated];
}

+(void)dismissWithTitle:(NSString*)title andMessage:(NSString*)message animated:(BOOL)animated
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title 
                                                     message:message 
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil, nil];
    
    [alert show];
}


+(void)dismissWithTitle:(NSString*)title andMessage:(NSString*)message afterTime: (NSTimeInterval)time animated:(BOOL)animated
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title 
                                                     message:message 
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:nil, nil];
    
    [alert show];
    [alert performSelector:@selector (dismissAnimated:) 
                withObject: alert  
                afterDelay: time];
}

@end
