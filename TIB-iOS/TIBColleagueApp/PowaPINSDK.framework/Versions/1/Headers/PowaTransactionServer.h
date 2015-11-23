//
//  PPTransactionServer.h
//  PowaPIN SDK
//
//  Created by Abel Duarte on 4/9/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/* PPTransactionErrorDomain */
extern NSString *const PPTransactionServerErrorDomain;

typedef enum PowaPOSServerResponseCode
{
    PowaPOSServerResponseSuccessful = 0,
    PowaPOSServerResponseNetworkError = 1,
    PowaPOSServerResponseHostError = 2,
    PowaPOSServerResponseTimeout = 3,
    PowaPOSServerResponseFormatError = 4,
    PowaPOSServerResponseInvalidLogin = 5
    
} PowaPOSServerResponseCode;

@protocol PowaTransactionServerObserver;

/** This API help developerto implement custom Server connections to integrate in the PowaPOS architecture and to implement the support to process payment transactions. It describes the methods and events that provide the interface to be used by the PowaPIN SDK. It also describes the payload formats involved in the Server exchanges considering the PEDs proprietary formats.
 
 This API allows the developer to extend it in order to connect to a custom Server.
 
 PowaPIN Server Abstraction API Specification V1.07
 */


@interface PowaTransactionServer : NSObject

@property (nonatomic, retain) NSMutableArray *observers;

#pragma mark - Observers

- (void)addObserver:(id <PowaTransactionServerObserver>)observer;
- (void)removeObserver:(id <PowaTransactionServerObserver>)observer;

#pragma mark - Authentication

/**
 <b>Reference:</b></br> doServerUserLogin in PowaPIN Server Abstraction API Specification
 @brief This method is called by the SDK to authenticate the user against a user database.
 @param token1 The first token used to authenticate the user (1)
 @param token2 The second token used to authenticate the user (1)
 @param deviceID The unique identifier associated with mobile application. (Optional)
*/

- (void)loginWithToken1:(NSString *)token1
                 token2:(NSString *)token2
                 deviceID:(NSString *)deviceID;

#pragma mark - Server actions

/**
 <b>Reference:</b></br> doServerConfigurationRequest in PowaPIN Server Abstraction API Specification
 @brief This method is called by the SDK to send the payload received from the PED.
 @param data the update local data request payload
 @param waitTime The maximum time in seconds that SDK will wait for the configuration data response.
 */

- (void)performConfigurationRequestWithData:(NSData *)data waitTime:(NSInteger)waitTime;

/**
 <b>Reference:</b></br> doServerTransactionRequest in PowaPIN Server Abstraction API Specification
 @brief Performs transaction on server using supplied transaction payload. This method is called by the SDK to send the payload received from the PED.
 @param data The Online Authorisation Request or Completion Advice Request payloads
 @param waitTime The maximum time in seconds that SDK will wait for the configuration data response.
 @param operationType The operation type. Possible values: 00 - Sale 01 - Refund 02 - Cancellation
 @param payloadType :The payload type. Possible values: 00 - Online Authorisation 01 - Completion Advice
 */

- (void)processTransactionRequestWithData:(NSData *)data waitTime:(NSInteger)waitTime operationType:(NSInteger)opType andPayloadType:(NSInteger)payloadType;

/**
 <b>Reference:</b></br> doServerSendReceipt in PowaPIN Server Abstraction API Specification
 @brief Generates and sends a receipt via requested means. This method is called by the SDK to request a receipt to be sent via SMS or EMAIL.
 @param transactionID the transaction identifier
 @param method delivery method: SMS or Email
 @param destination the mobile number or email address
 */

- (void)processReceiptWithTransactionID:(NSString *)transactionID
                                 method:(NSString *)method
                            destination:(NSString *)destination;
/**
 <b>Reference:</b></br> doServerSetSignature in PowaPIN Server Abstraction API Specification
 @brief Stores cardholder signature for the specified transaction. This method is called by the SDK to store the base64gencoded signature in the database associated to the respective transaction.
 @param transactionID transaction identifier
 @param signature the base64 encoded image
 */

- (void)processSignatureWithTransactionID:(NSString *)transactionID
                                signature:(NSString *)signature;
/**
 <b>Reference:</b></br> doServerSetAdditionalData in PowaPIN Server Abstraction API Specification
 @brief Stores product image, product description and location for the specified transaction. This method is called by the SDK.
 @param transactionID transaction identifier
 @param image base64 encoded image
 @param productDescription optional product description 
 @param latitude transaction location
 @param longitude transaction location
 @param transUTC Transaction Coordinated Universal Time (UTC)
 @param customData Transaction custom data
 */

- (void)setAdditionalDataWithTransactionID:(NSString *)transactionID
                              productImage:(NSString *)image
                        productDescription:(NSString *)productDescription
                                  latitude:(NSString *)latitude
                                 longitude:(NSString *)longitude
                                  transUTC:(long)transDate
                                customData:(NSArray*) data;

/**
 <b>Reference:</b></br> doServerGetTransactionList in PowaPIN Server Abstraction API Specification
 @brief Retrieves transaction list from server. This method is called by the SDK to request a list of transactions in the  “from date/time” to the “to date/time” period.
 @param fromDate search date from
 @param to date search to
 @param data The Card Read payload to filter the resulting list
 @param customData Transaction custom data
 */

- (void)transactionListFromDate:(NSDate *)fromDate
                         toDate:(NSDate *)toDate
                           data:(NSData*)data
                     customData:(NSArray*)customData;

@end


/** The delegate of a PowaTransactionServer object must adopt the PowaTransactionServerObserver protocol. Optional methods of the protocol allow the delegate to perform action based on the event.*/

@protocol PowaTransactionServerObserver <NSObject>

@optional

/**
 <b>Reference:</b></br> onServerError in PowaPIN Server Abstraction API Specification
 @brief Event is triggered by the Server Abstraction component to the SDK when an error is encountered while processing with the server.
 @param ResposneCode The error identifier. Possible values: 01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error
 @param hostMessage date search to
 */

- (void)transactionServer:(PowaTransactionServer *)server
encounteredErrorWithResponseCode:(PowaPOSServerResponseCode)responseCode
              hostMessage:(NSString*)hostMessage;
/**
 <b>Reference:</b></br> onServerResponse in PowaPIN Server Abstraction API Specification
 @brief Event is triggered by the Server Abstraction component to the SDK when an error is encountered while processing with the server.
 @param responseWithData The Online Authorisation Response, Completion Advice Response or Update Local Data Response payload
 @param transactionID The transaction identifier.
 @param hostMessage The additional message received from the host system to present on the MCD
 */

- (void)transactionServer:(PowaTransactionServer *)server
         responseWithData:(NSData *)data
            transactionID:(NSString *)transactionID
             hostMessage:(NSString*)hostMessage;
/**
 <b>Reference:</b></br> onServerUserLoginResult in PowaPIN Server Abstraction API Specification
 @brief Event is triggered by the Server Abstraction component when the server finishes processing the user login request.
 @param error The error identifier. Possible values: 01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error 05- Invalid login
 */

- (void)transactionServer:(PowaTransactionServer *)server
loginResultWithResponseCode:(PowaPOSServerResponseCode)responseCode;

/**
 <b>Reference:</b></br> onServerSendReceiptResult in PowaPIN Server Abstraction API Specification
 @brief Event is triggered by the Server Abstraction component when the server finishes processing the send receipt request.
 @param responseCode. Possible values: 01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error
 */

- (void)transactionServer:(PowaTransactionServer *)server
  sendReceiptResponseCode:(PowaPOSServerResponseCode)responseCode;

/**
 <b>Reference:</b></br> onServerSetSignatureResult in PowaPIN Server Abstraction API Specification
 @brief Event is triggered by the Server Abstraction component when the server finishes processing the set signature request.
 @param error The error identifier. Possible values: 01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error 05- Invalid login
 */

- (void)transactionServer:(PowaTransactionServer *)server
 setSignatureResponseCode:(PowaPOSServerResponseCode)responseCode;

/**
 <b>Reference:</b></br> onServerSetAdditionalDataResult in PowaPIN Server Abstraction API Specification
 @brief Event is triggered by the Server Abstraction component when the server finishes processing the set additional data request.
 @param responseCode. Possible values: 01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error
 */

- (void)transactionServer:(PowaTransactionServer *)server
setAdditionalDataResponseCode:(PowaPOSServerResponseCode)responseCode;

/**
 <b>Reference:</b></br> onServerGetTransactionListResult in PowaPIN Server Abstraction API Specification
 @brief Event is triggered by the Server Abstraction component to the SDK when an error is encountered while processing with the server.
 @param receivedTransactions The list of transactions and respective details
 @param responseCode. Possible values: 01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error
 */

- (void)transactionServer:(PowaTransactionServer *)server
     receivedTransactions:(NSArray *)transactions
             responseCode:(PowaPOSServerResponseCode)responseCode;

@end
