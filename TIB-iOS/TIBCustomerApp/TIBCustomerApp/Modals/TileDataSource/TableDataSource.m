//
//  TableDataSource.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "TableDataSource.h"
#import "TableModel.h"

@implementation TableDataSource

-(void) createTableData{
    
    //Creates array of items for different rows
    
    NSArray *arrDataSource = nil;
    
    
    
    if (self.pageType == InternetBanking) {
        arrDataSource = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Table" ofType:@"plist"]];
    }else if (self.pageType == Products) {
        arrDataSource = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TableProductList" ofType:@"plist"]];
        
    }
    
    
    if (!self.arrDataModels) {
        self.arrDataModels = [[NSMutableArray alloc] init];
    }
    [self createTableModal:arrDataSource];
   
    
}

-(void) createTableModal:(NSArray *) modalDataSource
{
    
    for (NSDictionary *dict in modalDataSource) {
        TableModel *model = [[TableModel alloc] initWithTilte:dict[@"Title"]];
        model.backGroundColor= [UIColor colorWithHexString:dict[@"BackgroundColor"]];
        [self.arrDataModels addObject:model];
    }
    
}


@end