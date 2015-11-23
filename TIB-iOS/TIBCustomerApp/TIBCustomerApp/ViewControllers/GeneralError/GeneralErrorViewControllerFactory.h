//
//  GeneralErrorViewControllerFactory.h
//  TIBCustomerApp
//
//  Created by Gangaraju on 11/17/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "GeneralErrorViewController.h"

typedef enum : NSUInteger {
    CSErrorLogOut,
    CSErrorLogoutWithText,
    CSErrorBlackListWithText,
} CSErrorType;

/**
 * This factory class creates error view controllers with different
 * layouts and arrangments.
 */

@interface GeneralErrorViewControllerFactory : NSObject

/**
* This method will return the error screen to be shown in the app.
 @param errorType enumeration.
 
*/
+ (GeneralErrorViewController *)createErrorScreenWithErrorType:(CSErrorType)errorType;


@end

