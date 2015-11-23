//
//  PowaPOS.h
//  PowaPIN SDK
//
//  Created by Abel Duarte on 3/14/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PowaPEDAbstract.h"
#import "PowaTransactionServer.h"

@class PowaTransaction;
@class PowaTransactionServer;

@protocol PowaPINObserver;

/**
 PowaPIN is the root class of PowaPINSDK which offers methods and event to faciliate communication to PowaPIN device & Server.
 */

@interface PowaPIN : NSObject <PEDObserver, PowaTransactionServerObserver>

#pragma mark - Properties
@property (nonatomic, retain) PowaPEDAbstract *ped;
@property (nonatomic, retain) PowaTransactionServer *server;
@property (nonatomic, retain) NSMutableArray *observers;

#pragma mark - Device Management

/**
 <b>Reference:</b></br> getPowaPINSDKVersion in PowaPIN SDK API Specification
 @brief Requests SDK version.
 @return SDK version.
 */

- (NSString *)getPowaPINSDKVersion;

/**
 <b>Reference:</b></br> getAvailablePEDs in PowaPIN SDK API Specification
 @brief Requests paired devices list from mobile device.
 @return The list of devices and respective details
 */
- (NSArray *)getAvailablePEDs;

/**
 <b>Reference:</b></br> selectPED in PowaPIN SDK API Specification
 @brief Selects a specific PED device for connection.
 @param  Device The selected device.
 @return The void.
 */
- (void)selectPED:(PowaPINDeviceInfo*)device;

#pragma mark - Observers


/**
 @brief Adds observer to notify when events.
 @param  Observer class.
 @return The void.
 */
- (void)addObserver:(id <PowaPINObserver>)observer;

/**
 @brief Revoves observer.
 @param  Observer class.
 @return The void.
 */
- (void)removeObserver:(id <PowaPINObserver>)observer;

#pragma mark - Transaction management

/**
 <b>Reference:</b></br> startTransaction in PowaPIN SDK API Specification
 
 @brief Starts a transaction with the PED device.
 @param operationType specifies whether the transaction is a sale, refund, cancellation or readCard.
 @param amount Should contain the transaction amount expressed in the terminal currency. The number of decimal digits is implied according to the currency exponent definition – i.e. 12345 shall be interpreted as 123.45 if the currency exponent is 2. Negative values shall not be accepted.
 @param transDate Current date/time as long.
 @param cvmMethod CVM control method.
 @return void
 */
- (void)startOperationWithOperationType:(PEDOperationType)operationType
                                 amount:(NSInteger)authorisedAmount
                              transDate:(long)transDate
                              cvmMethod:(NSInteger)cvmMethod;

/**
 <b>Reference:</b></br> startTransaction in PowaPIN SDK API Specification
 @brief Starts a transaction with the PED device.
 @param operationType specifies whether the transaction is a sale, refund, cancellation or readCard
 @param amount Should contain the transaction amount expressed in the terminal currency. The number of decimal digits is implied according to the currency exponent definition – i.e. 12345 shall be interpreted as 123.45 if the currency exponent is 2. Negative values shall not be accepted.
 @param transDate Current date/time as long
 @param orgTransDate Original current date/time as long
 @param orgTransID Original transaction ID
 @return returns void
 */
- (void)startOperationWithOperationType:(PEDOperationType)operationType
                                 amount:(NSInteger)authorisedAmount
                              transDate:(long)transDate
                           orgTransDate:(long)orgDate
                             orgTransID:(NSString *)identifier;
/**
 <b>Reference:</b></br> startTransaction in PowaPIN SDK API Specification
 @brief Starts a transaction with the PED device.
 @param operationType specifies whether the transaction is a sale, refund, cancellation or readCard
 @param transDate Current date/time as long
 @param orgTransDate Original current date/time as long
 @param orgTransID Original transaction ID
 @return returns void
 */
- (void)startOperationWithOperationType:(PEDOperationType)operationType
                              transDate:(long)transDate
                           orgTransDate:(long)orgDate
                             orgTransID:(NSString *)identifier;

/**
 <b>Reference:</b></br> startTransaction in PowaPIN SDK API Specification
 @brief Starts a transaction with the PED device.
 @param operationType specifies whether the transaction is a sale, refund, cancellation or readCard
 @param transDate Current date/time as long
 @return returns void
 */
- (void)startOperationWithOperationType:(PEDOperationType)operationType
                              transDate:(long)transDate;



#pragma mark Server Abtraction

/**
 <b>Reference:</b></br> doServerUserLogin in PowaPINSDK API Specification
 @brief Authenticates a user against a user database. This method shall be called by the mobile application to authenticate the user against a user database.
 @param token1 The first token used to authenticate the user (1)
 @param token2 The second token used to authenticate the user (1)
 @param deviceID unique identifier associated with mobile app
 */
- (void)loginWithToken1:(NSString *)token1
                 token2:(NSString *)token2
               deviceID:(NSString *)deviceID;

/**
 <b>Reference:</b></br> doServerSendReceipt in PowaPINSDK API Specification
 @brief Generates and sends a receipt via requested means. This method shall be called by the mobile application to request a receipt be sent via SMS or EMAIL.
 @param transactionID The transaction identifier
 @param method The Delivery method: SMS or EMAIL
 @param destination The mobile number or email address
 */
- (void)processReceiptWithTransactionID:(NSString *)transactionID
                                 method:(NSString *)method
                            destination:(NSString *)destination;
/**
 <b>Reference:</b></br> doServerSetSignature in PowaPINSDK API Specification
 @brief Stores cardholder signature for respective transaction. This method shall be called by the mobile application to store the base64-encoded signature in the database associated to the respective transaction.
 @param transactionID The transaction identifier
 @param signature The base64 encoded image
 */
- (void)processSignatureWithTransactionID:(NSString *)transactionID
                                signature:(NSString *)signature;
/**
 <b>Reference:</b></br> doServerSetAdditionalData in PowaPINSDK API Specification
 @brief Stores product image, product description and location for specified transaction. This method shall be called by the mobile application to store the additional data in the database associated to the respective transaction.
 @param transactionID The transaction identifier
 @param productImage The base64 encoded image
 @param productDescription The product description
 @param latitude Transaction location
 @param longitude Transaction location
 @param transUTC Transaction Coordinated Universal Time
 @param customData Transaction custom data
 */

- (void)setAdditionalDataWithTransactionID:(NSString *)transactionID
                              productImage:(NSString *)image
                        productDescription:(NSString *)productDescription
                                  latitude:(NSString *)latitude
                                 longitude:(NSString *)longitude
                                  transUTC:(long)transDate
                                customData:(NSArray *) data;
/**
 <b>Reference:</b></br> doServerGetTransactionList in PowaPINSDK API Specification
 @brief Retrieves transaction list from server.
 This method shall be called by the mobile application to request the list of transaction for the “from date/time” to the “to date/time” period.
 @param fromDate The date to search from
 @param toDate The date to search to
 @param data The Card Read payload to filter the resulting list
 @param customData Transaction custom data to filter the resulting list

 */
- (void)transactionListFromDate:(NSDate *)fromDate
                         toDate:(NSDate *)toDate
                           data:(NSData *)data
                     customData:(NSArray *)customData;

@end

#pragma mark - PowaPIN Observer

@protocol PowaPINObserver <NSObject, PEDObserver, PowaTransactionServerObserver>

@optional
/**
 This event handler should be called whenever an error occurred, can be triggered by receiving an error response code from the PED or from an error detected by the Driver logic (state machine or parsing routines). The mobile App should account for this event by informing the user that the operation is being terminated.
 <b>Reference:</b></br> onTransactionError in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when a transaction encounters an error on the device.
 @param powapin current powapin object
 @param error transaction error code
 */
- (void)powaPIN:(PowaPIN *)powaPIN transactionError:(NSInteger)errorCode;

/**
 This event handler should be called to indicate that a transaction is complete.
 <b>Reference:</b></br> onTransactionFinished in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when transaction processing is completed.
 @param powapin current powapin object
 */

- (void)powaPIN:(PowaPIN *)powapin finishedTransactionWithResult:(int)result;

/**
 This event handler should be called to indicate that a transaction is about to be started. The mobile App should account for this event by establishing communications with the server.
 <b>Reference:</b></br> onTransactionStarted in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when a transaction is started.
 @param powapin current powapin object
 */
- (void)powaPINStartedTransaction:(PowaPIN *)powaPIN;

@end
