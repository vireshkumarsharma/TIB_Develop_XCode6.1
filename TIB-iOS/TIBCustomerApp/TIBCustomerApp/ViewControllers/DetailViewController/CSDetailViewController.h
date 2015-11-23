//
//  CSdetailViewController.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSMasterDetailViewController.h"
#import <TIBKit/TIBKit.h>
#import "CSBaseViewController.h"

@interface CSDetailViewController : CSBaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *testCollection;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSString *cellIdentifier;
@property (nonatomic) CGSize collectionViewSize;
@property (nonatomic) CGSize cellSize;
@property (nonatomic) CGFloat leadMargin;
@property (nonatomic) CGFloat topMargin;
@property (assign) NSInteger items;
@property (nonatomic,strong) CSMasterDetailViewController *mdvc;

@property (nonatomic,weak) IBOutlet NSLayoutConstraint *leadMarginCV;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *topMarginCV;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *bottomMarginPC;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *widthCV;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *heightCV;

@end

