//
//  CSPageStyleViewController.m
//  QuiltDemo
//
//  Created by Anil Kothari
//  Copyright (c) 2015 Anil Kothari. All rights reserved.
//

#import "CSPageStyleViewController.h"


@interface CSPageStyleViewController ()  {
    
}

@end


@implementation CSPageStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}



-(void) createCollectionViewWithFrame:(CGRect)frame andEdgeInsets:(UIEdgeInsets)edgeInset{
    [self datasInit];
    
    
    // Added By Adesh
    // If the block size is not being set up by the super class
    if (iBlockSize == 0){
        iBlockSize = 50;
    }
    
    
    edgeInsets = edgeInset;
    
    
    TilesLayout *layout = [[TilesLayout alloc]init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    self.collectionView.collectionViewLayout = layout;
    
    
    
    [self.view addSubview: self.collectionView];
    
    switch (style) {
        case PageStyleInternetBanking:
            [self.collectionView registerClass:[CustomTile class] forCellWithReuseIdentifier:NSStringFromClass([CustomTile class])];
            break;
        case PageStyleProducts:
            [self.collectionView registerClass:[CustomTile class] forCellWithReuseIdentifier:NSStringFromClass([CustomTile class])];
            break;
        case PageStyleShopping:
            [self.collectionView registerClass:[CSShoppingPageTile class] forCellWithReuseIdentifier:NSStringFromClass([CSShoppingPageTile class])];
            break;
        default:
            break;
    }
    
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    
    layout = (id)[self.collectionView collectionViewLayout];
    layout.delegate = self;
    layout.direction = UICollectionViewScrollDirectionVertical;
    layout.blockPixels = CGSizeMake(iBlockSize,iBlockSize);
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
}

- (void)datasInit {
    objTileDataSource = [[TileDataSource alloc] init];
    [objTileDataSource createData];
}


#pragma mark - UICollectionView Datasource


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //    CustomTile *cell = (CustomTile *)[collectionView cellForItemAtIndexPath:indexPath];
    //    cell.contentView.backgroundColor = [UIColor clearColor];
    //
    //    if (previousSelectedCell) {
    //        previousSelectedCell.layer.shadowOpacity = 0;
    //    }
    //
    //    [cell showScaleAnimation];
    //
    //    previousSelectedCell  =cell;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    switch (style) {
        case PageStyleInternetBanking:
            return  objTileDataSource.arrDataModels.count;
            break;
        case PageStyleProducts:
            return  objTileDataSource.arrDataModelsTiles.count;
            break;
        case PageStyleShopping:
            return  objTileDataSource.arrShoppingTiles.count;
            break;
            
        default:
            break;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTile *cell = (CustomTile *)[cv dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomTile class]) forIndexPath:indexPath];
    
    [cell.contentView removeConstraints:cell.contentView.constraints];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    
    
    TileModal *modal ;
    
    if (style == PageStyleInternetBanking) {
        modal = objTileDataSource.arrDataModels[indexPath.row];
        if (indexPath.row == 0) {
            cell.style = UICollectionViewCellStyleSubtitle;
        }else{
            cell.style = UICollectionViewCellStyleDefault;
        }
    }else if (style == PageStyleProducts) {
        modal = objTileDataSource.arrDataModelsTiles[indexPath.row];
        cell.style = UICollectionViewCellStyleDefault;
    }
    else if (style == PageStyleShopping){
        modal = objTileDataSource.arrShoppingTiles[indexPath.row];
        cell.style = UICollectionViewCellStyleDefault;
    }
    
    [cell setDataFromModal:modal];
    [cell createConstraints:modal];
    
    
    if (modal.backGroundColor) {
        cell.bgView.backgroundColor = modal.backGroundColor;
        cell.contentView.backgroundColor = modal.backGroundColor;
        
    }
    
    
    return cell;
}


#pragma mark – TilesLayoutDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout tileSizeAtIndexPath:(NSIndexPath *)indexPath{
    //TileModal *modal = style == PageStyleInternetBanking? objTileDataSource.arrDataModels[indexPath.row] : objTileDataSource.arrDataModelsTiles[indexPath.row];
    
    TileModal *modal = nil ;
    
    switch (style) {
        case PageStyleInternetBanking:
            modal = objTileDataSource.arrDataModels[indexPath.row];
            break;
        case PageStyleProducts:
            modal = objTileDataSource.arrDataModelsTiles[indexPath.row];
            break;
        case PageStyleShopping:
            modal = objTileDataSource.arrShoppingTiles[indexPath.row];
            break;
            
        default:
            break;
    }
    
    return   modal.blockSize;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetsForTileAtIndexPath:(NSIndexPath *)indexPath{
    return edgeInsets;
}



@end
