//
//  CSProductsPage.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/6/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSProductsPageViewController.h"
#import "CSWebController.h"

@implementation CSProductsPageViewController


-(void) viewDidLoad
{
    [super viewDidLoad];
    
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setLoginButton];
    [self setBackButton];

}



@end
