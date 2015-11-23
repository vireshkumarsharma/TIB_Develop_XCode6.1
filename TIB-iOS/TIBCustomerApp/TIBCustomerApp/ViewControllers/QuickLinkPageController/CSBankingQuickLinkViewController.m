//
//  CSQuickLinkViewController.m
//  CustomerApp
//
//  Created by Anil K on 10/26/15.
//  Copyright © 2015 lloyds. All rights reserved.
//

#import "CSBankingQuickLinkViewController.h"

@interface CSBankingQuickLinkViewController (){
    int leftXPadding;
    CGRect collectionViewframe;
}

@end

@implementation CSBankingQuickLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void) createUI{
    // Do any additional setup after loading the view.
    
    // If the block size is not being set up by the super class
    if (iBlockSize == 0){
        iBlockSize = 50;
    }
        
    leftXPadding = 30;
    
     collectionViewframe = CGRectZero;
    
    
    if (style == PageStyleInternetBanking) {
        collectionViewframe = CGRectMake(leftXPadding-10, 408, 468,318);

    }else{
        collectionViewframe = CGRectMake(leftXPadding-10, 408, 500 ,318);
    }
    
    
    [self createCollectionViewWithFrame:collectionViewframe andEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)];

    [self drawTable];
    
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#81BFB8"];
    
    
    [self createLabels];
    
    if (style == PageStyleInternetBanking){
        self.lblHeader.text= [@"What is Internet Banking?" uppercaseString];
        self.lblDetailHeader.text= @"Manage your finances more effectively on a host of devices...";

    }else if (style == PageStyleProducts){
        self.lblHeader.text= [@"Our Products & Services" uppercaseString];
        self.lblDetailHeader.text= @"Lloyds have many products that can help you manage your finances...";

    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSDictionary *views = [[NSDictionary alloc] initWithObjectsAndKeys:self.tblCustomerDetails,@"table",self.lblHeader,@"title"
                           ,self.lblDetailHeader,@"subTitle", nil];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[title(<=318)]->=10-[table(==320)]-30-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[table(>=580)]" options:NSLayoutFormatDirectionMask metrics:nil views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[title(<=200)]->=10-[subTitle(==50)]" options:NSLayoutFormatAlignAllLeft metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[subTitle(==318)]" options:NSLayoutFormatAlignAllLeft metrics:nil views:views]];
    
    [self changeViewWithNewSize:self.view.frame.size];
    
    
      self.collectionView.frame =collectionViewframe;
    
    


}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}


-(void) createLabels{
    
    CGRect tableFrame = self.tblCustomerDetails.frame;
    
    UILabel *lblTempHeader = [[UILabel alloc]initWithFrame:CGRectMake(leftXPadding, tableFrame.origin.y, self.collectionView.frame.size.width-150, 200)];
    self.lblHeader = lblTempHeader;
    self.lblHeader.textColor = [UIColor whiteColor];
    self.lblHeader.font = [UIFont fontWithName:@"Helvetica-Bold" size:48];
    self.lblHeader.translatesAutoresizingMaskIntoConstraints = NO;

    
    [self.view addSubview:self.lblHeader];
 
    
    UILabel *lblDetailTempHeader = [[UILabel alloc]initWithFrame:CGRectMake(leftXPadding, self.lblHeader.frame.origin.y + self.lblHeader.frame.size.height+5, self.collectionView.frame.size.width-150, 50)];
    self.lblDetailHeader = lblDetailTempHeader;
    self.lblDetailHeader.textColor = [UIColor whiteColor];
    self.lblDetailHeader.font = [UIFont fontWithName:@"Helvetica" size:15];
    self.lblDetailHeader.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:self.lblDetailHeader];
    
    self.lblHeader.numberOfLines = 0;
    self.lblDetailHeader.numberOfLines = 0;
    
    
}



- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator{
    
    [self changeViewWithNewSize:size];
    
}



-(void) changeViewWithNewSize:(CGSize)size{
    // iPad Portrait view
    
    
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];

    
    
  [UIView animateWithDuration:0.3 animations:^{
      
      if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight) {
          self.collectionView.frame = CGRectMake(20, 408, 468,318);

      }
      else {
          self.collectionView.frame = CGRectMake(20, 700, 468,318);
      }
      
  } completion:^(BOOL finished) {
      
  }];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) drawTable{
 
    UITableView *tempTable = [[UITableView alloc] initWithFrame:CGRectZero];
    tempTable.backgroundColor =[UIColor colorWithHexString:@"#034735"];
    self.tblCustomerDetails = tempTable;
    self.tblCustomerDetails.delegate=self;
    self.tblCustomerDetails.dataSource =self;
    self.tblCustomerDetails.translatesAutoresizingMaskIntoConstraints = NO;
    self.tblCustomerDetails.layer.borderColor = [UIColor blackColor].CGColor;
    self.tblCustomerDetails.layer.borderWidth = 1.0f;
    [self.view addSubview:self.tblCustomerDetails];
    
}


#pragma mark Tableview Delegates
#pragma mark

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
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
    
    
    cell.translatesAutoresizingMaskIntoConstraints = NO;
    cell.textLabel.text = model.strTitle;
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.backgroundColor=model.backGroundColor;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSArray *arrView = [[NSBundle mainBundle] loadNibNamed:@"CSHomePageTableHeaderView" owner:self options:nil];
    
    UIView *vwHeader = nil;
    UILabel *lblHeader = nil;
    
    if (arrView.count > 0) {
        vwHeader = [arrView firstObject];
    }
    
    if (vwHeader) {
        vwHeader.backgroundColor=[UIColor colorWithHexString:@"#034735"];
        if ([[vwHeader viewWithTag:100] isKindOfClass:[UILabel class]]) {
            lblHeader = (UILabel *)[vwHeader viewWithTag:100];
        }
    }
    
    
    if (lblHeader) {
        if (style == PageStyleInternetBanking){
            lblHeader.text=@"KEY THINGS I CAN DO";
        }else if (style == PageStyleProducts){
            lblHeader.text=@"PRODUCT QUICK LINKS";
        }
        lblHeader.textColor=[UIColor colorWithHexString:@"#7CC513"];
    }
  
    return vwHeader;
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





- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}




@end
