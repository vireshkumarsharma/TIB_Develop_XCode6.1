//
//  Branding.h
//  TIBCustomerApp
//
//  Created by Mobile Developer Lloyds Bank on 07/11/2015.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  This is responsible for Brand Condition
 *  This Class will identify the Target and return the specific name
 *  `isLloyds` `isBOS` `isHalifax`
 */

@interface Branding : NSObject
+ (instancetype) sharedInstance;

#pragma mark - Identifying Branding
/*
 These are declared as class methods in order to avoid interfering with the instance
 methods
 */
+ (BOOL)isLloyds;
+ (BOOL)isBOS;
+ (BOOL)isHalifax;
@end
