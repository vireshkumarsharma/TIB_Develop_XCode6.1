//
//  CSInternetBankingViewController.m
//  CustomerApp
//
//  Created by Anil K on 10/30/15.
//  Copyright © 2015 lloyds. All rights reserved.
//

#import "CSInternetBankingViewController.h"
#import "CSWebController.h"
#import <TIBKit/TIBKit.h>
#import "GeneralErrorViewControllerFactory.h"

@interface CSInternetBankingViewController ()

@end

@implementation CSInternetBankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.segmentControl.numberOfSegment =4;
    
    self.widthConstraint.constant = self.view.frame.size.width*0.65;
    

    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
      [self setLoginButton];
    [self setBackButton];

    [self.navigationController.navigationBar addCustomNavigationBarButtonOfType:customSMSButton];
    
}



-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    self.segmentControl.titles =[[NSMutableArray alloc] initWithObjects:@"Everyday Banking",@"Digital Services",@"Convenience",@"Help & Support", nil];
    self.segmentControl.delegate =self;
    [self.segmentControl drawSegmentControl];

}


-(void) tappedSegmentControl:(TIBSegmentControl *)segmentControl onIndex :(NSUInteger ) index{
    
    switch (index) {
        case 0:
            TIBLog(@"Print 0");

            break;
        case 1:
            TIBLog(@"Print 1");

            break;
        case 2:
            TIBLog(@"Print 2");

            break;
        default:
            break;
    }
    /*********** THIS IS FOR UNIT TESTING ONLY ******************/
    //[self.navigationController pushViewController:[GeneralErrorViewControllerFactory  createErrorScreenWithErrorType : index] animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
