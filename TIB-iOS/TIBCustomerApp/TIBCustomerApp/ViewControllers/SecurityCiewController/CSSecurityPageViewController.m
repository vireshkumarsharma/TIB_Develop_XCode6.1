//
//  CSsecurityPageViewController.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSSecurityPageViewController.h"
#import "CSStayingSecureOnline.h"
#import "CSWebController.h"



@interface CSSecurityPageViewController ()

@end

@implementation CSSecurityPageViewController



-(IBAction)segmentcontrolpressed:(id)sender{
    
    if(_segmentControl.selectedSegment == 0)         // Checking which segment is selected using the segment index value
        
    {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                    @"CSSecurity" bundle:[NSBundle mainBundle]];
        
        CSSecurityPageViewController *ContrllerWebPage = [storyboard instantiateViewControllerWithIdentifier:@"TESTSECURE"];
        
        [self.navigationController pushViewController:ContrllerWebPage animated:YES];
        
        
    }
    
    else
        
        if(_segmentControl.selectedSegment == 1)
            
        {
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                        @"CSSecurity" bundle:[NSBundle mainBundle]];
            
            CSStayingSecureOnline *ContrllerWebPage = [storyboard instantiateViewControllerWithIdentifier:@"TESTSECURE"];
            
            [self.navigationController pushViewController:ContrllerWebPage animated:YES];
            
            
        }
    
        else
            
            if(_segmentControl.selectedSegment == 2)
                
            {
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                            @"CSSecurity" bundle:[NSBundle mainBundle]];
                
                CSStayingSecureOnline *ContrllerWebPage = [storyboard instantiateViewControllerWithIdentifier:@"TESTSECURE"];
                
                [self.navigationController pushViewController:ContrllerWebPage animated:YES];
                
            }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.segmentControl.numberOfSegment =3;
    self.segmentControl.titles =[[NSMutableArray alloc] initWithObjects:@"Our Guarantee", @"SSO", @"Things to look for", nil];
    [self.segmentControl drawSegmentControl];
    

    
    // testimgview.image=[UIImage imageNamed:@"Guarantee.png"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setLoginButton];
    [self setBackButton];
    [self.navigationController.navigationBar addCustomNavigationBarButtonOfType:customSMSButton];
    
}




@end
