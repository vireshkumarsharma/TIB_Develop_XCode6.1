//
//  CSPageStyleViewController.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TilesLayout.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomTile.h"
#import "TileDataSource.h"
#import "TableDataSource.h"

#import "CSShoppingPageTile.h"
#import "CSBaseViewController.h"

typedef enum : NSUInteger {
    PageStyleInternetBanking,
    PageStyleProducts,
    PageStyleShopping,
    PageStyleEveryDayBanking,
    PageStyleDigitalService,
    PageStyleConvenience,
    PageStyleHelpAndsupport
} PageStyle;


@interface CSPageStyleViewController : CSBaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,TilesLayoutDelegate>{
    BOOL isAnimating;
    TileDataSource *objTileDataSource;
    int iBlockSize;
    UICollectionViewCell *previousSelectedCell;
    UIEdgeInsets edgeInsets;
    TableDataSource *objTableDataSource;
    
    PageStyle style;
    
}


@property (nonatomic,strong)  UICollectionView *collectionView ;

-(void) createCollectionViewWithFrame:(CGRect)frame andEdgeInsets:(UIEdgeInsets)edgeInset;

@end
