//
//  TableModel.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <TIBKit/UIColor+Utility.h>

@interface TableModel : NSObject

@property NSString *strTitle;//stores title for row

@property (nonatomic, strong) UIColor *backGroundColor;//stores background color

-(instancetype) initWithTilte:(NSString *) strTitle; //creates model for one row

@end
