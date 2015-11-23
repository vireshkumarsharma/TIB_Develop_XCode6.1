//
//  KeyValuePair.h
//  PowaPIN SDK
//
//  Created by Deepak Shukla on 23/06/2014.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Contains key-value pairs regarding transaction custom data. */

@interface PowaKeyValuePair : NSObject

@property (nonatomic, retain) NSString *key;
@property (nonatomic,retain) NSString *value;

@end
