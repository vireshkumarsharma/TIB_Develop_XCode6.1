//
//  UINavigationBar+CustomerAppNavigationBar.m
//  CustomerApp
//
//  Created by Viresh on 10/12/15.
//  Copyright © 2015 lloyds. All rights reserved.
//

#import "UINavigationBar+TIBNavigationBar.h"
#import <objc/runtime.h>
#import "UIColor+Utility.h"

#define kBackButtonSpaceBetweenTitleAndImage 0.0
#define kLoginButtonSpaceBetweenTitleAndImage 16.0

//Need to Maintain RHS Padding 48 as per VD... Plz change the formula for generic logic.
#define kLoginButtonWidth   128
#define kLoginButtonFrame CGRectMake(self.frame.size.width-(kLoginButtonWidth+24), 0, 128, self.frame.size.height)

@implementation UINavigationBar (CustomerAppNavigationBar)



//This function provides background colour to navigation bar & status bar. This function should  be called before placing any button on the bar, else it will remove the button. 
-(void) customizeNavigationBarForNavigationController:(UINavigationController *) naviagtionController presentingViewController:(UIViewController *) viewController
{
    
   // [[self subviews]makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(statusBarFrameChanged) name:@"UIApplicationDidChangeStatusBarFrameNotification" object:nil];
    [[self.superview viewWithTag:kStatusBarViewTag] removeFromSuperview];
    
    
//    [self setBackgroundColor:[UIColor colorWithHexString:kNavigationBarColor]];
    UIView *viewForStatusBar=[[UIView alloc] initWithFrame:[UIApplication sharedApplication].statusBarFrame];
    viewForStatusBar.tag=kStatusBarViewTag;
    [[self superview]addSubview:viewForStatusBar];
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    [viewController.navigationItem setHidesBackButton:YES];
    
}

#pragma mark Creating Custom Button
#pragma mark

//This function adds button with given frame on the navigation bar. 1st parameter is frame of the button, 2nd parameter is title of the button, 3rd parameter is the image to be placed on the button, 4th parameter gives color of the button and the 5th parameter is to determine whether the image needs to be placed  to the left or right of the title. This fuction returns the instance of button to add target of any other customization.

-(UIButton *) addButtonWithFrame: (CGRect) frame  Title:(NSString *) title image_nullable:( UIImage *) imgForButton color:(UIColor *) color imagePosition:(imagePosition) imagePosition andSpace:(CGFloat)spacing {
    UIButton* btnForBar;
    btnForBar=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnForBar.frame=frame;
    btnForBar.backgroundColor=color;
    btnForBar.tintColor=[UIColor whiteColor];
    
    if(title==nil && imgForButton)
    {
        [btnForBar setImage:imgForButton forState:UIControlStateNormal];
        btnForBar.tintColor=[UIColor whiteColor];
        btnForBar.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    else if(imgForButton && title)
    {
    [btnForBar setImage:imgForButton forState:UIControlStateNormal];
    btnForBar.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    btnForBar.tintColor=[UIColor whiteColor];
    btnForBar.titleEdgeInsets = UIEdgeInsetsMake(0, spacing*2, 0, 0);
    btnForBar.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btnForBar setTitle:title forState:UIControlStateNormal];

    }
    else if(imgForButton==nil && title)
    {
        [btnForBar setTitle:title forState:UIControlStateNormal];
   
    }
    [self addSubview:btnForBar];
    return btnForBar;
}




//This function adds predefined customised button on the navigation bar, it return the instance of the button for further customization. The parameter being passed is enumeratuin for type of predefined custom button

-(UIButton *) addCustomNavigationBarButtonOfType:(customBackButtonOfType) buttonType
{
    
    UIButton * btnOnBar;
    
    
    if (buttonType==customBackButtonOnLeftOfBar) {
        btnOnBar=[self addButtonWithFrame:CGRectMake(0, 0, self.frame.size.width/7, self.frame.size.height) Title:NSLocalizedStringWithDefaultValue(@"Navigation_BackBtn", nil, [NSBundle mainBundle], @"Back", nil) image_nullable:[UIImage imageNamed:@"bckbtn.png"] color:nil imagePosition:imagePositionLeft andSpace:kBackButtonSpaceBetweenTitleAndImage];
    }
    else if (buttonType==customLoginButtonOnRightOfBar){
        btnOnBar=[self addButtonWithFrame:kLoginButtonFrame Title:NSLocalizedStringWithDefaultValue(@"Navigation_LoginBtn", nil, [NSBundle mainBundle], @"Log on", nil) image_nullable:[UIImage imageNamed:@"lock_small_white.pdf"]  color:nil imagePosition:imagePositionLeft andSpace:kLoginButtonSpaceBetweenTitleAndImage];
    }
    else if (buttonType==customSMSButton){
        btnOnBar=[self addButtonWithFrame:CGRectMake(self.frame.size.width*4/6, 0, self.frame.size.width/6, self.frame.size.height) Title:@"Send SMS/Email Link" image_nullable:nil  color:nil imagePosition:imagePositionNil andSpace:0.0];
    }
    
    
    return btnOnBar;
}



- (void)statusBarFrameChanged
{
    [self.superview viewWithTag:kStatusBarViewTag].frame=[UIApplication sharedApplication].statusBarFrame;
}

-(void) setFontForButton: (UIButton *) button font:(UIFont *) font
{
    BOOL check=0; //To check if button has UILabel on it and font style has been set
    for (UIView *viewOnButton in [button subviews]) {
        if ([viewOnButton isKindOfClass:[UILabel class]]) {
            UILabel *tempLabel=(UILabel *)viewOnButton;
            tempLabel.font=font;
            check=1;
        }
    }
    
    if (check==0) {
        [button.titleLabel setFont:font];
    }
}


@end
