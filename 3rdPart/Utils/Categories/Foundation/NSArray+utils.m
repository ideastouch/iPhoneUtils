//
//  NSArray+filters.m
//  CinesHoyts
//
//  Created by Gustavo E Halperin on 1/18/12.
//  Copyright 2011 Gustavo E Halperin. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "NSArray+utils.h"

@implementation NSArray (utils)

-(NSArray*) componentsSeparatedByList:(NSArray *)list
{
    if (!list || list.count == 0) {
        return self;
    }
    
    NSString *string = [list objectAtIndex:0];
    NSMutableArray *mutablearray = [[NSMutableArray alloc] init];
    
    
    for (NSString *obj in self) {
        [mutablearray addObjectsFromArray: [[obj componentsSeparatedByString:string] filteredByEmpty]];
    }
    
    return [mutablearray componentsSeparatedByList:[list subarrayWithRange:NSMakeRange(1, list.count-1)]];
}


- (NSArray *)filteredByEmpty
{
    static NSPredicate *predicate = nil;
    if (predicate == nil) {
        predicate = [NSPredicate predicateWithBlock:^BOOL(id obj, NSDictionary *bind){
            return [(NSString*)obj length] > 0;
        }];
    }
    
    return [self filteredArrayUsingPredicate:predicate];
}


- (BOOL)containsString: (NSString*)string
{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id obj, NSDictionary *bind){
        return [string isEqualToString: (NSString*)obj];
    }];

    return [[self filteredArrayUsingPredicate:predicate] count] == 1;
}

@end
