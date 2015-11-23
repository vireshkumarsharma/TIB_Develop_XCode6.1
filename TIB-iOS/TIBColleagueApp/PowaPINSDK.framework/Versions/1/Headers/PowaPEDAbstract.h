//
//  PowaPEDAbstract.h
//  PowaPIN SDK
//
//  Created by Abel Duarte on 3/13/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>

@class PowaPINDevice;
@class PowaTransaction;
@class PowaPINDeviceInfo;

enum
{
    PEDTransactionTypeGoodsAndServices = 0x00
};
typedef NSUInteger PEDTransactionType;

enum
{
    PEDOperationTypeSale = 0x00,
    PEDOperationTypeRefund = 0x01,
    PEDOperationTypeCancellation = 0x02,
    PEDOperationTypeReadCard = 0x03
};
typedef NSUInteger PEDOperationType;

/** This class is abstract which must be implemented by PED classes. */

@interface PowaPEDAbstract : NSObject{
    
    NSMutableArray *observers;
}

@property (nonatomic, retain) NSMutableArray *observers;
@property (nonatomic, retain) EAAccessory *accessory;

#pragma mark - Device Management

/**
 Requests paired devices list from mobile device.
 <b>Reference:</b></br> getAvailablePEDs in PowaPIN SDK API Specification
 @brief Called to obtain a list of connected devices.
 @return The list of devices and respective details
*/
- (NSArray *)getAvailablePEDs;

/**
 This method should be called by the mobile APP to get the connected device basic information.
 <b>Reference:</b></br> getPEDInformation in PowaPIN SDK API Specification
 @return PowaDeviceInfo The Device info
 */
- (PowaPINDeviceInfo *)getPEDInformation;

/**
 Submits selected device for connection.
 <b>Reference:</b></br> selectPED in in PowaPIN SDK API Specification
 @param  device The selected device
 @return the void
 */
- (void)selectPED:(PowaPINDeviceInfo *)device;

/**
 <b>Reference:</b></br> getPEDBatteryLevel in PowaPIN SDK API Specification
 @brief Requests battery level on device since last transaction.
 @return percent of battery life remaining
 */
- (NSUInteger)getPEDBatteryLevel;



#pragma mark- Update management

/**
 <b>Reference:</b></br> getPEDConfigurationStatus in PowaPIN SDK API Specification
 @brief Performs status check of configuration data on device and initiates the Update process if necessary.
 */
- (void)getPEDConfigurationStatus;

/**
 <b>Reference:</b></br> intializePED in PowaPIN SDK API Specification
 
 @param firmwareVersion The new firmware version.
 @param newFirmware The new firmware payload to replace the current firmware.
 @param firmwareSize The total dimension in bytes of the new firmware.
 @brief Performs status check of firmware version on device and initiates the firmware update process if necessary.
 */
- (void)initPEDWithFirmwareVersion:(NSString*)version newFirmware:(NSData*)dataPacket firmwareSize:(NSInteger)length;


#pragma mark - Transaction management

/**
 <b>Reference:</b></br> startTransaction in PowaPIN SDK API Specification

 @brief Starts a transaction with the PED device.
 @param operationType specifies whether the transaction is a sale, refund, cancellation or readCard.
 @param amount Should contain the transaction amount expressed in the terminal currency. The number of decimal digits is implied according to the currency exponent definition – i.e. 12345 shall be interpreted as 123.45 if the currency exponent is 2. Negative values shall not be accepted.
 @param transDate Current date/time as long
 @param cvmMethod CVM control method
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

#pragma mark - PED SDK Methods

/**
 Submits application selection result to device when selected on mobile. The mobile application shall send the index of the application in the list of applications provided by the onDoApplicationSelection event.
 <b>Reference:</b></br> SetApplicationSelectionResult in PowaPIN SDK API Specification
 @brief Submits application selection to device when selected on mobile.
 @param application the index of the selected application in the applications list 
*/
- (void)setApplicationSelectionResult:(NSInteger)applicationIndex;

/**
 Submits signature verification result to device.
 <b>Reference:</b></br> setSignatureVerificationResult in PowaPIN SDK API Specification
 @brief Sets whether the person signed successfully or not during the signature verification process.
 @param isVerified whether the person's signature was collected successfully or there was an error
 */
-(void)setSignatureVerificationResult:(BOOL)isVerified;

@end


/** The delegate of a object (PowaPED) which extends PowaPEDAbstract must adopt the PEDObserver protocol. Optional methods of the protocol allow the delegate to perform action based on the event.*/


@protocol PEDObserver <NSObject>

#pragma mark - PEDObserver (Driver)

@optional

/**
 This event handler should be called by the Driver to indicate that the amount was confirmed by the cardholder.
 <b>Reference:</b></br> onAmountConfirmed in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when amount confirmation is completed on device.
 @param ped current PED object
 @param confirmedAmount the confirmation status.
 */
- (void)ped:(PowaPEDAbstract *)ped confirmedAmount:(BOOL)confirmed;

/**
 Delegate with the selected application
 <b>Reference:</b></br> OnApplicationSelected in PowaPIN SDK API Specification
 @brief Event is triggered by SDK to inform the Application when EMV application selection is completed on device.
 @param Selected application The application the applications list.
 */
- (void)ped:(PowaPEDAbstract *)ped selectedApplication:(id)paymentApplication;


/*
 // this method being used
- (void)ped:(PowaPEDAbstract *)ped completionAdviceWithData:(NSData *)data waitTime:(NSInteger)waitTime;

- (void)ped:(PowaPEDAbstract *)ped requestedOnlineAuthorizationWithData:(NSData *)data maskedPan:(NSString *)maskedPan applicationLabel:(NSString *)applicationLabel waitTime:(NSInteger)waitTime;

-(void)ped:(PowaPEDAbstract *)ped requestedOnlineConfigurationWithData:(NSData *)data waitTime:(NSInteger)waitTime;
 */

/**
 This event handler should be called if no updates are required by the PED. The mobile App should account for this event by proceeding with the normal operation flow.
 <b>Reference:</b></br> onNoUpdate in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when no configuration download is required.
 @param ped current PED object
 */
- (void)pedUpdateNotRequired:(PowaPEDAbstract *)ped;

/**
 This event handler should be called by the Driver to request the presentation of a specific message to the user.
 <b>Reference:</b></br> onPromptMessage in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when a message display is required by the mobile application.
 @param ped current PED object
 @param message message to be displayed
 */
- (void)ped:(PowaPEDAbstract *)ped promptMessage:(NSInteger)message;

/**
 Delegate with the list of possible applications to select
 <b>Reference:</b></br> OnSelectApplication in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when application selection is necessary. Location dictates whether selection is done on device or by mobile application.
 @param applications an array of possible applications to select
 @param location whether the application selection is done on the mobile device or the PED
 @param waitTime The maximum time in seconds that PED will wait for the result.
 */
- (void)ped:(PowaPEDAbstract *)ped selectApplicationFromList:(NSArray *)applications location:(BOOL)location waitTime:(NSInteger)waitTime;

/**
 This event handler should be called whenever an error occurred, can be triggered by receiving an error response code from the PED or from an error detected by the Driver logic (state machine or parsing routines). The mobile App should account for this event by informing the user that the operation is being terminated.
 <b>Reference:</b></br> onTransactionError in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when a transaction encounters an error on the device.
 @param ped current PED object
 @param error transaction error code
 */
- (void)ped:(PowaPEDAbstract *)ped finishedTransactionWithError:(NSInteger)errorCode;

/**
 This event handler should be called to indicate that a transaction is complete.
 <b>Reference:</b></br> onTransactionFinished in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when transaction processing is completed.
 @param ped current PED object
 */
- (void)ped:(PowaPEDAbstract *)ped didFinishTransactionWithResult:(int)result;

/**
 This event handler should be called to indicate that a transaction is about to be started. The mobile App should account for this event by establishing communications with the server.
 <b>Reference:</b></br> onTransactionStarted in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when a transaction is started.
 @param ped current PED object
 */
- (void)pedWillStartTransaction:(PowaPEDAbstract *)ped;

/**
 This event handler should be called when the PED has no more updates to perform. The mobile App should account for the occurrence of several of the above updates cycles until this handler is called by the Driver. The occurrence of this event signals the end of the updates cycles and allows the mobile App to proceed with the operation flow.
 <b>Reference:</b></br> onUpdateFinished in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when configuration download is completed.
 @param ped current PED object
 */
- (void)pedDidFinishUpdate:(PowaPEDAbstract *)ped;

/**
 This event handler should be called to indicate that an update is about to be started. The mobile App should account for this event by preparing all communication channels with the Server.
 <b>Reference:</b></br> onUpdateStarted in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when a configuration update is started.
 @param ped current PED object
 */
- (void)pedWillStartUpdate:(PowaPEDAbstract *)ped;

/**
 This event handler should be called when the PED requests a signature verification to be performed on the MCD.
 <b>Reference:</b></br> onVerifySignature in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when signature verification is to be completed by mobile application.
 @param ped current PED object
 @param waitTime The maximum time in seconds that PED will wait for the result.
 */
- (void)pedRequestedSignatureVerification:(PowaPEDAbstract *)ped withWaitTime:(NSInteger)waitTime;

/**
 This event handler should be caled by the Driver to inform the card data details. The mobile App should account for this event by forwarding the message to the server.
 <b>Reference:</b></br> onReadCard in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when card identification attributes are informed as part of the Read Card operation.
 @param data card data
 */
-(void)ped:(PowaPEDAbstract *)ped informCardData:(NSData*)data maskedPAN:(NSString*)maskedPAN applicationLabel:(NSString*)applicationLabel;

/**
 <b>Reference:</b></br> onPEDConnectionResult in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when the connection process is finished. Result dictates whether the device is connected, the device is disconnected or there was an error in the connection process.
 @param status  the status
 */
-(void)ped:(PowaPEDAbstract *)ped informDeviceConnectionStatus:(NSInteger)status;

/**
 <b>Reference:</b></br> onDoOnlineConfigRequest in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when configuration request is completed on device and has been sent to the server.
 @param data data needed for configuration request
 */
- (void)pedRequestedOnlineConfigurationWithData:(PowaPEDAbstract *)ped;

/**
 <b>Reference:</b></br> onDoOnlineAuthorisationRequest in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when authorization request is completed on device and has been sent to the server.
 @param ped current PED object
 @param maskedPan maskedPan
 @param label application label
 */
- (void)ped:(PowaPEDAbstract *)ped requestedOnlineAuthorizationWithMaskedPan:(NSString *)maskedPan applicationLabel:(NSString *)applicationLabel;

/**
 <b>Reference:</b></br> onDoOnlineAdviceRequest in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when advice request is completed on device and has been sent to the server.
 @param ped current PED object
 */
- (void)pedCompletionAdviceWithData:(PowaPEDAbstract *)ped;

/**
 <b>Reference:</b></br> onPEDInitialised in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when device initialisation is completed.
 @param ped The PowaPED
 @param result The result identifier. Possible values: 00 – Successful initialisation, 01 – Not possible to complete initialisation
 */
- (void)ped:(PowaPEDAbstract *)ped pedInitializedWithResult:(NSInteger)result;

/**
 <b>Reference:</b></br> onPEDFirmwareUpdateStarted in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when the firmware update is started.
 @param ped The PowaPED
 */
- (void)pedWillStartFirmwareUpdating:(PowaPEDAbstract *)ped;

/**
 <b>Reference:</b></br> onPEDFirmwareUpdateProgress in PowaPIN SDK API Specification
 @brief Event is triggered by SDK to indicate the firmware update process progress.
 @param ped The PowaPED
 @param progress Indicates % of firmware updated
 */
- (void)ped:(PowaPEDAbstract *)ped firmwareUpdateWithProgress:(NSInteger)progress;

/**
 <b>Reference:</b></br> onPEDFirmwareUpdateFinished in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when the firmware update is completed or an error occurred.
 @param ped The PowaPED
 @param result The result identifier. he result identifier. Possible values: 00 – Successful update; 01 – Check sum verification failed; 02 – Inactivity Timeout during update; 03 – Update not completed; 04 – Device disconnected
 */
- (void)ped:(PowaPEDAbstract *)ped  didFinishFirmwareUpdateWithResult:(NSInteger)result;



#pragma mark - PEDObserver (Server)

/**
 <b>Reference:</b></br> onServerError in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when an error was encountered while processing with the server.
 @param ResponseCode  The Error code(01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error)
 @param hostMessage  The additional message received from the host system to present on the
 */
- (void)ped:(PowaPEDAbstract *)ped serverErrorWithResponseCode:(NSInteger)responseCode hostMessage:(NSString*)hostMessage;

/**
 <b>Reference:</b></br> onServerResponse in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when server response was received.
 @param transactionID  The transaction ID
 @param hostMessage  The additional message received from the host system to present on the
 */
- (void)ped:(PowaPEDAbstract *)ped transactionID:(NSString *)transactionID hostMessage:(NSString*)hostMessage;

/**
 <b>Reference:</b></br> onServerUserLoginResult in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when the server finishes processing the user login request.
 @param ResponseCode  The Error code(01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error 05- Invalid login)
 */
- (void)ped:(PowaPEDAbstract *)ped loginResultWithResponseCode:(NSInteger)responseCode;

/**
 <b>Reference:</b></br> onServerSendReceiptResult in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when the server finishes processing the send receipt request.
 @param ResponseCode  The Error code(01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error)
 */
- (void)ped:(PowaPEDAbstract *)ped sendReceiptResponseCode:(NSInteger)responseCode;

/**
 <b>Reference:</b></br> onServerSetSignatureResult in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when the server finishes processing the set signature request.
 @param ResponseCode  The Error code(01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error)
 */
- (void)ped:(PowaPEDAbstract *)ped setSignatureResponseCode:(NSInteger)responseCode;

/**
 <b>Reference:</b></br> onServerSetAdditionalDataResult in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when the server finishes processing the set additional data request.
 @param ResponseCode  The Error code(01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error)
 */
- (void)ped:(PowaPEDAbstract *)ped setAdditionalDataResponseCode:(NSInteger)responseCode;

/**
 <b>Reference:</b></br> onServerGetTransactionListResult in PowaPIN SDK API Specification
 @brief Event is triggered by SDK when the server responds to the get transaction list method.
 @param ResponseCode  The Error code(01 - Network connection not available 02 - Host connection not available 03 - Connection has timed out 04 - Message format error)
 */
- (void)ped:(PowaPEDAbstract *)ped receivedTransactions:(NSArray *)transactions responseCode:(NSInteger)responseCode;




@end
