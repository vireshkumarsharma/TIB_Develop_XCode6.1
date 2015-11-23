//
//  TIBBrandConstant.h
//  TIBKit
//
//  Created by Mobile Developer Lloyds Bank on 05/11/2015.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+Utility.h"
/**
 * BrandConstant class is responsible for all Brand Specific UIChanges.
 * It will allow to set FontName, FontSize, Screen Colors and UIControl constant Height and Width.
 * In defins inside the MACRO so that only brand specific ui will reflect in each brand
 */


extern const CGFloat kStatusBarHeight;
extern const CGFloat kNavigationBarHeight;
extern const CGFloat kSquareButtonsWidth;
extern const CGFloat kSquareButtonsHeight;



#pragma mark ---- LLoyds Style ----
#if LLO
#pragma mark Fonts
#define LLOJACKRegular                            @"LloydsBankJack"
#define LLOJACKLight                              @"LloydsBankJack-Light"
#define LLOJACKMedium                             @"LloydsBankJack-Medium"
#define LLOJACKBOLD                               @"LloydsBankJack-Bold"

#define kPageTitleFont                      [UIFont fontWithName:LLOJACKBOLD size:90]
#define kPageSubTitleFont                   [UIFont fontWithName:LLOJACKRegular size:20]
#define kNavBarTitlesFont                   [UIFont fontWithName:LLOJACKMedium size:18]
#define kTabTitleFont                       [UIFont fontWithName:LLOJACKMedium size:18]
#define kSectionTitleFont                   [UIFont fontWithName:LLOJACKMedium size:20]
#define kSectionTitle_MediumFont            [UIFont fontWithName:LLOJACKMedium size:25]
#define kSectionTitle_BigFont               [UIFont fontWithName:LLOJACKMedium size:42]
#define kButtonTitleFont                    [UIFont fontWithName:LLOJACKMedium size:20]
#define kButtonSubTitleFont                 [UIFont fontWithName:LLOJACKLight size:18]
#define kBodyTextFont                       [UIFont fontWithName:LLOJACKLight size:18]


#pragma mark Colors
#define kStatusBarColor                             ColorFromHexCode(@"#024731")    //Dark Green
#define kNavigationBarColor                         ColorFromHexCode(@"#006A4D")    //Core Green
#define kPageBackgroundColor                        ColorFromRGB(0x006A4D)
#define kHeadlineColor                              ColorFromHexCode(@"#323233")
#define kBodyTextColor                              ColorFromHexCode(@"#505050")
#define kDividerKeyLineColor                        ColorFromHexCode(@"#D8D8D8")
#define kSiteBackgoundColor                         ColorFromHexCode(@"#000000")
#define kDefaultButtonColor                         ColorFromHexCode(@"#649C00")    //Apple Green
#define kSecondaryButtonColor                       ColorFromHexCode(@"#006A4D")    //Core Green
#define kErrorrAndWarningColor                      ColorFromHexCode(@"#DC2A4D")    //RED
#define kViewBackgroundColor                        ColorFromHexCode(@"#024731")    //Dark Green


#pragma mark ---- BOS Style ----
#elif BOS
#pragma mark Fonts
//Need to Change When We will receive the VD & Style Guide
#define BOSPill_Gothi_Bold                          @"BoSPillGothicNGA-Bold"
#define BOSAvenir_Regular                           @"AvenirNextLBG-Regular"
#define BOSAvenir_SemiBold                          @"AvenirNext-SemiBoldTracked"
#define BOSAvenir_Bold                              @"AvenirNext-BoldTracked"
#define BOSAvenir_Medium                            @"AvenirNext-MediumTracked"
#define BOSAvenir_Tracked                           @"AvenirNext-Tracked"
//Need to Change When We will receive the VD & Style Guide. Just to varify using lloydsFont
#define kPageTitleFont                      [UIFont fontWithName:BOSPill_Gothi_Bold size:90]
#define kPageSubTitleFont                   [UIFont fontWithName:BOSAvenir_Regular size:20]
#define kNavBarTitlesFont                   [UIFont fontWithName:BOSAvenir_Medium size:18]
#define kTabTitleFont                       [UIFont fontWithName:BOSAvenir_Medium size:18]
#define kSectionTitleFont                   [UIFont fontWithName:BOSAvenir_Medium size:20]
#define kSectionTitle_MediumFont            [UIFont fontWithName:BOSAvenir_Medium size:25]
#define kSectionTitle_BigFont               [UIFont fontWithName:BOSAvenir_Medium size:42]
#define kButtonTitleFont                    [UIFont fontWithName:BOSAvenir_Medium size:20]
#define kButtonSubTitleFont                 [UIFont fontWithName:BOSAvenir_Regular size:18]
#define kBodyTextFont                       [UIFont fontWithName:BOSAvenir_Regular size:14]

#pragma mark Colors
#define kStatusBarColor                             ColorFromHexCode(@"#0D5595")    //Dark Blue
#define kNavigationBarColor                         ColorFromHexCode(@"#05286A")
#define kPageBackgroundColor                        ColorFromRGB(0x14377d)
#define kHeadlineColor                              ColorFromHexCode(@"#323233")
#define kBodyTextColor                              ColorFromHexCode(@"#505050")
#define kDividerKeyLineColor                        ColorFromHexCode(@"#D8D8D8")
#define kSiteBackgoundColor                         ColorFromHexCode(@"#000000")
#define kDefaultButtonColor                         ColorFromHexCode(@"#2178B0")    //Light Blue
#define kSecondaryButtonColor                       ColorFromHexCode(@"#05286A")    //Blue
#define kErrorrAndWarningColor                      ColorFromHexCode(@"#DC2A4D")    //RED
#define kViewBackgroundColor                        ColorFromHexCode(@"#05286A")    //NavBar Color


#pragma mark  ---- Halifax Style ----
#elif HAL
#pragma mark Fonts
//Need to Change When We will receive the VD & Style Guide
#define HAL_Helvetica_LTCom                         @"HelveticaNeueLTCom-Bd"
#define HAL_Helvetica_LTRoman                       @"HelveticaNeueLT-Roman"
#define HAL_Helvetica_Medium                        @"HelveticaNeueMedium"
#define HAL_Helvetica_Heavy                         @"HelveticaNeueHeavy"
#define HAL_Helvetica_LT55_RomanBook                @"HelveticaNeueLT55Roman-Book"
//Need to Change When We will receive the VD & Style Guide. Just to varify using OneFont
#define kPageTitleFont                      [UIFont fontWithName:HAL_Helvetica_Medium size:90]
#define kPageSubTitleFont                   [UIFont fontWithName:HAL_Helvetica_Medium size:20]
#define kNavBarTitlesFont                   [UIFont fontWithName:HAL_Helvetica_Medium size:18]
#define kTabTitleFont                       [UIFont fontWithName:HAL_Helvetica_Medium size:18]
#define kSectionTitleFont                   [UIFont fontWithName:HAL_Helvetica_Medium size:20]
#define kSectionTitle_MediumFont            [UIFont fontWithName:HAL_Helvetica_Medium size:25]
#define kSectionTitle_BigFont               [UIFont fontWithName:HAL_Helvetica_Medium size:42]
#define kButtonTitleFont                    [UIFont fontWithName:HAL_Helvetica_Medium size:20]
#define kButtonSubTitleFont                 [UIFont fontWithName:HAL_Helvetica_LTRoman size:18]
#define kBodyTextFont                       [UIFont fontWithName:HAL_Helvetica_LTRoman size:12]

#pragma mark Colors
#define kStatusBarColor                             ColorFromHexCode(@"#0040BB")    //Dark Blue
#define kNavigationBarColor                         ColorFromHexCode(@"#002d89")    //Dark Blue
#define kPageBackgroundColor                        ColorFromRGB(0x0b1e7f)
#define kHeadlineColor                              ColorFromHexCode(@"#323233")
#define kBodyTextColor                              ColorFromHexCode(@"#505050")
#define kDividerKeyLineColor                        ColorFromHexCode(@"#D8D8D8")
#define kSiteBackgoundColor                         ColorFromHexCode(@"#000000")
#define kDefaultButtonColor                         ColorFromHexCode(@"#002d89")    //HAL BLUE
#define kSecondaryButtonColor                       ColorFromHexCode(@"#D24702")    //Orange
#define kErrorrAndWarningColor                      ColorFromHexCode(@"#DC2A4D")    //RED
#define kViewBackgroundColor                        ColorFromHexCode(@"#0040BB")    //Dark Blue

#endif

/**
 * ColorFromRGB() Method is used to convert the HEX-Color value into UIColor Object.
 * It returns the UIColor Object so that iOS can consume. Mentioned hardcoded value in this method is just methmatical formula.
 */
#define ColorFromRGB(rgbValue)  [UIColor colorWithRed : ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0 green : ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0 blue : ((CGFloat)(rgbValue & 0xFF)) / 255.0 alpha : 1.0]

#define ColorFromHexCode(haxCode)  [UIColor colorWithHexString:haxCode]