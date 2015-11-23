//
//  CSInternetBankingViewController.h
//  CustomerApp
//
//  Created by Anil K on 10/30/15.
//  Copyright © 2015 lloyds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TIBKit/TIBKit.h>
#import "CSPageStyleViewController.h"

@interface CSInternetBankingViewController : CSPageStyleViewController <SegmentControlDelegate>

@property (nonatomic, weak) IBOutlet TIBSegmentControl *segmentControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

@end
