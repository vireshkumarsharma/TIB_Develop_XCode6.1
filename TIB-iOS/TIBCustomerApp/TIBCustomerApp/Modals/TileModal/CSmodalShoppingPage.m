//
//  CSmodalShoppingPage.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSmodalShoppingPage.h"

@implementation CSmodalShoppingPage

-(instancetype)initWithImage:(UIImage *)img imageForIconOnTop:(UIImage *) imgIcon withTitle:(NSString *)strTitle andSubTitle:(NSString *)strSubTitle{
    self = [super init];
    if (self) {
        self.imgTile=img;
        self.strSubTitle = strSubTitle;
        self.strTitle = strTitle;
        self.imgIcon = imgIcon;
    }
    return self;
}

@end