//
//  CustomNavigationController.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CustomNavigationController.h"


@implementation CustomNavigationController

-(void) viewDidLoad
{
    self.navigationBar.barTintColor= [UIColor greenColor];
    self.navigationItem.leftBarButtonItem=nil;
    // [self.navigationBar customizeNavigationBar:self];
}

-(void) viewWillAppear:(BOOL)animated
{
    
}

-(void) viewDidAppear:(BOOL)animated
{
    
    
}


#pragma mark Navigay=tionControllecr Delegates
#pragma mark

//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    [viewController.navigationItem setHidesBackButton:YES];
//    [navigationController.navigationBar customizeNavigationBar:navigationController viewControllerBeingPresented:viewController];
//    if ([viewController isKindOfClass:[CSWelcomeViewController class]]) {
//        [[navigationController.navigationBar viewWithTag:1001] removeFromSuperview];}
//}

@end
