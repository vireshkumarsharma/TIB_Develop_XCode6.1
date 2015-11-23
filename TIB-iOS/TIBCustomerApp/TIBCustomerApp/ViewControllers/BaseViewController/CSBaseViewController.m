//
//  CSBaseViewController.m
//  TIBCustomerApp
//
//  Created by Alok Sinha on 26/11/2015.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSBaseViewController.h"
#import "CSPopUpViewController.h"
#import "CSHubPageController.h"
#import "CSWebController.h"
#import "CSSecurityPageViewController.h"
#import "CSWebController.h"
#import "CSPersonalBanking.h"
#import "Branding.h"

#define kTopHeight  42  //height of popover from top
#define kLeftMargin -88
#define kHeight    300
#define kWidth    216



#define kSendMoreInfoButtonFrame CGRectMake(self.navigationController.navigationBar.frame.size.width-39*8, 0, 20*8-1, self.navigationController.navigationBar.frame.size.height)



@interface CSBaseViewController()
@property (nonatomic, strong) UIButton * loginButton;



@end


@implementation CSBaseViewController


-(void) viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.view setBackgroundColor:kPageBackgroundColor];
    [self setStatusBarColor];
}


// Commented Because Sub Class not Calling viewWillAppear of CSBaseViewController
/*
-(void) viewWillAppear:(BOOL)animated
{
    [self initNavigationBar];
    UIView *separatorView=[[UIView alloc] initWithFrame:CGRectMake(129*8, 5, 2, self.navigationController.navigationBar.frame.size.height-10)];
    separatorView.backgroundColor=kDividerKeyLineColor;
    [self.navigationController.navigationBar addSubview:separatorView];
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.view setBackgroundColor:kPageBackgroundColor];
    [self setStatusBarColor];

}
*/
 
-(void) setLoginButton
{
    
        self.loginButton=[self.navigationController.navigationBar addCustomNavigationBarButtonOfType:customLoginButtonOnRightOfBar];
        [self.loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationController.navigationBar setFontForButton:self.loginButton font:kNavBarTitlesFont];
        [self.loginButton setBackgroundColor:self.navigationController.navigationBar.backgroundColor];
     
        //[self.loginButton addTarget:self action:@selector(clickedOutsideLogonButton:) forControlEvents:UIControlEventTouchUpOutside];


}

-(void) setSendMoreInfoButton
{

    UIButton *buttonForMoreInfo=(UIButton *)[self.navigationController.navigationBar addButtonWithFrame:kSendMoreInfoButtonFrame Title:NSLocalizedStringWithDefaultValue(@"Navigation_SendMoreInfo", nil, [NSBundle mainBundle], @"Send more info", nil) image_nullable:nil color:nil imagePosition:imagePositionNil andSpace:0.0];

    [self.navigationController.navigationBar setFontForButton:buttonForMoreInfo font:kNavBarTitlesFont];
    
   // buttonForMoreInfo.titleLabel.font=kNavBarTitlesFont;
}

//-(void) setBrandTitleWithImageButton:(UIImage *) imageForLogo
//{
// 
//    UIButton * buttonForLogo=(UIButton *)[self.navigationController.navigationBar addButtonWithFrame:CGRectMake(48, self.navigationController.navigationBar.frame.size.height/2.0-imageForLogo.size.height/2.0+1.0, imageForLogo.size.width, imageForLogo.size.height) Title:nil image_nullable:imageForLogo color:self.navigationController.navigationBar.backgroundColor imagePosition:imagePositionRight];
//
//     buttonForLogo.enabled=NO;
//
//
//  //   buttonForLogo.enabled=NO;
//
//}

-(void) setBackButton
{
    UIButton *backButton=[self.navigationController.navigationBar addCustomNavigationBarButtonOfType:customBackButtonOnLeftOfBar];
    [self.navigationController.navigationBar setFontForButton:backButton font:kNavBarTitlesFont];
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}


//login button clicked
-(void)loginButtonClicked:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"CustomerApp" bundle:[NSBundle mainBundle]];
    UIButton * senderLoginButton=(UIButton *) sender;
    senderLoginButton.backgroundColor=kStatusBarColor;
    
    
    
    CSPopUpViewController* customView = [storyboard instantiateViewControllerWithIdentifier:@"Popover"];//popover class
    customView.parentNavigationController=self.navigationController;
  
    customView.modalPresentationStyle = UIModalPresentationPopover;
     //customView.preferredContentSize=CGSizeMake(216, 316);
    customView.loginUrl = nil;
    
    #ifdef BACKENDSELECTION
        customView.loginUrl = self.unAuthUrl;
    #endif
    
    TIBLog(@"%@",customView.loginUrl);
    
    customView.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:customView animated:YES completion:nil];
    
    // configure the Popover presentation controller
    UIPopoverPresentationController *popController = [customView popoverPresentationController];
    popController.permittedArrowDirections = 0;
    popController.sourceView=sender;
    popController.delegate=self;


    popController.sourceRect = CGRectMake(kLeftMargin,kTopHeight, kWidth, kHeight);
    customView.view.frame=popController.sourceRect;
    customView.baseClass=self;


    
    
       
}


// Added By Vaishali ---- 20 Nov 2015----
// Logon Button getting lighten after dismissing PopOver View Controleer

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    
    popoverController.delegate = nil;
}


-(void) backButtonClicked: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//for image from color
-(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, (CGRect){.size = size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    self.loginButton.backgroundColor=[UIColor clearColor];
}

-(void) initNavigationBar {
    //added for navigation bar
    [self.navigationController.navigationBar customizeNavigationBarForNavigationController:self.navigationController presentingViewController:self];
    [self.navigationController.navigationBar setBackgroundColor:kNavigationBarColor];
    [self setStatusBarColor];
}

-(void) setStatusBarColor {
    UIView *statusBarView   =   [[self.navigationController.navigationBar superview] viewWithTag:kStatusBarViewTag];
    statusBarView.backgroundColor   =   kStatusBarColor;
}


-(void)dismissPopUp
{
    self.loginButton.backgroundColor=[UIColor clearColor];


}

@end
