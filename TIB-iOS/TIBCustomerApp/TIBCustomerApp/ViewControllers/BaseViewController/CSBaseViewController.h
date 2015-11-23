//
//  CSBaseViewController.h
//  TIBCustomerApp
//
//  Created by Alok Sinha on 26/11/2015.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TIBKit/TIBKit.h>

@interface CSBaseViewController : UIViewController<UIPopoverPresentationControllerDelegate>

-(void) setLoginButton;
-(void) setSendMoreInfoButton;
-(void) setBackButton;
-(void) setStatusBarColor;
-(void) initNavigationBar;
@property(nonatomic,strong)  NSDictionary *unAuthUrl;
//will be called when button click on Popover Controller
-(void)dismissPopUp;
@end
