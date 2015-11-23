//
//  CLPowaViewController.h
//  TIBColleagueApp
//
//  Created by Gangaraju on 11/10/15.

#import <UIKit/UIKit.h>
#import "PowaPINSDK/PowaPINSDK.h"
#import <TIBKit/TIBKit.h>

@interface CLPowaViewController : UIViewController <PowaPINObserver>
{
}

@property (nonatomic, retain) PowaPINDeviceInfo *device;

@property (retain, nonatomic) IBOutlet UITextView *logView;

@end
