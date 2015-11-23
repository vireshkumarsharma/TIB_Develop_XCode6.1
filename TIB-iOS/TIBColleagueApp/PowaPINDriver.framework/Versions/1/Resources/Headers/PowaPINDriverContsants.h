//
//  RSUContsants.h
//  PowaPINDriver
//
//  Created by Deepak Shukla on 11/08/2014.
//  Copyright (c) 2014 mpowa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PowaPINDriverContsants : NSObject

#define  kPowaPINDriverErrorDomain @"PowaPINDriverErrorDomain"
#define  kPowaPINDriverCommandNotAllowedException @"PowaPINDriverCommandNotAllowedException"


#define kPowaPEDConnected 1
#define kPowaPEDDisconnected 0
#define kPowaPEDConnectionError 2


enum
{
    PRESENT_CARD = 0x00,
    CARD_SWIPE = 0x01,
    CARD_ICC = 0x02,
    INSERT_PIN = 0x03,
    TRANSACTION_APPROVED = 0x04,
    COMMUNICATION_ERROR = 0x05,
    OPERATION_CANCELED = 0x06,
    OPERATION_TIMEOUT = 0x07,
    TRANSACTION_DECLINED = 0x08,
    READING_CARD = 0x09,
    REMOVE_CARD_NOT_ACCEPTED = 0x0A,
    PIN_LAST_TRY = 0x0B,
    PIN_INCORRECT = 0x0C,
    PIN_OK = 0x0D,
    REMOVE_CARD_APPROVED = 0x0E,
    REMOVE_CARD_DECLINED = 0x0F,
    REMOVE_CARD_CANCELLED = 0x10,
    UPDATING_LOCAL_DATA = 0x11,
    REMOVE_CARD_ICC_ERROR = 0x12,
    AMOUNT_CONFIRMATION_SALE = 0x13,
    AMOUNT_CONFIRMATION_RREFUND = 0x14,
    CANCELLATION_CONFIRMATION = 0x15,
    REMOVE_CARD = 0x16,
    PLEASE_WAIT = 0x17,
    PLEASE_TRY_AGAIN = 0x18
    
};
typedef UInt8 PromptMessage;


enum
{
    UpdateErrorCode = 0x01,
    MessageFormatErrorCode = 0x02,
    TransactionDeclinedErrorCode = 0x03,
    UserTimeoutErrorCode = 0x04,
    CardNotAcceptedErrorCode = 0x05,
    SystemMalfunctionErrorCode = 0x06,
    InActiveTimeoutErrorCode = 0x07,
    DeviceConnectionError = 0x08,
};
typedef NSUInteger PowaPINDriverErrorCode;



enum
{
    NetworkErrorCode = 0x01,
    HostErrorCode = 0x02,
    TimeoutErrorCode = 0x03,
    FormatErrorCode = 0x04
};
typedef NSUInteger ServerErrorCode;


typedef enum PowaPINMessageResponseCode
{
    PowaPINResponsCodeProcessedCorrectly = 0x9000,
    
    PowaPINResponseCodeSignatureVerificationFailed = 0x9001,
    
    PowaPINResponseCodeTransactionHasBeenCancelled = 0x6300,
    
    PowaPINResponseCodeNetworkConnectionNotAvailable = 0x6302,
    
    PowaPINResponseCodeHostConnectionNotAvailable = 0x6303,
    
    PowaPINResponseCodeConnectionTimedOut = 0x6304,
    
    PowaPINResponseCodNotSupportedOrOperational = 0x6305,
    
    PowaPINResponseCodeOperationNotPermitted = 0x6306,
    
    PowaPINResponseCodeFormatError = 0x6307,
    
    PowaPINResponseCodeRecoveryRecordExists = 0x6308,
    
    PowaPINResponseCodeUpdateRequired = 0x6309
    
}

PowaPINMessageResponseCode;





typedef enum PowaPINTransactionType {
    
    PowaPINTransactionTypeGoodsAndServices = 0x00
    
} PowaPINTransactionType;




typedef enum PowaPINOperationType{
    
    PowaPINOperationTypeSale = 0x00,
    PowaPINOperationTypeRefund = 0x01,
    PowaPINOperationTypeCancellation = 0x02,
    PowaPINOPerationTypeReadCard = 0x03
    
} PowaPINOperationType;

typedef enum PowaPINTransactionResult{
    
    PowaPINTransactionApproved = 0000,
    PowaPINCardCanceled = 9991,
    PowaPINCustomerCancelled = 9992,
    PowaPINTransactionMalFunction = 9993,
    PowaPINTransactionDeclined = 9994,
    PowaPINAuthTimeout = 9995,
    PowaPINTransactionUnableToComplete = 9996

} PowaPINTransactionResult;




@end
