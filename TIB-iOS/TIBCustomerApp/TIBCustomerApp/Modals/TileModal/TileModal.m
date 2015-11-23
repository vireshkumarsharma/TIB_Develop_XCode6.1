//
//  TileModal.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "TileModal.h"

@implementation TileModal


-(instancetype)initWithImage:(UIImage *)img withTitle:(NSString *)strTitle andSubTitle:(NSString *)strSubTitle{
    self = [super init];
    if (self) {
        self.strSubTitle = strSubTitle;
        self.strTitle = strTitle;
        self.imgIcon = img;
    }
    return self;
}


@end