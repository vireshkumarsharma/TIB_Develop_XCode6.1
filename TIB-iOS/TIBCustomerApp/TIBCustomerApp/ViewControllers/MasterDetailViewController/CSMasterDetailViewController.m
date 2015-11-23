//
//  CSmasterDetailViewController.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSMasterDetailViewController.h"
#import "CSShoppingPageLayoutViewController.h"
#import "CSWebController.h"
@implementation CSMasterDetailViewController

@synthesize segmentcontrol, testview,findOutMore;


-(IBAction)findOutMorebtnpressed:(id)sender{
    
    CSShoppingPageLayoutViewController *shoppingPage=[[CSShoppingPageLayoutViewController alloc] init];
    [self.navigationController pushViewController:shoppingPage animated:YES];
}


-(IBAction)clicksegmentedcontrol:(id)sender{
    if(segmentcontrol.selectedSegmentIndex == 0)         // Checking which segment is selected using the segment index value
        
    {
        
        self.testview.backgroundColor = [UIColor redColor];     // Change the background color to red
        
    }
    
    else
        
        if(segmentcontrol.selectedSegmentIndex == 1)
            
        {
            
            self.testview.backgroundColor = [UIColor greenColor];
            
        }
    
        else
            
            if(segmentcontrol.selectedSegmentIndex == 2)
                
            {
                
                self.testview.backgroundColor = [UIColor blueColor];
                
            }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
       [self setBackButton];
      [self setLoginButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

