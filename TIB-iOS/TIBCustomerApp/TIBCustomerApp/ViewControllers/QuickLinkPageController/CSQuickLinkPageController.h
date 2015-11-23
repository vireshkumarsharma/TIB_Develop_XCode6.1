//
//  CSQuickLinkPageController.h
//  CustomerApp
//
//  Created by Anil K on 10/26/15.
//  Copyright © 2015 lloyds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableModel.h"
#import "CSPageStyleViewController.h"



@interface CSQuickLinkPageController : CSPageStyleViewController <UITableViewDelegate, UITableViewDataSource> {
    UIPageControl *pageControl;
    
}

-(void) createUI;


@property (strong, nonatomic) NSString *strURLforTableFooter;
@property (weak, nonatomic) UITableView *tblCustomerDetails;
@property (weak, nonatomic) UILabel *lblHeader;
@property (weak, nonatomic) UILabel *lblDetailHeader;

@end
