//
//  CSmodalShoppingPage.h
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CSmodalShoppingPage : NSObject

@property (nonatomic, strong) UIImage *imgTile;
@property (nonatomic, strong) UIImage *imgIcon;
@property (nonatomic, copy) NSString *strTitle;
@property (nonatomic, copy) NSString *strSubTitle;
@property (nonatomic, assign) CGSize blockSize;

@property (nonatomic, strong) UIColor *backGroundColor;

-(instancetype)initWithImage:(UIImage *)img imageForIconOnTop:(UIImage *) imgIcon withTitle:(NSString *)strTitle andSubTitle:(NSString *)strSubTitle;
@end
