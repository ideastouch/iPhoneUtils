//
//  NSDictionary+utils.m
//  CinesHoyts
//
//  Created by Gustavo E Halperin on 1/19/12.
//  Copyright 2011 Gustavo E Halperin. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "NSDictionary+utils.h"

@implementation NSDictionary (utils)

+ (id)dictionaryWithArray: (NSArray*)array
{
    if (!array || [array count] == 0) {
        return nil;
    }
    NSMutableDictionary *mDictionary = [NSMutableDictionary dictionaryWithCapacity:array.count/2];
    while (array.count > 1) {
        [mDictionary setObject:[array objectAtIndex:0] forKey:[array objectAtIndex:1]];
        array = [array subarrayWithRange:NSMakeRange(2, array.count-2)];
    }
    
    return [NSDictionary dictionaryWithDictionary:mDictionary];
}

+ (id)dictionaryWithStringAtIndex: (int)index ofObjectsInArray: (NSArray*)array
{
    if (!array || [array count] == 0) {
        return [[NSDictionary alloc] init];
    }
    NSMutableDictionary *mDictionary = [NSMutableDictionary dictionaryWithCapacity:array.count];
    for (int i=0; i<array.count; i++) {
        [mDictionary setValue:[NSNumber numberWithInt:i] forKey: [[array objectAtIndex:i] objectAtIndex:index]];
    }
    
    return [NSDictionary dictionaryWithDictionary:mDictionary];
}

@end
