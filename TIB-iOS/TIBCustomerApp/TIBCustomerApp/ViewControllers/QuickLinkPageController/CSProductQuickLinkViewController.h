//
//  CSProductQuickLinkViewController.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TilesLayout.h"
#import <TIBKit/TIBKit.h>
#import "CSBaseViewController.h"

@interface CSProductQuickLinkViewController : CSBaseViewController <TilesLayoutDelegate, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    UIPageControl *pageControl;
    
}
@property (strong, nonatomic) NSString *strURLforTableFooter;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint1;
@property (weak, nonatomic) IBOutlet UITableView *tblViewOnRight;

@end