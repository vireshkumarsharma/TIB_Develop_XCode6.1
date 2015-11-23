//
//  CLPowaViewController.m
//  TIBColleagueApp
//
//  Created by Gangaraju on 11/10/15.


#import "CLPowaViewController.h"
#import "PPMockServerApp.h"

#import "PowaPINSDK/PowaPINSDK.h"

@interface CLPowaViewController ()
@property (nonatomic, retain) PowaPIN *powaPIN;
@end

@implementation CLPowaViewController

#pragma mark - Init and dealloc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        TIBLog(@"%s", __PRETTY_FUNCTION__);
        
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{/*
    self.amountField = nil;
    self.logView = nil;
    [_refundAmountField release];
    self.device = nil;
    [super dealloc];*/
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    TIBLog(@"%s", __PRETTY_FUNCTION__);
    [self.view setBackgroundColor:kPageBackgroundColor];

    [super viewDidLoad];
    self.powaPIN = [[PowaPIN alloc] init];
    
    PPMockServerApp *mockServerApp = [[PPMockServerApp alloc] init];
    self.powaPIN.server = mockServerApp;
    
    // Do any additional setup after loading the view.
    
    if([((NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"firmwareUpdate"]) isEqualToString:@"1"]) {
        
       // _btnUpdateConfig.hidden = NO;
       // _btnUpdateFirmware.hidden = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    
    TIBLog(@"%s  --- %@", __PRETTY_FUNCTION__,self.device);
    [super viewWillAppear:animated];
    
    [self.powaPIN selectPED:self.device];
    [self.powaPIN addObserver:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Actions


- (IBAction)readCard:(id)sender
{
    self.logView.text = @"";
    
    @try {
        [self.powaPIN startOperationWithOperationType:PEDOperationTypeReadCard transDate:1234567];
        
    }
    @catch (NSException *exception) {
        TIBLog(@"Exception :%@",[exception description]);
    }
    
    
    
    
    
}

- (IBAction)clearLog:(id)sender
{
    self.logView.text = @"";
}



- (IBAction)updateFirmware:(id)sender {
    
    @try {
        
        NSString* path = [[NSBundle mainBundle] pathForResource:@"powapin_release" ofType:@"bin"];
        NSData *softwareUpdateData = [NSData dataWithContentsOfFile:path];
        NSUInteger packageLength = softwareUpdateData.length;
        
        if([[[NSUserDefaults standardUserDefaults] objectForKey:@"firmwareUpdate"] isEqualToString:@"1"]){
            
            [self.powaPIN.ped initPEDWithFirmwareVersion:@"10.0.0" newFirmware:softwareUpdateData firmwareSize:packageLength];
            
            
        }else{
            
            [self.powaPIN.ped initPEDWithFirmwareVersion:@"01.10.01" newFirmware:softwareUpdateData firmwareSize:packageLength];
            
        }
        
    }
    @catch (NSException *exception) {
        TIBLog(@"Exception :%@",[exception description]);
    }
    
    
    
}


///


- (IBAction)startUpdate:(id)sender {
    
    self.logView.text = @"";
    TIBLog(@"%s", __PRETTY_FUNCTION__);
    
    @try {
        [self.powaPIN.ped getPEDConfigurationStatus];
        
    }
    @catch (NSException *exception) {
        TIBLog(@"Exception :%@",[exception description]);
    }
    
}


- (IBAction)loginWithToken:(id)sender {
    
    self.logView.text = @"";
    TIBLog(@"%s", __PRETTY_FUNCTION__);
    
    @try {
        
        [self.powaPIN loginWithToken1:@"9999999999993" token2:@"N6eDq9qgaj" deviceID:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
        
        
    }
    @catch (NSException *exception) {
        TIBLog(@"Exception :%@",[exception description]);
    }
    
}


- (IBAction)sendReciept:(id)sender {
    
    self.logView.text = @"";
    TIBLog(@"%s", __PRETTY_FUNCTION__);
    
    @try {
        
        [self.powaPIN processReceiptWithTransactionID:@"2423" method:@"method" destination:@"email"];
        
    }
    @catch (NSException *exception) {
        TIBLog(@"Exception :%@",[exception description]);
    }
    
    
}

- (IBAction)sendAdditionalData:(id)sender {
    
    self.logView.text = @"";
    TIBLog(@"%s", __PRETTY_FUNCTION__);
    
    
    
    self.logView.text = @"";
    TIBLog(@"%s", __PRETTY_FUNCTION__);
    
    @try {
        
        [self.powaPIN setAdditionalDataWithTransactionID:@"1234" productImage:@"ImageData" productDescription:@"Product Description" latitude:@"87467823.234" longitude:@"278462378.234" transUTC:[[NSDate date] timeIntervalSince1970] customData:nil];
    }
    @catch (NSException *exception) {
        TIBLog(@"Exception :%@",[exception description]);
    }
    
}


#pragma mark - PowaPOSObserver

-(void)powaPIN:(PowaPIN *)powaPIN finishedTransactionWithResult:(int)result{
    
    TIBLog(@"%s---%i", __PRETTY_FUNCTION__, result);
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PowaPIN finished transaction"];
    
    switch (result) {
        case 0:
        {
            [string appendFormat:@"\n-- Result TRANSACTION_PROCESSED/APPROVED"];
            
        }
            break;
            
        case 9991:
        {
            [string appendFormat:@"\n-- Result CARD_DECLINED"];
            
        }
            break;
            
        case 9992:
        {
            [string appendFormat:@"\n-- Result CUSTOMER_CANCELLED"];
            
        }
            break;
            
        case 9993:
        {
            [string appendFormat:@"\n-- Result MALFUNCTION"];
            
        }
            break;
            
        case 9994:
        {
            [string appendFormat:@"\n-- Result TRANSACTION_DECLINED"];
            
        }
            break;
            
        case 9995:
        {
            [string appendFormat:@"\n-- Result AUTHORISATION_TIMEOUT"];
            
        }
            break;
            
        case 9996:
        {
            [string appendFormat:@"\n-- Result UNABLE_TO_COMPLETE"];
            
        }
            break;
            
            
            
        default:
            break;
    }
    
    self.logView.text = string;
}

-(void)powaPINStartedTransaction:(PowaPIN *)powaPIN
{
    
    TIBLog(@"%s", __PRETTY_FUNCTION__);
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PowaPIN started transaction"];
    
    self.logView.text = string;
}

#pragma mark - PED Observer (Transaction)
-(void)ped:(PowaPEDAbstract *)ped confirmedAmount:(BOOL)confirmed
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    if(confirmed)
    {
        [string appendFormat:@"\n-- PED amount confirmed"];
        
    }
    else
    {
        [string appendFormat:@"\n-- PED started transaction"];
    }
    self.logView.text = string;
}

-(void)ped:(PowaPEDAbstract *)ped selectedApplicationAtIndex:(NSUInteger)index
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED selected application"];
    self.logView.text = string;
    
}

- (void)pedCompletionAdviceWithData:(PowaPEDAbstract *)ped
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED completion advice"];
    
    self.logView.text = string;
    
}

- (void)ped:(PowaPEDAbstract *)ped requestedOnlineAuthorizationWithMaskedPan:(NSString *)maskedPan applicationLabel:(NSString *)applicationLabel
{
    TIBLog(@"########### PAN ########### %@", maskedPan);
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED requested online authorization"];
    
    self.logView.text = string;
    
}
-(void)pedRequestedOnlineConfigurationWithData:(PowaPEDAbstract *)ped
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED requested online configuration"];
    
    self.logView.text = string;
    
}
-(void)pedUpdateNotRequired:(PowaPEDAbstract *)ped
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED update not required"];
    
    self.logView.text = string;
    
}

-(void)ped:(PowaPEDAbstract *)ped promptMessage:(NSInteger)message{
    
    
    NSString *promptMessage  = @"";
    
    //    switch (message) {
    //
    //        case PRESENT_CARD:{
    //            promptMessage = @"PRESENT_CARD";
    //        }
    //            break;
    //        case CARD_SWIPE:{
    //            promptMessage = @"CARD_SWIPE";
    //        }
    //            break;
    //
    //        case CARD_ICC:{
    //            promptMessage = @"CARD_ICC";
    //        }
    //            break;
    //
    //        case INSERT_PIN:{
    //            promptMessage = @"INSERT_PIN";
    //        }
    //            break;
    //
    //        case TRANSACTION_APPROVED:{
    //            promptMessage = @"TRANSACTION_APPROVED";
    //        }
    //            break;
    //
    //        case COMMUNICATION_ERROR:{
    //            promptMessage = @"COMMUNICATION_ERROR";
    //        }
    //            break;
    //
    //        case OPERATION_CANCELED:{
    //            promptMessage = @"OPERATION_CANCELED";
    //        }
    //            break;
    //
    //        case OPERATION_TIMEOUT:{
    //            promptMessage = @"OPERATION_TIMEOUT";
    //        }
    //            break;
    //
    //        case TRANSACTION_DECLINED:{
    //            promptMessage = @"TRANSACTION_DECLINED";
    //        }
    //            break;
    //
    //        case READING_CARD:{
    //            promptMessage = @"READING_CARD";
    //        }
    //            break;
    //
    //        case REMOVE_CARD_NOT_ACCEPTED:{
    //            promptMessage = @"REMOVE_CARD_NOT_ACCEPTED";
    //        }
    //            break;
    //
    //        case PIN_LAST_TRY:{
    //            promptMessage = @"PIN_LAST_TRY";
    //        }
    //            break;
    //
    //        case PIN_INCORRECT:{
    //            promptMessage = @"PIN_INCORRECT";
    //        }
    //            break;
    //
    //        case PIN_OK:{
    //            promptMessage = @"PIN_OK";
    //        }
    //            break;
    //
    //        case REMOVE_CARD_APPROVED:{
    //            promptMessage = @"REMOVE_CARD_APPROVED";
    //        }
    //            break;
    //
    //        case REMOVE_CARD_DECLINED:{
    //            promptMessage = @"REMOVE_CARD_DECLINED";
    //        }
    //            break;
    //
    //        case REMOVE_CARD_CANCELLED:{
    //            promptMessage = @"REMOVE_CARD_CANCELLED";
    //        }
    //            break;
    //
    //        case UPDATING_LOCAL_DATA:{
    //            promptMessage = @"UPDATING_LOCAL_DATA";
    //        }
    //            break;
    //
    //        case REMOVE_CARD_ICC_ERROR:{
    //            promptMessage = @"REMOVE_CARD_ICC_ERROR";
    //        }
    //            break;
    //
    //        case AMOUNT_CONFIRMATION_SALE:{
    //            promptMessage = @"AMOUNT_CONFIRMATION_SALE";
    //        }
    //            break;
    //
    //        case AMOUNT_CONFIRMATION_RREFUND:{
    //            promptMessage = @"AMOUNT_CONFIRMATION_RREFUND";
    //        }
    //            break;
    //
    //        case CANCELLATION_CONFIRMATION:{
    //            promptMessage = @"CANCELLATION_CONFIRMATION";
    //        }
    //            break;
    //
    //        case REMOVE_CARD:{
    //            promptMessage = @"REMOVE_CARD";
    //        }
    //            break;
    //
    //        case PLEASE_WAIT:{
    //            promptMessage = @"PLEASE_WAIT";
    //        }
    //            break;
    //
    //        case PLEASE_TRY_AGAIN:{
    //            promptMessage = @"TRY_AGAIN";
    //        }
    //            break;
    //
    //        default:{
    //
    //            promptMessage = @"UNKNOWN_PROMPT_MESSAGE";
    //        }
    //            break;
    //    }
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    
    [string appendFormat:@"\n-- PED prompt message: %@ ", promptMessage];
    [string appendFormat:@"0X"];
    [string appendFormat:@"%02lX", (long)message];
    [string appendFormat:@" onPromptMessage()"];
    self.logView.text = string;
    
}



-(void)ped:(PowaPEDAbstract *)ped selectApplicationFromList:(NSArray *)applications location:(BOOL)location waitTime:(NSInteger)waitTime
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED select application from list"];
    
    self.logView.text = string;
}


-(void)ped:(PowaPEDAbstract *)ped completedTransactionWithError:(NSInteger)errorCode
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    
    
    switch (errorCode) {
        case 1:
        {
            
            [string appendFormat:@"\n-- PED process not allowed"];
            TIBLog(@"PROCESS_NOT_ALLOWED Code %ld",(long)errorCode);
            break;
            
        }
        case 2:
        {
            [string appendFormat:@"\n-- PED message format error"];
            TIBLog(@"MESSAGE_FORMAT_ERROR Code %ld",(long)errorCode);
            break;
        }
        case 3:
        {
            [string appendFormat:@"\n-- PED cancelled or declined transaction error"];
            TIBLog(@"CANCELLED_OR_DECLINED Code %ld",(long)errorCode);
            break;
            
        }
        case 4:
        {
            [string appendFormat:@"\n-- PED time out error"];
            TIBLog(@"TIMEOUT Code %ld",(long)errorCode);
            break;
            
        }
        case 5:
        {
            
            
            [string appendFormat:@"\n-- PED card not accepted error"];
            TIBLog(@"CARD_NOT_ACCEPTED Code %ld",(long)errorCode);
            break;
        }
            
        case 6:
        {
            [string appendFormat:@"\n-- PED system malfunction"];
            TIBLog(@"SYSTEM_MALFUNCTION Code %ld",(long)errorCode);
            break;
            
        }
        case 7:
        {
            [string appendFormat:@"\n-- PED inactive timeout error"];
            TIBLog(@"USER_TIMEOUT Code %ld",(long)errorCode);
            break;
            
        }
        case 8:
        {
            [string appendFormat:@"\n-- PED device disconnected"];
            TIBLog(@"DEVICE_CONNECTION_NOT_AVAILABLE %ld",(long)errorCode);
            break;
        }
        default:
            break;
    }
    self.logView.text = string;
    
}
-(void)pedDidCompleteTransaction:(PowaPEDAbstract *)ped
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED completed transaction"];
    self.logView.text = string;
}
-(void)pedWillStartTransaction:(PowaPEDAbstract *)ped
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED will start transaction"];
    self.logView.text = string;
}

-(void)pedDidFinishUpdate:(PowaPEDAbstract *)ped
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED completed update"];
    self.logView.text = string;
}
-(void)pedWillStartUpdate:(PowaPEDAbstract *)ped
{
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED will start update"];
    self.logView.text = string;
}
-(void)pedRequestedSignatureVerification:(PowaPEDAbstract *)ped withWaitTime:(NSInteger)waitTime
{
    [self.powaPIN.ped setSignatureVerificationResult:YES];
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED requested signature verification"];
    self.logView.text = string;
}
-(void)ped:(PowaPEDAbstract *)ped informCardData:(NSData *)data maskedPAN:(NSString *)maskedPAN applicationLabel:(NSString *)applicationLabel
{/***************** PED return encrypted as data parameter ***********/
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED informed card data"];
    self.logView.text = string;
    
    // We have get C2 data using follwing TLV parser utility method and send to Backend server for HSM processing.
    
    //[PowaTLVUtils getTLVForTag:[NSData stringToHex] fromData:data];
    
}


#pragma mark - PED Observer (Device Connection)

-(void)ped:(PowaPEDAbstract *)ped informDeviceConnectionStatus:(NSInteger)deviceStatus{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    
    switch (deviceStatus) {
            
        case 00:
        {
            TIBLog(@"Device disconnected");
            [string appendFormat:@"\n-- PED disconnected"];
            
        }
            break;
            
            
        case 01:
        {
            TIBLog(@" device connected");
            [string appendFormat:@"\n-- PED connected"];
            
            
        }
            break;
            
        case 02:
        {
            TIBLog(@" device disconnected with error");
            [string appendFormat:@"\n-- PED disconnected"];
        }
            break;
        default:
            break;
    }
    
    self.logView.text = string;
    
}



#pragma mark - serverObserver

- (void)ped:(PowaPEDAbstract *)ped serverErrorWithResponseCode:(NSInteger)responseCode{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED serverErrorWithResponseCode: %li",(long)responseCode];
    self.logView.text = string;
}

- (void)ped:(PowaPEDAbstract *)ped transactionID:(NSString *)transactionID responseCode:(NSInteger)responseCode{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event ServerResponse: %li",(long)responseCode];
    self.logView.text = string;
}

- (void)ped:(PowaPEDAbstract *)ped loginResultWithResponseCode:(NSInteger)responseCode{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event loginResultWithResponseCode: %li",(long)responseCode];
    self.logView.text = string;
}

- (void)ped:(PowaPEDAbstract *)ped sendReceiptResponseCode:(NSInteger)responseCode{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event sendReceiptResponseCode: %li",(long)responseCode];
    self.logView.text = string;
}

- (void)ped:(PowaPEDAbstract *)ped setSignatureResponseCode:(NSInteger)responseCode{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event setSignatureResponseCode: %li",(long)responseCode];
    self.logView.text = string;
}

- (void)ped:(PowaPEDAbstract *)ped setAdditionalDataResponseCode:(NSInteger)responseCode{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event setAdditionalDataResponseCode: %li",(long)responseCode];
    self.logView.text = string;
}

- (void)ped:(PowaPEDAbstract *)ped receivedTransactions:(NSArray *)transactions responseCode:(NSInteger)responseCode{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event receivedTransactions: %li",(long)responseCode];
    self.logView.text = string;
}

- (void)ped:(PowaPEDAbstract *)ped pedInitializedWithResult:(NSInteger)result{
    
    
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event onPEDInitialised: %li",(long)result];
    self.logView.text = string;
    
}



#pragma mark - PED Observer (Update firmware)

- (void)pedWillStartFirmwareUpdating:(PowaPEDAbstract *)ped{
    
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event onPEDFirmwareUpdateStarted"];
    self.logView.text = string;
    
}



- (void)ped:(PowaPEDAbstract *)ped firmwareUpdateWithProgress:(NSInteger)progress{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event onPEDFirmwareUpdateProgress: %li",(long)progress];
    self.logView.text = string;
}



- (void)ped:(PowaPEDAbstract *)ped  didFinishFirmwareUpdateWithResult:(NSInteger)result{
    
    NSMutableString *string = [NSMutableString stringWithString:self.logView.text];
    [string appendFormat:@"\n-- PED Event onPEDFirmwareUpdateFinished: %li",(long)result];
    self.logView.text = string;
    
}

@end
