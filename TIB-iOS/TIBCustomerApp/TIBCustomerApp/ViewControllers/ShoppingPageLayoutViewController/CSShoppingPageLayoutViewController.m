//
//  CSshoppingPageLayoutViewController.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import "CSShoppingPageLayoutViewController.h"
#import "CSShoppingPageTile.h"
#import "CSmodalShoppingPage.h"
#import "CSWebController.h"

@interface CSShoppingPageLayoutViewController ()

@end
@implementation CSShoppingPageLayoutViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imvForCollectionHeader=[[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x -400, 164, 800, 200)];
    imvForCollectionHeader.image=[UIImage imageNamed:@"DummyImageforshoppingPage.png"];
    /*  imvForCollectionHeader.backgroundColor=[UIColor blueColor];
     UILabel *lblForTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 20, 320, 160)];
     lblForTitle.backgroundColor=[UIColor colorWithHexString:@"#08553F"];
     lblForTitle.textAlignment=NSTextAlignmentCenter;
     lblForTitle.text=@"SHOPPING & SOCIAL";
     [viewForCollectionHeader addSubview:lblForTitle];*/
     [self.view addSubview:imvForCollectionHeader];
    
   
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setLoginButton];
    [self setBackButton];
    [self.navigationController.navigationBar addCustomNavigationBarButtonOfType:customSMSButton];
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    iBlockSize = 80;
    style = PageStyleShopping;
    [self createCollectionViewWithFrame:CGRectMake(self.view.center.x - 400, 64+60+240, 800, 350) andEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    self.collectionView.backgroundColor =[UIColor colorWithHexString:@"#EFEBE8"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CSShoppingPageTile *cell = (CSShoppingPageTile *)[cv dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CSShoppingPageTile class]) forIndexPath:indexPath];
    
    [cell.contentView removeConstraints:cell.contentView.constraints];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    CSmodalShoppingPage *modal ;
    
    modal = objTileDataSource.arrShoppingTiles[indexPath.row];
    
    [cell setDataFromModalForShoppingPage:modal];
    [cell setConstraints];
    
    return cell;
}



@end
