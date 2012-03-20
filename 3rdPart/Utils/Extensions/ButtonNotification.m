//
//  CinemaButton.m
//  CinesHoyts
//
//  Created by Gustavo E Halperin on 1/22/12.
//  Copyright 2011 Gustavo E Halperin. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "ButtonNotification.h"

const NSString *BUTTONWITHLABEL_PUSHED = @"BUTTONWITHLABEL_PUSHED";
const NSString *BUTTONWITHIMAGE_PUSHED = @"BUTTONWITHIMAGE_PUSHED";

NSMutableDictionary *buttonsWithLabel;
NSMutableDictionary *buttonsWithImage;

@interface UIButton (CinemaButton)
- (void)buttonTouchedAction: (id)sender;
@end

@implementation UIButton (CinemaButton)


- (void)buttonTouchedAction: (id)sender
{
    NSString *notificationName = (self.imageView.image)? [BUTTONWITHIMAGE_PUSHED copy] : [BUTTONWITHLABEL_PUSHED copy];
    NSDictionary *dict = (self.imageView.image)? buttonsWithImage : buttonsWithLabel;
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              [dict objectForKey:self.titleLabel.text], @"ButtonName", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName 
                                                        object:self
                                                      userInfo:userinfo];
}
@end


@implementation ButtonNotification

+ (id) buttonWithLabel: (NSString*)label andName: (NSString*)name andFont: (UIFont*)font
{
    if (buttonsWithLabel == nil) {
        buttonsWithLabel = [[NSMutableDictionary alloc] init];
    }
    CGSize size = [label sizeWithFont:font];
    
    ButtonNotification *buttonNotification = [UIButton buttonWithType:UIButtonTypeCustom];    
    buttonNotification.frame = CGRectMake(0, 0, size.width, size.height);
    buttonNotification.backgroundColor = [UIColor clearColor];
    buttonNotification.titleLabel.font = font;
    buttonNotification.titleLabel.backgroundColor = [UIColor clearColor];
    buttonNotification.titleLabel.text = label;
    buttonNotification.titleLabel.textColor = [UIColor whiteColor];
    [buttonNotification setTitle:label forState:UIControlStateNormal];
    [buttonNotification addTarget:buttonNotification
                           action:@selector(buttonTouchedAction:) 
                 forControlEvents:UIControlEventTouchUpInside];
    [buttonsWithLabel setObject:name forKey:label];
    
    return buttonNotification;
}


+ (id) buttonWithImage: (UIImage*)image andFrame: (CGRect)frame andName: (NSString*)name
{
    if (buttonsWithImage == nil) {
        buttonsWithImage = [[NSMutableDictionary alloc] init];
    }
    ButtonNotification *buttonNotification = [UIButton buttonWithType:UIButtonTypeCustom];    
    buttonNotification.frame = frame;
    buttonNotification.titleLabel.text = name;
    buttonNotification.imageView.image = image;
    [buttonNotification setImage:image forState:UIControlStateNormal];
    [buttonNotification addTarget:buttonNotification
                           action:@selector(buttonTouchedAction:) 
                 forControlEvents:UIControlEventTouchUpInside];
    [buttonsWithImage setObject:name forKey:name];
    
    return buttonNotification;
}


@end
