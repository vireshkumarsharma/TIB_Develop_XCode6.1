//
//  PowaTLVUtils.h
//  PowaPIN SDK
//
//  Created by Deepak Shukla on 31/07/2014.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PowaTLV;

@interface PowaTLVUtils : NSObject

/**
 Finds and returns a specific TLV object from an encoded TLV buffer.
 <b>Reference:</b></br> getTLV in PowaPIN SDK API Specification
 @brief Gets TLV object for given tag.
 @param  tag The Tag.
 @param  data The data to be parsed.

 @return The void.
 */

+ (PowaTLV*) getTLVForTag:(NSData*)tag fromData:(NSData*)data;

@end
