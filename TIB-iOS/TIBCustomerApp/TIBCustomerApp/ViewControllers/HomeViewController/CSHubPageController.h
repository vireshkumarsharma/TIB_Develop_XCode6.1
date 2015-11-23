//
//  CSHubPageController.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/2/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TIBKit/TIBKit.h>
#import "CSBaseViewController.h"

@interface CSHubPageController : CSBaseViewController<UIPopoverControllerDelegate>


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet UIButton *btnPersonalBanking;
@property (weak, nonatomic) IBOutlet UIButton *btnBussinessBanking;

@property (weak, nonatomic) IBOutlet UIView *digitalServicesPanel;
@property (weak, nonatomic) IBOutlet UIView *productsPanel;

@property (weak, nonatomic) IBOutlet UILabel *labelDigitalServices;
@property (weak, nonatomic) IBOutlet UILabel *labelProductServices;
@property (weak, nonatomic) IBOutlet UIButton *btnPersonalProductServices;
@property (weak, nonatomic) IBOutlet UIButton *btnBussinessProductServices;

@property (weak, nonatomic) IBOutlet UILabel *hubPageTitle1;
@property (weak, nonatomic) IBOutlet UILabel *hubPageTitle2;
@property (weak, nonatomic) IBOutlet UILabel *hubPageSubTitle;
//-(IBAction)clicktogotoSecurityPage:(id)sender;

//-(IBAction) btnPersonalBankingClicked;
@end
