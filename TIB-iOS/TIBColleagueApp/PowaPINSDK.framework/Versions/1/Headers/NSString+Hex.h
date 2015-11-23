//
//  NSString+Hex.h
//  PowaPIN SDK
//
//  Created by Abel Duarte on 3/19/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Convenience method for converting hexadecimal string to data
 */

@interface NSString (NSStringHex)

- (NSData *)stringToHex:(NSString *)string;
- (UInt8)integerFromHexCharacter:(unichar)character;

@end
