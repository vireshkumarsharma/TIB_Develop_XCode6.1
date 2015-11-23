//
//  PPMockServer.m
//  PowaPOS SDK
//
//  Created by Abel Duarte on 4/9/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import "PPMockServerApp.h"
#import "NSData+Hex.h"
#import  <TIBKit/TIBKit.h>
@interface PPMockServerApp ()

@property (nonatomic, assign) NSInteger configRequestIndex;

@end

@implementation PPMockServerApp

#pragma mark - Authentication

- (id)init{
    
    self = [super init];
    
    if (self) {
        
        _configRequestIndex = 0;
    }
    
    return self;
    
}



#pragma mark - Server actions

- (void)performConfigurationRequestWithData:(NSData *)data waitTime:(NSInteger)waitTime
{
    
    NSString *responseData = @"======";
    // sleep(1);
    switch (_configRequestIndex) {
            
        case 0:
        {
            TIBLog(@"%li", (long)_configRequestIndex);
            
            _configRequestIndex++;
            responseData = @"E072DF430101DF3E0108E268DF3E0108DF210100DF22020001DF230200569F3501219F330360F0C89F40056000A0A0019F1A0208265F2A0208265F360102DF190101DF1A0114DF1B011EDF1C0178DF1D012DDF1E0105DF200101DF240100DF490100DF310100DF350101DF360101DF7003000000DF450401020304";
        }
            break;
            
        case 1:
        {
            TIBLog(@"%li", (long)_configRequestIndex);
            _configRequestIndex++;
            responseData = @"E059DF430101DF3E0110E24FDF3E0110DF210101DF22020001DF2302003DDF2505A000000003DF26050000000000DF27050000000000DF280500000000009F15025072DF4B0F9F02065F2A029A039C0195059F3704DF4C039F3704DF450401020304";
        }
            break;
            
            
            
        case 2:
        {
            TIBLog(@"%li", (long)_configRequestIndex);
            _configRequestIndex++;
            responseData = @"E03CDF430101DF3E0109E232DF3E0109DF210102DF22020001DF230200209F0106000012345678DF3C1030303030303030303030303030303031DF2B0101DF450401020304";
        }
            break;
            
            
            
        case 3:
        {
            TIBLog(@"%li", (long)_configRequestIndex);
            _configRequestIndex++;
            responseData = @"E05CDF430101DF3E0116E252DF3E0116DF210103DF22020001DF230200409F090200019F1B04000003E8DF2C0100DF2D0400000000DF4D0100DF2E0100DF2F1056495341204352454449542020202020DF3001019F0607A0000000031010DF450401020304";
        }
            break;
            
            
        case 4:
        {
            TIBLog(@"%li", (long)_configRequestIndex);
            _configRequestIndex++;
            responseData = @"E06BDF430101DF3E0131E261DF3E0131DF210104DF22020001DF2302004FDF2505A0000000039F220192DF320101DF330101DF341424032512315A0A6799998900000010690F5F3400DF371D20210A500CF0406C813A00002B6000590F00FF0A679999890000001069DF380101DF450401020304";
        }
            break;
            
            
        case 5:
        {
            TIBLog(@"%li", (long)_configRequestIndex);
            
            _configRequestIndex = 0;
            responseData = @"E06BDF430100DF3E0144E261DF3E0144DF210104DF22020001DF2302004FDF2505A0000000659F220102DF320101DF330101DF341424032512315A0A6799998900000010690F5F3400DF371D20210A500CF0406C813A00002B6000590F00FF0A679999890000001069DF380101DF450401020304";
        }
            break;
            
            
        default:{
            
        }
            break;
    }
    
    
    
    NSData *messageData = [responseData stringToHex:responseData];
    
    for(id <PowaTransactionServerObserver> observer in self.observers)
    {
        if([observer respondsToSelector:@selector(transactionServer:responseWithData:transactionID:hostMessage:)])
        {
            [observer transactionServer:self responseWithData:messageData transactionID:@"taxID" hostMessage:@"Host message"];
        }
    }
    
}

- (void)processTransactionRequestWithData:(NSData *)data waitTime:(NSInteger)waitTime operationType:(NSInteger)opType andPayloadType:(NSInteger)payloadType{
    NSData *messageData = nil;
    
    sleep(1);
    
    if(payloadType == 0)
    {
        
        TIBLog(@"onlineauth");
        NSString *responseData = @"E00C89060102030405068A023030DF450401020304";
        messageData = [responseData stringToHex:responseData];
    }
    else
    {
        
        TIBLog(@"advice");

        NSString *responseData = @"E00BDF430100DF450401020304";
        messageData = [responseData stringToHex:responseData];
    }
    
    for(id <PowaTransactionServerObserver> observer in self.observers)
    {
        if([observer respondsToSelector:@selector(transactionServer:responseWithData:transactionID:hostMessage:)])
        {
            [observer transactionServer:self responseWithData:messageData transactionID:@"taxID" hostMessage:@"Host message"];
        }
    }
}


#pragma mark -
#pragma mark Server actions

- (void)loginWithToken1:(NSString *)token1
                 token2:(NSString *)token2
               deviceID:(NSString *)deviceID
{
    
    for(id <PowaTransactionServerObserver> observer in self.observers)
    {
        if([observer respondsToSelector:@selector(transactionServer:loginResultWithResponseCode:)])
        {
            [observer transactionServer:self loginResultWithResponseCode:0];
        }
    }
    

}



- (void)processReceiptWithTransactionID:(NSString *)transactionID
                                 method:(NSString *)method
                            destination:(NSString *)destination
{
    
    for(id <PowaTransactionServerObserver> observer in self.observers)
    {
        if([observer respondsToSelector:@selector(transactionServer:sendReceiptResponseCode:)])
        {
            [observer transactionServer:self sendReceiptResponseCode:0];
        }
    }
    

}




- (void)setAdditionalDataWithTransactionID:(NSString *)transactionID
                              productImage:(NSString *)image
                        productDescription:(NSString *)productDescription
                                  latitude:(NSString *)latitude
                                 longitude:(NSString *)longitude
                                  transUTC:(long)transDate
                                customData:(NSArray*) data{
    
    
    for(id <PowaTransactionServerObserver> observer in self.observers)
    {
        if([observer respondsToSelector:@selector(transactionServer:setAdditionalDataResponseCode:)])
        {
            [observer transactionServer:self setAdditionalDataResponseCode:1];

        }
    }
    
}

#pragma mark -
#pragma mark Data fetching




- (void)transactionListFromDate:(NSDate *)fromDate
                         toDate:(NSDate *)toDate
                           data:(NSData*)data
                     customData:(NSArray*)customData{
    
   // [self transactionServer:self setAdditionalDataResponseCode:0];
    
}

@end
