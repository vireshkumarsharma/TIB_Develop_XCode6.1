//
//  CSsecurityPageViewController.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TIBKit/TIBKit.h>
#import "CSBaseViewController.h"

@interface CSSecurityPageViewController : CSBaseViewController


@property (nonatomic ,strong) TIBSegmentControl *segmentControl;
@property (nonatomic, strong) IBOutlet UIImageView *testimgview;

-(IBAction)segmentcontrolpressed:(id)sender;

@end
