//
//  CSProductQuickLinkViewController.m
//  QuiltDemo
//
//  Created by Anil Kothari
//  Copyright (c) 2015 Anil Kothari. All rights reserved.
//

#import "CSProductQuickLinkViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "TileDataSource.h"
#import "CustomTile.h"
#import "CSDetailViewController.h"
#import "TableDataSource.h"
#import "TableModel.h"
#import "CustomCell.h"
#import "CSMasterDetailViewController.h"
#import "CSWebController.h"

@interface CSProductQuickLinkViewController () <UICollectionViewDelegate> {
    BOOL isAnimating;
    TileDataSource *objTileDataSource;
    TableDataSource *objTableDataSource;
    
    int iBlockSize;
    UICollectionViewCell *previousSelectedCell;
    
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewProducts;

@end

int num = 0;

@implementation CSProductQuickLinkViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self datasInit];
 
    
    
    iBlockSize = 50;
    
    [self.collectionViewProducts registerClass:[CustomTile class] forCellWithReuseIdentifier:NSStringFromClass([CustomTile class])];
    [self.collectionView registerClass:[CustomTile class] forCellWithReuseIdentifier:NSStringFromClass([CustomTile class])];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    
    
    TilesLayout* layout = (id)[self.collectionView collectionViewLayout];
    layout.delegate = self;
    layout.direction = UICollectionViewScrollDirectionVertical;
    layout.blockPixels = CGSizeMake(iBlockSize,iBlockSize);
    
    
    self.heightConstraint1.constant = self.heightConstraint.constant = iBlockSize *6 +18;
    self.widthConstraint1.constant = self.widthConstraint.constant = iBlockSize *9 +18;
    
    [self.collectionView reloadData];
    
    self.collectionViewProducts.backgroundColor = [UIColor clearColor];
    
    TilesLayout* tilesLayout = (id)[self.collectionViewProducts collectionViewLayout];
    tilesLayout.delegate = self;
    tilesLayout.direction = UICollectionViewScrollDirectionVertical;
    tilesLayout.blockPixels = CGSizeMake(iBlockSize,iBlockSize);
    
    [self.collectionViewProducts reloadData];
    
    
    self.tblViewOnRight.showsVerticalScrollIndicator=NO;
    //    [self.tblViewOnRight setBounces:NO];
    self.tblViewOnRight.separatorColor=[UIColor colorWithHexString:@"#022E3E"];
    self.tblViewOnRight.allowsSelection=NO;
    
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setLoginButton];
    [self setBackButton];
    [self.navigationController.navigationBar addCustomNavigationBarButtonOfType:customSMSButton];
    
}






-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.navigationController.navigationItem.leftBarButtonItem=nil;
    
}
- (void)datasInit {
    objTileDataSource = [[TileDataSource alloc] init];
    [objTileDataSource createData];
    objTableDataSource= [[TableDataSource alloc] init];
    [objTableDataSource createTableData];
}


#pragma mark - UICollectionView Datasource


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomTile *cell = (CustomTile *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    if (previousSelectedCell) {
        //        previousSelectedCell.contentView.backgroundColor = [UIColor whiteColor];
        previousSelectedCell.layer.shadowOpacity = 0;
    }
    
    [cell showScaleAnimation];
    
    previousSelectedCell  =cell;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"CSDetailVC" bundle:[NSBundle mainBundle]];
    CSDetailViewController *dtc = [storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    
    [self makeCollectionViewFrame:dtc];
    
    [self.navigationController pushViewController:dtc animated:YES];
    
}

-(void) makeCollectionViewFrame : (CSDetailViewController *) dtc
{
    dtc.items = 4;
    
    dtc.cellIdentifier=@"CustomCell";
    
    // dtc.cellSize = CGSizeMake(1020, 800);
    
    dtc.topMargin=0;
    
    dtc.leadMargin=-20;
    
    dtc.collectionViewSize = CGSizeMake(self.view.frame.size.width,self.view.frame.size.height-self.navigationController.navigationBar.frame.size.height-37-15);
    
    //  dtc.collectionViewSize = CGSizeMake(300,300);
    
}


- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    NSInteger count =  view == self.collectionView?  objTileDataSource.arrDataModels.count : objTileDataSource.arrDataModelsTiles.count;
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTile *cell = (CustomTile *)[cv dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomTile class]) forIndexPath:indexPath];
    
    [cell.contentView removeConstraints:cell.contentView.constraints];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    if (cv == self.collectionView) {
        if (indexPath.row == 0) {
            cell.style = UICollectionViewCellStyleSubtitle;
        }else{
            cell.style = UICollectionViewCellStyleDefault;
        }
    }else{
        cell.style = UICollectionViewCellStyleDefault;
    }
    
    TileModal *modal ;
    
    if (cv == self.collectionView) {
        modal = objTileDataSource.arrDataModels[indexPath.row];
        [cell setDataFromModal:modal];
        [cell createConstraints:modal];
    }else{
        modal = objTileDataSource.arrDataModelsTiles[indexPath.row];
        [cell setDataFromModal:modal];
        [cell createConstraints:modal];
    }
    if (modal.backGroundColor) {
        cell.bgView.backgroundColor = modal.backGroundColor;
        cell.contentView.backgroundColor = modal.backGroundColor;
        
    }
    
    
    return cell;
}


#pragma mark – TilesLayoutDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout tileSizeAtIndexPath:(NSIndexPath *)indexPath{
    TileModal *modal = collectionView == self.collectionView? objTileDataSource.arrDataModels[indexPath.row] : objTileDataSource.arrDataModelsTiles[indexPath.row];
    return   modal.blockSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetsForTileAtIndexPath:(NSIndexPath *)indexPath{
    UIEdgeInsets edgeInsets = collectionView == self.collectionView? UIEdgeInsetsMake(4,4,4,4)  : UIEdgeInsetsMake(4,4,4,4);
    return edgeInsets;
    
}

#pragma mark - Helper methods

- (NSNumber *)randomLengthForWidth:(BOOL) width forIndex:(int) Index
{
    NSArray *arr = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Frame" ofType:@"plist"]];
    NSDictionary *dict  = arr[0];
    if (width) {
        return dict[@"Width"];
    }else{
        return dict[@"Height"];
    }
}

#pragma mark Tableview Delegates
#pragma mark

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0f;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100.0f;
}




#pragma mark Tableview DataSource
#pragma mark

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return objTableDataSource.arrDataModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    TableModel *model=objTableDataSource.arrDataModels[indexPath.row];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = model.strTitle;
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.backgroundColor=model.backGroundColor;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *viewForHeader=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 60.0)];
    viewForHeader.backgroundColor=[UIColor colorWithHexString:@"#034735"];
    viewForHeader.text=@"KEY THINGS I CAN DO";
    viewForHeader.textAlignment=NSTextAlignmentCenter;
    viewForHeader.textColor=[UIColor colorWithHexString:@"#7CC513"];
    return viewForHeader;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIScrollView *sclrView=[[UIScrollView alloc] initWithFrame:CGRectMake(0,0, tableView.frame.size.width, 85)];//Scoll view at the footer of table
    sclrView.contentSize=CGSizeMake(3*sclrView.frame.size.width, 85);
    sclrView.pagingEnabled=YES;
    sclrView.delegate=self;
    sclrView.autoresizesSubviews=YES;
    sclrView.autoresizingMask=0|1|3|4|5;
    
    if (_strURLforTableFooter==nil) {
        _strURLforTableFooter=@"https://www.apple.com";
    }
    
    UIWebView *view1=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 90)];
    NSURL *urlForFooter=[[NSURL alloc]initWithString:_strURLforTableFooter];
    NSURLRequest *requestForFooter=[[NSURLRequest alloc] initWithURL:urlForFooter];
    [view1 loadRequest:requestForFooter];
    [sclrView addSubview:view1];
    [sclrView setShowsHorizontalScrollIndicator:NO];
    view1.autoresizingMask=0|1|3|4|5;
    
    
    UIWebView *view2=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 90)];
    [view2 loadRequest:requestForFooter];
    
    [sclrView addSubview:view2];
    view2.autoresizingMask=0|1|3|4|5;
    
    UIWebView *view3=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 90)];
    [view3 loadRequest:requestForFooter];
    
    [sclrView addSubview:view3];
    view3.autoresizingMask=0|1|3|4|5;
    
    
    pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0,90,tableView.frame.size.width,10);
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
    pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
    pageControl.pageIndicatorTintColor=[UIColor colorWithHexString:@"#677E7B"];
    pageControl.autoresizingMask=0|1|3|4|5;
    
    UIView *viewForFooter=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    viewForFooter.backgroundColor=[UIColor colorWithHexString:@"#034735"];
    [viewForFooter addSubview:sclrView];
    [viewForFooter addSubview:pageControl];
    
    
    return viewForFooter;
}

#pragma mark Scrollview Delegates

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //For change of current page in page controller
    
    CGFloat pageWidth = scrollView.frame.size.width; // you need to have a **iVar** with getter for scrollView
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    pageControl.currentPage = page;
    
}



@end
