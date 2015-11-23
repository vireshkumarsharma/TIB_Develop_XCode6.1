//
//  CSPopUpViewController.m
//  TIBCustomerApp
//
//  Created by Alok Sinha on 26/11/2015.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSPopUpViewController.h"
#import "CSWebController.h"
#import "CSConstants.h"


@interface CSPopUpViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnPersonalBanking;
@property (weak, nonatomic) IBOutlet UIButton *btnBussinessBanking;
@property (weak, nonatomic) IBOutlet UILabel *popuplabel;
@property (weak, nonatomic) IBOutlet UILabel *headerpopLabel;

@end

@implementation CSPopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.btnPersonalBanking.titleLabel setFont:kButtonTitleFont];
    [self.btnBussinessBanking.titleLabel setFont:kButtonTitleFont];
    [self.popuplabel setFont: kBodyTextFont];
    
    // Halifax does not have the support Business InternetBanking. Hideing Business Button for Halifax
    if ([Branding isHalifax]) {
        [self.btnBussinessBanking setHidden:YES];
    }
    
    // Vaishali
  
    [self.btnPersonalBanking setBackgroundColor:kDefaultButtonColor];
    [self.btnBussinessBanking setBackgroundColor:kDefaultButtonColor];

    [self.headerpopLabel setFont: kTabTitleFont];
    
    [self.popuplabel setText:NSLocalizedStringWithDefaultValue(@"popup_Label", NULL, [NSBundle mainBundle], @"Don't forget to log off at the end of your session", NULL)];
    [self.headerpopLabel setText:NSLocalizedStringWithDefaultValue(@"headerpop_Label", NULL, [NSBundle mainBundle], @"Internet Banking", NULL)];
    
    [self.btnPersonalBanking setTitle:NSLocalizedStringWithDefaultValue(@"btn_Personal", NULL, [NSBundle mainBundle], @"Personal", null) forState:UIControlStateNormal];
     
    [self.btnBussinessBanking setBackgroundColor:kDefaultButtonColor];
    [self.btnBussinessBanking setTitle:NSLocalizedStringWithDefaultValue(@"btn_Business", NULL, [NSBundle mainBundle], @"Business", null) forState:UIControlStateNormal];
    
    
    self.view.superview.layer.cornerRadius = 0;//for removing the corner radius of popover

}
-(void)loadIBJourneyForURL:(NSString *)theURL
{
    /********* THIS METHOD would handle PROD vs TEST URLS**********/
    
    [self dismissViewControllerAnimated:NO completion:^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"InternetBankingLoginPage" bundle:[NSBundle mainBundle]];
        
        CSWebController *loginPage= [storyboard instantiateViewControllerWithIdentifier:@"InternetBankingWebPage"];
        
        // If login url is not set (from backend selection environment view controller) then set the production url
        if (!self.loginUrl) {
            loginPage.strUrl = theURL;
        }else{ /*****RETIAL URL********/
            if ([theURL isEqualToString:kInternetBankingPersonalSite]) {
                loginPage.strUrl = [self.loginUrl objectForKey:@"retailUrl"];

            }else{ /*****BUSINESS URL********/
                loginPage.strUrl = [self.loginUrl objectForKey:@"businessUrl"];

            }
        }
        
        UINavigationController *navigationControllerForWebview=[[UINavigationController alloc]initWithRootViewController:loginPage];
        navigationControllerForWebview.navigationBarHidden=NO;
        [self.parentNavigationController presentViewController:navigationControllerForWebview animated:YES completion:^{
            
             // Added for dismissal of popover
             if(self.baseClass)
             [self.baseClass dismissPopUp];
        }];
         
    }];
    
    
}



-(IBAction)personalButtonClicked:(id)sender {


    [self loadIBJourneyForURL:kInternetBankingPersonalSite];
    
}

-(IBAction)businessButtonClicked:(id)sender {
    [self loadIBJourneyForURL:kInternetBankingBusinessSite];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
