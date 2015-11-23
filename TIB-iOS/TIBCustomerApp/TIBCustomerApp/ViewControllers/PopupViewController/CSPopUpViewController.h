//
//  CSPopUpViewController.h
//  TIBCustomerApp
//
//  Created by Alok Sinha on 26/11/2015.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSBaseViewController.h"
#import "Branding.h"

@interface CSPopUpViewController : UIViewController
-(IBAction)personalButtonClicked:(id)sender;
-(IBAction)businessButtonClicked:(id)sender;
@property(nonatomic,strong)UINavigationController *parentNavigationController;//reference of navigation controller of home class
@property(nonatomic,strong)CSBaseViewController *baseClass;//reference of navigation controller of home class

@property (nonatomic,copy) NSDictionary *loginUrl;

@end
