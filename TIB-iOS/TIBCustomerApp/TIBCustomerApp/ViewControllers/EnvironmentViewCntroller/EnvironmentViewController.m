//
//  EnvironmentViewController.m
//  TIBCustomerApp
//
//  Created by Gangaraju on 11/13/15.
//



#import "EnvironmentViewController.h"
#import "Branding.h"
#import "CSHubPageController.h"

#define kLogoImageName @"lloyds_logo.pdf"


@interface EnvironmentViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *environmentTableView;

//@property (weak, nonatomic) IBOutlet UIView *appBrand;

//@property (weak, nonatomic) IBOutlet UIView *appVersion;

//@property (nonatomic,strong) NSString * unauthGalaxyURL;
@property (nonatomic,strong) NSDictionary * unauthGalaxyURL;
@property (nonatomic,strong) NSMutableArray *environments;
@end

@implementation EnvironmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void) viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    UIImageView *imageViewForLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:kLogoImageName]];
    imageViewForLogo.frame=CGRectMake(48, self.navigationController.navigationBar.frame.size.height/2.0-[UIImage imageNamed:kLogoImageName].size.height/2.0+1.0, [UIImage imageNamed:kLogoImageName].size.width, [UIImage imageNamed:kLogoImageName].size.height);
    [self.navigationController.navigationBar addSubview:imageViewForLogo];
    //[self setBrandTitleWithImageButton:[UIImage imageNamed:@"lloyds_logo.pdf"]];
    
    //     [self.btnPersonalBanking setTitleColor:kCarButtonUpperBarColor forState:UIControlStateNormal];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
#ifndef BACKENDSELECTION
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CustomerApp" bundle:[NSBundle mainBundle]];

    CSHubPageController *vc= [storyboard instantiateViewControllerWithIdentifier:@"CSHubPageController"];

    [self.navigationController pushViewController:vc animated:NO];
    
#else

    [self.navigationController.navigationBar customizeNavigationBarForNavigationController:self.navigationController presentingViewController:self];
    [self.navigationController.navigationBar setBackgroundColor:kNavigationBarColor];
    
    self.tabBarController.navigationItem.hidesBackButton=YES;
    
    NSString *strBrandTitle =   NSLocalizedStringWithDefaultValue(@"Navigation_Title", nil, [NSBundle mainBundle], @"BrandName", nil);
    
    UIButton * buttonForLogo=(UIButton *)[self.navigationController.navigationBar addButtonWithFrame:CGRectMake(0, 0, self.view.frame.size.width/6, self.navigationController.navigationBar.frame.size.height) Title:strBrandTitle image_nullable:[UIImage imageNamed:@"LloydsLogo.png"] color:self.navigationController.navigationBar.backgroundColor imagePosition:imagePositionRight andSpace:0.0];
    
    buttonForLogo.enabled=NO;
    
    if (![Branding isHalifax]) {
       /* UIButton *loginButton=[self.navigationController.navigationBar addCustomNavigationBarButtonOfType:customLoginButtonOnRightOfBar];
        [loginButton addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [loginButton setBackgroundColor:self.navigationController.navigationBar.backgroundColor];*/
    }
    
    // Do any additional setup after loading the view from its nib.
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"Environments" ofType:@"plist"];
    
    self.environments = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    
    
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.environments.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"selection";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    NSDictionary *envInfo = [self.environments objectAtIndex:indexPath.row];
    [cell.textLabel setText:[envInfo valueForKey:@"title"]];
//    [cell.detailTextLabel setText:[envInfo valueForKey:@"url"]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    self.unauthGalaxyURL = [self.environments objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"pushhubpage" sender:nil];
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CSHubPageController *hubPageViewController = [segue destinationViewController];
    hubPageViewController.unAuthUrl = self.unauthGalaxyURL;
    
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

