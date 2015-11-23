//
//  CSmasterDetailViewController.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSBaseViewController.h"

@interface CSMasterDetailViewController : CSBaseViewController
{

}
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentcontrol;
@property (nonatomic, weak) IBOutlet UIView *testview;
@property (nonatomic,weak) IBOutlet UIButton *findOutMore;

-(IBAction)findOutMorebtnpressed:(id)sender;
-(IBAction)clicksegmentedcontrol:(id)sender;

@end
