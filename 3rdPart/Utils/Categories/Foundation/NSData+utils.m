//
//  NSData+utils.m
//  iPhoneUtils
//
//  Created by Gustavo E Halperin on 3/23/12.
//  Copyright (c) 2012 Gustavo E Halperin. All rights reserved.
//

#import "NSData+utils.h"

@implementation NSData (utils)
#pragma mark - String Conversion
- (NSString *)hexadecimalString {
    /* Returns hexadecimal string of NSData. Empty string if data is empty.   */
    
    const unsigned char *dataBuffer = (const unsigned char *)[self bytes];
    
    if (!dataBuffer)
        return [NSString string];
    
    NSUInteger          dataLength  = [self length];
    NSMutableString     *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i)
        [hexString appendString:[NSString stringWithFormat:@"%02x", (unsigned long)dataBuffer[i]]];
    // [hexString appendFormat:@"%02.2hhx", dataBuffer[i]];
    
    return [NSString stringWithString:hexString];
    
    
    //NSString *result = [[dataBuffer description] stringByReplacingOccurrencesOfString:@" " withString:@""];
    //result = [result substringWithRange:NSMakeRange(1, [result length] - 2)];
    //return result;
}
@end
