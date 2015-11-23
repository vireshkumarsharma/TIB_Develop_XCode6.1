//
//  CSinternetBankingWebPage.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSBaseViewController.h"

@interface CSWebController : CSBaseViewController <UIWebViewDelegate>

{
    UIActivityIndicatorView *loadingIndicatorView;
}
@property(nonatomic,weak)IBOutlet UIButton *backButton;
@property(nonatomic,weak)IBOutlet UIButton *forwardButton;


@property (weak, nonatomic) IBOutlet UIWebView *webViewInternetBanking;
@property (strong,nonatomic) NSString *strUrl;

@end
