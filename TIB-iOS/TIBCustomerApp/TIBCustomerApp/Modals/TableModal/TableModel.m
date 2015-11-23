//
//  TableModel.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "TableModel.h"

@implementation TableModel

-(instancetype) initWithTilte:(NSString *) strTitle
{
    //This function creates model for one row
    self = [super init];
    if (self) {
        self.strTitle = strTitle;
    }
    return self;
    
}
@end
