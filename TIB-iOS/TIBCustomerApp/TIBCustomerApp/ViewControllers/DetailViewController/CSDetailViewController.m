//
//  CSdetailViewController.m
//  TIBCustomerApp
//
//  Created by Vaishali Gupta on 11/3/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#define Items 3
#define MarginConstant 4
#import "CSdetailViewController.h"
#import "CustomCell.h"
#import "CSWebController.h"



@implementation CSDetailViewController


#pragma mark uiScrollViewDelegates
#pragma mark

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.testCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:self.cellIdentifier];
    
    [self makingCollectionViewFrameWithPageControl];
    
   
}

-(void) makingCollectionViewFrameWithPageControl
{
    
    _pageControl.numberOfPages=self.items;
    
    self.leadMarginCV.constant = self.leadMargin;
    
    self.topMarginCV.constant = self.topMargin;
    
    // self.bottomMarginPC.constant = self.topMargin;
    
    self.widthCV.constant = self.collectionViewSize.width;
    
    self.heightCV.constant = self.collectionViewSize.height;
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setBackButton];
    [self setLoginButton];
    
}


-(void) viewDidAppear:(BOOL)animated
{
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat pageWidth = scrollView.frame.size.width; // you need to have a **iVar** with getter for scrollView
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    _pageControl.currentPage = page;
    
}

#pragma mark UICollectionViewDelegates

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    // return self.items;
    return  self.items;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Adjust cell size for orientation
    if (indexPath.row==0)
        return CGSizeMake(self.testCollection.frame.size.width-10*MarginConstant, self.testCollection.frame.size.height);
    
    return CGSizeMake(self.testCollection.frame.size.width, self.testCollection.frame.size.height);
    
    // return self.cellSize;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static BOOL nibMyCellloaded = NO;
    
    if(!nibMyCellloaded)
    {
        UINib *nib = [UINib nibWithNibName:self.cellIdentifier bundle: nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:self.cellIdentifier];
        nibMyCellloaded = YES;
    }
    UICollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    // self.selectedCell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    // self.selectedCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //   for (UIView *vc in cell.contentView.subviews)
    //    {
    //        [vc removeFromSuperview];
    //    }
    
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(50, 40, cell.frame.size.width-20, cell.frame.size.height-40)];
    text.textColor = [UIColor whiteColor];
    text.textAlignment=NSTextAlignmentCenter;
    text.font = [UIFont systemFontOfSize:40];
    text.numberOfLines=0;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"CustomerApp" bundle:[NSBundle mainBundle]];
    
    self.mdvc = [storyboard instantiateViewControllerWithIdentifier:@"TestMDVC"];
    
    
    
    if (indexPath.row==0)
    {
        cell.backgroundColor=[UIColor colorWithHexString:@"#DE526C"];
        //cell.cellLabel.text = @"SHOPPING & SOCIAL";
        text.text=@"SHOPPING & SOCIAL";
    }
    
    else if (indexPath.row==1)
    {
        cell.backgroundColor=[UIColor colorWithHexString:@"#3581B2"];
        //cell.cellLabel.text = @"WAYS TO ACCESS";
        text.text=@"WAYS TO ACCESS";
    }
    
    else if (indexPath.row==2)
    {
        cell.backgroundColor=[UIColor colorWithHexString:@"#72A417"];
        //cell.cellLabel.text = @"BE SECURE ONLINE";
        text.text=@"BE SECURE ONLINE";
        
    }
    
    else
    {
        cell.backgroundColor=[UIColor colorWithHexString:@"#14473B"];
        text.text=@"End.";
    }
    
    //    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    //    recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    
    // [cell.contentView addSubview:text];
    // self.mdvc.view.frame = cell.frame;
    
    [self addChildViewController:self.mdvc];
    
    [cell addSubview:self.mdvc.view];
    
    return cell;
}


-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.testCollection reloadData];
    
    
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    
}

-(void) backButtonClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end