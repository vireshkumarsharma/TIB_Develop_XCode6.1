//
//  TableDataSource.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TIBKit/UIColor+Utility.h>

typedef enum : NSUInteger {
    InternetBanking,
    Products
} PageType;


@interface TableDataSource : NSObject{
    PageType pageType;
}

@property (nonatomic,strong) NSMutableArray *arrDataModels;//contains item for data of different rows
@property (nonatomic,assign) PageType pageType;

-(void) createTableData;
@end