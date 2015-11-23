//
//  PowaTLV.h
//  PowaPIN SDK
//
//  Created by Deepak Shukla on 01/08/2014.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PowaTLV : NSObject

@property (nonatomic, retain) NSData *tag;
@property (nonatomic) NSInteger length;
@property (nonatomic, retain) NSData *value;

@end
