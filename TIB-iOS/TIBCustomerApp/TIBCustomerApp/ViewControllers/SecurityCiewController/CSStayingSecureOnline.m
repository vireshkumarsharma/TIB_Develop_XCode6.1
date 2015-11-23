//
//  CSstayingSecureOnline.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSStayingSecureOnline.h"
#import "CSWebController.h"

@implementation CSStayingSecureOnline

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
   
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addCustomNavigationBarButtonOfType:customSMSButton];
    [self setLoginButton];
    [self setBackButton];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
