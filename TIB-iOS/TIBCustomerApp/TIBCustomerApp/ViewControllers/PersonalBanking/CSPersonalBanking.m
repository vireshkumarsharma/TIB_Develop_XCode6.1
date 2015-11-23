//
//  InternetBankingViewController.m
//  CustomerApp
//
//  Created by Anil K on 10/26/15.
//  Copyright © 2015 lloyds. All rights reserved.
//

#import "CSInternetBankingViewController.h"
#import "CSPersonalBanking.h"
#import "CSSecurityPageViewController.h"
#import "CSWebController.h"

@interface CSPersonalBanking()

@end

@implementation CSPersonalBanking

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    style = PageStyleInternetBanking;
    
    objTableDataSource= [[TableDataSource alloc] init];
    objTableDataSource.pageType = InternetBanking;
    [objTableDataSource createTableData];
    
    
    [self createUI];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setBackButton];
    [self setLoginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) pushNewScreen{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"CSInternetBanking" bundle:[NSBundle mainBundle]];
    
    CSInternetBankingViewController *internetBankingViewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CSInternetBankingViewController class])];
    
    [self.navigationController pushViewController:internetBankingViewController animated:YES];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        [self pushNewScreen];
    }else{
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                    @"CSSecurity" bundle:[NSBundle mainBundle]];
        
        CSSecurityPageViewController *spvc = [storyboard instantiateViewControllerWithIdentifier:@"TESTsecurity"];
        
        [self.navigationController pushViewController:spvc animated:YES];
    }
}



@end
