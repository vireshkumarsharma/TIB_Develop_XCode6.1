//
//  CLAuthenticationViewController.m
//  TIBColleagueApp
//
//  Created by Gangaraju on 11/10/15.


#import "CLAuthenticationViewController.h"
#import "CLPowaViewController.h"
#import <TIBKit/TIBKit.h>

@interface CLAuthenticationViewController ()

@end
NSArray *deviceList;

@implementation CLAuthenticationViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:kPageBackgroundColor];
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    deviceList = [[PowaPEDManager sharedManager] getAvailablePEDs];
    
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)initiateCardReader:(id)sender {
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    
    if([segue.identifier isEqualToString:@"PowaPIN"])
    {
        CLPowaViewController *powaViewController = (CLPowaViewController *)[segue destinationViewController];
      
        if (deviceList.count) {
            TIBLog(@"DEVICE%@",deviceList);
            powaViewController.device = [deviceList objectAtIndex:0];

        }
           }
}

@end
