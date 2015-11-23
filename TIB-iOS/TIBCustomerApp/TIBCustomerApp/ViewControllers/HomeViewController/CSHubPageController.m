//
//  CSHubPageController.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/2/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSHubPageController.h"
#import "CSWebController.h"
#import "CSSecurityPageViewController.h"
#import "CSWebController.h"
#import "CSPersonalBanking.h"
#import "Branding.h"

#define kLogoImageName @"lloyds_logo.pdf"

@implementation CSHubPageController

-(void) viewDidLoad
{
    [super viewDidLoad];
    

}

-(void) viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];


    [self setLoginButton];
    UIImageView *imageViewForLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:kLogoImageName]];
    imageViewForLogo.frame=CGRectMake(48, self.navigationController.navigationBar.frame.size.height/2.0-[UIImage imageNamed:kLogoImageName].size.height/2.0+1.0, [UIImage imageNamed:kLogoImageName].size.width, [UIImage imageNamed:kLogoImageName].size.height);
    [self.navigationController.navigationBar addSubview:imageViewForLogo];
    //[self setBrandTitleWithImageButton:[UIImage imageNamed:@"lloyds_logo.pdf"]];
    
//     [self.btnPersonalBanking setTitleColor:kCarButtonUpperBarColor forState:UIControlStateNormal];
    
    [self setUpViewInterface];
    [self setSendMoreInfoButton];
    UIImageView *separatorView=[[UIImageView alloc] initWithFrame:CGRectMake(self.navigationController.navigationBar.frame.size.width-19*8-1, 10, 1, self.navigationController.navigationBar.frame.size.height-20)];
    separatorView.backgroundColor=kDividerKeyLineColor;
    [self.navigationController.navigationBar addSubview:separatorView];

    [self.digitalServicesPanel setBackgroundColor:kStatusBarColor];
    [self.productsPanel setBackgroundColor:self.digitalServicesPanel.backgroundColor];
}

-(void)setUpViewInterface{
    
    [self.btnPersonalBanking.titleLabel setFont:kButtonTitleFont];
    [self.btnBussinessBanking.titleLabel setFont:kButtonTitleFont];
    
    [self.btnBussinessProductServices.titleLabel setFont:kButtonTitleFont];
    [self.btnPersonalProductServices.titleLabel setFont:kButtonTitleFont];
   
    [self.btnPersonalBanking setBackgroundColor:kDefaultButtonColor];
    [self.btnBussinessBanking setBackgroundColor:kSecondaryButtonColor];
    
    [self.btnBussinessProductServices setBackgroundColor:kSecondaryButtonColor];
    [self.btnPersonalProductServices setBackgroundColor:kDefaultButtonColor];
    
    [self.labelDigitalServices setFont:kSectionTitle_MediumFont];
    [self.labelProductServices setFont:kSectionTitle_MediumFont];
    [self.hubPageTitle1 setFont: kPageTitleFont];
    [self.hubPageTitle2 setFont: kPageTitleFont];
    [self.hubPageSubTitle setFont: kPageSubTitleFont];
    [self.labelDigitalServices setText:NSLocalizedStringWithDefaultValue(@"IB_Title", NULL, [NSBundle mainBundle], @"Our Digital Services", NULL)];
    [self.labelProductServices setText:NSLocalizedStringWithDefaultValue(@"Products_Title", NULL, [NSBundle mainBundle], @"Products & Services", NULL)];
    [self.btnPersonalBanking setTitle:NSLocalizedStringWithDefaultValue(@"btn_Personal", NULL, [NSBundle mainBundle], @"Personal", null) forState:UIControlStateNormal];
    [self.btnBussinessBanking setTitle:NSLocalizedStringWithDefaultValue(@"btn_Business", NULL, [NSBundle mainBundle], @"Business", null) forState:UIControlStateNormal];
    [self.btnPersonalProductServices setTitle:NSLocalizedStringWithDefaultValue(@"btn_Personal", NULL, [NSBundle mainBundle], @"Personal", null) forState:UIControlStateNormal];
    [self.btnBussinessProductServices setTitle:NSLocalizedStringWithDefaultValue(@"btn_Business", NULL, [NSBundle mainBundle], @"Business", null) forState:UIControlStateNormal];
    
   // [_lblFirstTitle setFont:kPageTitleFont];
    
    [self.hubPageTitle1 setText:NSLocalizedStringWithDefaultValue(@"label_Title1", NULL, [NSBundle mainBundle], @"HOW CAN", NULL)];
    [self.hubPageTitle2 setText:NSLocalizedStringWithDefaultValue(@"label_Title2", NULL, [NSBundle mainBundle], @"WE HELP YOU?", NULL)];
    [self.hubPageSubTitle setText:NSLocalizedStringWithDefaultValue(@"label_Title3", NULL, [NSBundle mainBundle], @"Select an option below to get started", NULL)];
    
}


#pragma mark Button Functions


-(IBAction)clicktogotoSecurityPage:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"CSSecurity" bundle:[NSBundle mainBundle]];
    
    CSSecurityPageViewController *spvc = [storyboard instantiateViewControllerWithIdentifier:@"TESTsecurity"];
    
    [self.navigationController pushViewController:spvc animated:YES];
}


-(IBAction) btnPersonalBankingClicked
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"CustomerApp" bundle:[NSBundle mainBundle]];
    
    
    CSPersonalBanking *ContrllerWebPage = [storyboard instantiateViewControllerWithIdentifier:@"CSPersonalBanking"];
    
    [self.navigationController pushViewController:ContrllerWebPage animated:YES];
}




@end
