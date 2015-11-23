//
//  TilesLayout.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TilesLayoutDelegate <UICollectionViewDelegate>
@optional

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout tileSizeAtIndexPath:(NSIndexPath *)indexPath;

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetsForTileAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface TilesLayout : UICollectionViewLayout

@property (nonatomic, weak) IBOutlet NSObject<TilesLayoutDelegate>* delegate;

@property (nonatomic, assign) CGSize blockPixels;

@property (nonatomic, assign) UICollectionViewScrollDirection direction;

@property (nonatomic) BOOL prelayoutEverything;

@end
