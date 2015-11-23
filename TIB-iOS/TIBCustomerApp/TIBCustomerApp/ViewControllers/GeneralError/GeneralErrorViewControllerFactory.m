//
//  GeneralErrorViewControllerFactory.m
//  TIBCustomerApp
//
//  Created by Gangaraju on 11/17/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeneralErrorViewControllerFactory.h"

@implementation GeneralErrorViewControllerFactory

#pragma mark init method

/**
 * Returns  GeneralErrorViewController Object with common features to be done for the view controller
 * for every error page.
 */

+(GeneralErrorViewController *)createErrorViewController{
    
    GeneralErrorViewController *generalErrorViewController = [[GeneralErrorViewController alloc]initWithNibName:NSStringFromClass([GeneralErrorViewController class]) bundle:[NSBundle mainBundle]];
    
    return generalErrorViewController;
}

#pragma mark Public method

+ (GeneralErrorViewController *)createErrorScreenWithErrorType:(CSErrorType)errorType{
    GeneralErrorViewController *generalErrorViewController = nil;
    
    switch (errorType) {
        case CSErrorLogOut:
            generalErrorViewController = [self createErrorLoggedOutScreen];
            break;
        case CSErrorLogoutWithText:
            generalErrorViewController = [self createErrorLoggedOutScreenWithErrorText:nil];
            break;
        case CSErrorBlackListWithText:
            generalErrorViewController = [self createBlackListErrorWithText:nil];
            break;
        default:
            break;
    }
    
    return generalErrorViewController;
}


#pragma mark Private methods

/**
 * Returns a GeneralErrorViewController with the error methods
 * @param error Error object's description to be displayed on the screen
 */
+ (GeneralErrorViewController *)createBlackListErrorWithText:(NSString *)errorText{
    
    //create the user interface for black listed url with text message
    GeneralErrorViewController *generalErrorViewController = [self createErrorViewController];
   // generalErrorViewController.view.backgroundColor = [UIColor redColor]; // for Unit testing only
    return generalErrorViewController;
}

/**
 * Returns a GeneralErrorViewController for global module 08a
 * @param error Error object's description to be displayed on the screen
 */
+ (GeneralErrorViewController *)createErrorLoggedOutScreen{
    
    
    //create the user interface for Logout screen
    GeneralErrorViewController *generalErrorViewController = [self createErrorViewController];
//generalErrorViewController.view.backgroundColor = [UIColor greenColor]; // for Unit testing only
    return generalErrorViewController;
}

/**
 * Returns a GeneralErrorViewController with log out screen and text
 * @param errorText logout message that shows in the body
 */
+ (GeneralErrorViewController *)createErrorLoggedOutScreenWithErrorText:(NSString *)errorText{
    
    //create the user interface for Logout screen with error message
    GeneralErrorViewController *generalErrorViewController = [self createErrorViewController];
 //generalErrorViewController.view.backgroundColor = [UIColor blueColor]; // for Unit testing only
    return generalErrorViewController;
}



@end