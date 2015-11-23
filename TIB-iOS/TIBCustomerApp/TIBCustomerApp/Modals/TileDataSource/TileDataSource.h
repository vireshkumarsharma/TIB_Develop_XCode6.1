//
//  TileDataSource.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TileDataSource : NSObject

@property (nonatomic,strong) NSMutableArray *arrDataModels;
@property (nonatomic,strong) NSMutableArray *arrDataModelsTiles;
@property (nonatomic,strong) NSMutableArray *arrCarouselTiles;
@property (nonatomic,strong) NSMutableArray *arrShoppingTiles;

-(void) createData;
@end
