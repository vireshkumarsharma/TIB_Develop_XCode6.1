
//
//  PowaPINSDKStateStateTypes.h
//  PowaPIN SDK
//
//  Created by Deeopak on 6/13/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef enum PEDStateType {
    
    PEDStateTypeIdle = 0,
    PEDStateTypeWaitForDriverEvent,
    PEDStateTypeWaitForServerEvent,
    PEDStateTypeWaitForSDKEvent,
    
    PEDStateTypeWaitForUserLoginResult,
    PEDStateTypeWaitForSendRecieptResult,
    PEDStateTypeWaitForSetSignatureResult,
    PEDStateTypeWaitForSendDataResult,
    PEDStateTypeWaitForTransactionListResult,
    
    PEDStateTypeUnknown
    
} PEDStateType;

/**
 *  This class presents the state of PowaPINSDK.
 */

@interface PowaPINSDKState : NSObject

@property (nonatomic, assign) PEDStateType type;
@property (nonatomic, assign, getter = isTryingUpdate) BOOL tryingUpdate;
@property (nonatomic, assign, getter = isUpdateStarted) BOOL updateStarted;
@property (nonatomic, assign) NSInteger timeout;

+ (PowaPINSDKState *)sharedState;

@end
