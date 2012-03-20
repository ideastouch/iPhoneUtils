//
//  UIImage+utils.m
//  CinesHoyts
//
//  Created by Gustavo E Halperin on 3/9/12.
//  Copyright 2011 Gustavo E Halperin. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "UIImage+utils.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImage (utils)

+(UIImage *)grabImageFromView: (UIView *) viewToGrab {
    
    UIGraphicsBeginImageContext(viewToGrab.bounds.size);
    [viewToGrab.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

@end
