//
//  CStileForShoppingPage.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSmodalShoppingPage.h"

@interface CSShoppingPageTile : UICollectionViewCell



@property (nonatomic, weak)  UIImageView *imvTile;
@property (nonatomic, weak)  UIImageView *imvIcon;
@property (nonatomic, weak)  UILabel *lblTitle;
@property (nonatomic, weak)  UILabel *lblSubTitle;


-(void) setDataFromModalForShoppingPage:(CSmodalShoppingPage*) modal;

-(void) setConstraints;

@end
