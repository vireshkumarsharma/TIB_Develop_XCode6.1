//
//  UINavigationBar+CustomerAppNavigationBar.h
//  CustomerApp
//
//  Created by Viresh on 10/12/15.
//  Copyright © 2015 lloyds. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStatusBarViewTag 1001

typedef NS_ENUM(NSInteger, imagePosition) {
    imagePositionLeft,
    imagePositionRight,
    imagePositionNil
};

typedef NS_ENUM(NSInteger, customBackButtonOfType) {
    
    customBackButtonOnLeftOfBar,
    customLoginButtonOnRightOfBar,
    customSMSButton
    
};

@interface UINavigationBar (CustomerAppNavigationBar) 

//@property (nonatomic, strong)     UINavigationController * currentNav;

//-(UIColor *) changeColorWithRed;

-(void) customizeNavigationBarForNavigationController:(UINavigationController *) naviagtionBar presentingViewController:(UIViewController *) viewController;
-(UIButton *) addButtonWithFrame: (CGRect) frame  Title:(NSString *) title image_nullable:( UIImage *) imgForButton color:(UIColor *) color imagePosition:(imagePosition) imagePosition andSpace:(CGFloat)spacing;
-(UIButton *) addCustomNavigationBarButtonOfType:(customBackButtonOfType) buttonType;
-(void) setFontForButton: (UIButton *) button font:(UIFont *) font;
@end
