//
//  PowaPaymentApplication.h
//  PowaPINDriver
//
//  Created by Deepak Shukla on 14/04/2014.
//  Copyright (c) 2014 mpowa. All rights reserved.
//

#import <Foundation/Foundation.h>


/** Contains details regarding an EMV application. */

@interface PowaPINApplication : NSObject

@property (nonatomic, strong) NSString *appId;

@property (nonatomic, strong) NSString *appLabel;

@property (nonatomic, strong) NSString *appName;

@property (nonatomic) NSInteger appPosition;

@property (nonatomic, strong) NSString *appIssuer;

@end

