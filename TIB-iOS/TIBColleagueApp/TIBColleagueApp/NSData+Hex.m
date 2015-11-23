//
//  NSData+Hex.m
//  Gateway
//
//  Created by Deepak Shukla on 23/04/2014.
//  Copyright (c) 2014 Powa. All rights reserved.
//

#import "NSData+Hex.h"

@implementation NSData (NSDataHex)

- (NSString *)dataToHex:(NSData *)data;
{
    NSMutableString *string = [NSMutableString string];
    
    if(data == nil)
    {
        [string appendString:@""];
    }

    const char *bytes = [(NSData*)data bytes];
    
    for (int i = 0; i < [data length]; i++)
    {
        [string appendFormat:@"%02X", bytes[i]];
    }
    
    return string;
}

@end
