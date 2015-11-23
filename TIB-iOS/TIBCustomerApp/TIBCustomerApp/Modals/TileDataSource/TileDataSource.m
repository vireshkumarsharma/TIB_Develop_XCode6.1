//
//  TileDataSource.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//


#import "TileDataSource.h"
#import "TileModal.h"
#import "CSmodalShoppingPage.h"
#import <TIBKit/UIColor+Utility.h>


@implementation TileDataSource


-(void) createData{
    [self createTileData];
    [self createTileData1];
    [self createCarouselData];
    [self createShoppingTilesData];
}
-(void) createShoppingTilesData{
    
    
    NSArray *arrDataSource = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"ShoppingTiles" ofType:@"plist"]];
    
    if (!self.arrShoppingTiles) {
        self.arrShoppingTiles = [[NSMutableArray alloc] init];
    }
    [self createTileModel:arrDataSource];
    
//    for (NSDictionary *dict in arrDataSource) {
//        CSmodalShoppingPage *model = [[CSmodalShoppingPage alloc]initWithImage:[UIImage imageNamed:dict[@"imageForRight"]] imageForIconOnTop:[UIImage imageNamed:dict[@"imageForIcon"]] withTitle:dict[@"title"] andSubTitle:dict[@"subtitle"] ];
//        model.blockSize = CGSizeMake([dict[@"Width"] floatValue], [dict[@"Height"] floatValue]);
//        model.backGroundColor = [UIColor colorWithHexString:dict[@"bgColor"]];
//        [self.arrShoppingTiles addObject:model];
//    }
    
    
}

-(void) createTileModel:(NSArray *) dataSourceForModel
{
    for (NSDictionary *dict in dataSourceForModel) {
        CSmodalShoppingPage *model = [[CSmodalShoppingPage alloc]initWithImage:[UIImage imageNamed:dict[@"imageForRight"]] imageForIconOnTop:[UIImage imageNamed:dict[@"imageForIcon"]] withTitle:dict[@"title"] andSubTitle:dict[@"subtitle"] ];
        model.blockSize = CGSizeMake([dict[@"Width"] floatValue], [dict[@"Height"] floatValue]);
        model.backGroundColor = [UIColor colorWithHexString:dict[@"bgColor"]];
        [self.arrShoppingTiles addObject:model];
    }
    
}

-(void) createTileData{
    
    NSArray *arrDataSource = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TilesData" ofType:@"plist"]];
    
    if (!self.arrDataModels) {
        self.arrDataModels = [[NSMutableArray alloc] init];
    }
    
    for (NSDictionary *dict in arrDataSource) {
        TileModal *model = [[TileModal alloc] initWithImage:[UIImage imageNamed:dict[@"image"]] withTitle:dict[@"title"] andSubTitle:dict[@"subtitle"]];
        model.blockSize = CGSizeMake([dict[@"Width"] floatValue], [dict[@"Height"] floatValue]);
        model.backGroundColor = [UIColor colorWithHexString:dict[@"bgColor"]];
        [self.arrDataModels addObject:model];
    }
    
}

-(void) createCarouselData{
    
    NSArray *arrDataSource = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Tiles_Carousel" ofType:@"plist"]];
    
    if (!self.arrCarouselTiles) {
        self.arrCarouselTiles = [[NSMutableArray alloc] init];
    }
    
    for (NSDictionary *dict in arrDataSource) {
        TileModal *model = [[TileModal alloc] initWithImage:[UIImage imageNamed:dict[@"image"]] withTitle:dict[@"title"] andSubTitle:dict[@"subtitle"]];
        model.blockSize = CGSizeMake([dict[@"Width"] floatValue], [dict[@"Height"] floatValue]);
        model.backGroundColor = [UIColor colorWithHexString:dict[@"bgColor"]];
        [self.arrCarouselTiles addObject:model];
    }
    
}


-(void) createTileData1{
    
    NSArray *arrDataSource = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Tiles" ofType:@"plist"]];
    
    if (!self.arrDataModelsTiles) {
        self.arrDataModelsTiles = [[NSMutableArray alloc] init];
    }
    
    for (NSDictionary *dict in arrDataSource) {
        TileModal *model = [[TileModal alloc] initWithImage:[UIImage imageNamed:dict[@"image"]] withTitle:dict[@"title"] andSubTitle:dict[@"subtitle"]];
        model.blockSize = CGSizeMake([dict[@"Width"] floatValue], [dict[@"Height"] floatValue]);
        model.backGroundColor = [UIColor colorWithHexString:dict[@"bgColor"]];
        
        [self.arrDataModelsTiles addObject:model];
    }
    
}



@end