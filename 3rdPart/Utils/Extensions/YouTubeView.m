//
//  YouTubeView.m
//  CinesHoyts
//
//  Created by Gustavo E Halperin on 1/9/12.
//  Copyright 2011 Gustavo E Halperin. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "YouTubeView.h"

@implementation YouTubeView

#pragma mark -
#pragma mark Initialization

- (YouTubeView *)initWithStringAsURL:(NSString *)urlString frame:(CGRect)frame;
{
    if (self = [super initWithFrame:frame]) 
    {
        // Create webview with requested frame size
        //self = [[UIWebView alloc] initWithFrame:frame];
        self.backgroundColor = [UIColor blueColor];
        NSString* embedHTML = @"<html><head>\
        <style type=\"text/css\">\
        body {background-color: transparent;color: white;} \
        </style></head>\
        <body style=\"margin:0\">\
        <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" width=\"%0.0f\" height=\"%0.0f\">\
        </embed>\
        </body>\
        </html>";
        NSString* html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
        
        [self loadHTMLString:html baseURL:nil];
    }
    return self;  
}
@end
