//
//  PowaPINCommunicator.h
//  PowaPIN Driver
//
//  Created by Abel Duarte on 3/11/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <ExternalAccessory/ExternalAccessory.h>

enum
{
    PowaPEDCommunicatorInvalidSession = 0,
    PowaPEDCommunicatorReadError,
    PowaPEDCommunicatorWriteError
};

typedef void (^PowaPEDCommunicatorResponseHandler)(NSError *error);

@protocol PowaPEDCommunicatorDelegate;

@interface PowaPEDCommunicator : NSObject <NSStreamDelegate>{
    
}

@property (nonatomic, readonly) EAAccessory *accessory;
@property (nonatomic, assign) id <PowaPEDCommunicatorDelegate> delegate;

- (id)initWithAccessory:(EAAccessory *)accessory protocol:(NSString *)protocol;

- (void)sendData:(NSData*)data completionHandler:(PowaPEDCommunicatorResponseHandler)block;

- (BOOL)openSession;

- (void)closeSession;

- (BOOL)isSessionOpen;


@end

#pragma mark- Communicator Delegate

@protocol PowaPEDCommunicatorDelegate <NSObject>
- (void)deviceCommunicator:(PowaPEDCommunicator *)communicator receivedData:(NSData *)data;
- (void)deviceCommunicatorOpenedConnection:(PowaPEDCommunicator *)communicator;
- (void)deviceCommunicatorClosedConnection:(PowaPEDCommunicator *)communicator;
- (void)deviceCommunicator:(PowaPEDCommunicator *)communicator receivedError:(NSError *)error;
@end