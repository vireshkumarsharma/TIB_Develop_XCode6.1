//
//  CSinternetBankingWebPage.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSWebController.h"
//#import "UIColor+Utility.h"

#define kCancelButtonSpaceBetweenTitleAndImage 16.0

@interface CSWebController ()
@end
@implementation CSWebController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *urlForBanking=[NSURL URLWithString:self.strUrl];
    
    NSURLRequest *loginRequest=[NSURLRequest requestWithURL:urlForBanking];
    [self.webViewInternetBanking loadRequest:loginRequest];
    loadingIndicatorView=[[UIActivityIndicatorView alloc]init];
    loadingIndicatorView.color=kNavigationBarColor;
    loadingIndicatorView.frame=CGRectMake(0, 0, 30, 30);
    loadingIndicatorView.center=self.view.center;
    [self.webViewInternetBanking addSubview:loadingIndicatorView];
    [loadingIndicatorView hidesWhenStopped];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didRotate)
                                                 name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self initNavigationBar];

    UIButton *backButton=[self.navigationController.navigationBar addButtonWithFrame:CGRectMake(self.navigationController.navigationBar.frame.size.width-18*8, 0, 15*8, self.navigationController.navigationBar.frame.size.height) Title:@"Close" image_nullable:[UIImage imageNamed:@"close.pdf"]  color:nil imagePosition:imagePositionLeft andSpace:kCancelButtonSpaceBetweenTitleAndImage];

    
    [self.navigationController.navigationBar setFontForButton:backButton font:kNavBarTitlesFont];
    [backButton addTarget:self action:@selector(backButtonClickedOnWebpage) forControlEvents:UIControlEventTouchUpInside];
    

    _backButton=[self.navigationController.navigationBar addButtonWithFrame:CGRectMake(3*8, 0,  8*8, self.navigationController.navigationBar.frame.size.height) Title:nil image_nullable:[UIImage imageNamed:@"goBack.pdf"] color:nil imagePosition:imagePositionNil andSpace:0.0];
    
    [_backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_backButton];
     _backButton.alpha = 0.4;
    

    _forwardButton=[self.navigationController.navigationBar addButtonWithFrame:CGRectMake(11*8, 0,  8*8, self.navigationController.navigationBar.frame.size.height) Title:nil image_nullable:[UIImage imageNamed:@"goForward.pdf"] color:nil imagePosition:imagePositionNil andSpace:0.0];
    [_forwardButton addTarget:self action:@selector(forwardButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
     _forwardButton.alpha=0.4;
    
    self.title  =   NSLocalizedStringWithDefaultValue(@"Web-Navigation-Title", NULL, [NSBundle mainBundle], @"Lloyds-Bank", NULL);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
#pragma mark Web View Delegates

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    self.webViewInternetBanking.scalesPageToFit = YES;
    
    [loadingIndicatorView startAnimating];
    return YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [loadingIndicatorView stopAnimating];
    
    // For Back actions
    if(webView.canGoBack == YES)
    {
         //_backButton.highlighted = NO;
         _backButton.alpha = 1.0;
        _backButton.enabled = YES;

    }
    else
    {
        //_backButton.highlighted = YES;
        _backButton.alpha =0.4;
        _backButton.enabled = NO;
        
    }
    
    // For forward actions
    if(webView.canGoForward == YES)
    {
         //_forwardButton.highlighted = NO;
         _forwardButton.alpha = 1.0;
        _forwardButton.enabled = YES;
       
       
    }
    else
    {
        //_forwardButton.highlighted = YES;
         _forwardButton.alpha = 0.4;
        _forwardButton.enabled = NO;
        
    }
    
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [loadingIndicatorView stopAnimating];
    //UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
   // label.textAlignment=NSTextAlignmentCenter;
   // label.center=webView.center;
   // label.text=@"Failed to load page";
   // [self.webViewInternetBanking addSubview:label];
    
}

-(void) backButtonClickedOnWebpage
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark naviganation on webview

//method for going backwards in the webpage history
-(void)backButtonPressed:(id)sender {
    [_webViewInternetBanking goBack];
}

//method for going forward in the webpage history
-(void)forwardButtonPressed:(id)sender
{
    [_webViewInternetBanking goForward];
    
}

#pragma mark OrientationChange


-(void)didRotate
{
    loadingIndicatorView.center=self.view.center;
}
@end
