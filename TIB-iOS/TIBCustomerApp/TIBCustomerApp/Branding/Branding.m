//
//  Branding.m
//  TIBCustomerApp
//
//  Created by Mobile Developer Lloyds Bank on 07/11/2015.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "Branding.h"

@implementation Branding

+ (instancetype)sharedInstance {
    static Branding *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}


#pragma mark - Class Method to Indentify Brand

+ (BOOL)isLloyds {
        #ifdef LLO
            return YES;
        #endif
    return NO;
}

+ (BOOL)isBOS {
        #ifdef BOS
            return YES;
        #endif
    return NO;
}

+ (BOOL)isHalifax {
        #ifdef HAL
            return YES;
        #endif
    return NO;
}
@end
