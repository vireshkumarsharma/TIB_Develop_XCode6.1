//
//  PowaPINDriver.h
//  PowaPIN Driver
//
//  Created by Abel Duarte on 3/11/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import "PowaPINApplication.h"
#import "PowaPINDeviceInfo.h"
#import "PowaMessage.h"
#import "PowaPEDCommunicator.h"




@protocol PowaPINDriverDelegate;
@class PowaPEDCommunicator;

/** PowaPINDriver is the main API for PowaPINDriver library. It’s built to make easier develop gorgeous iOS app that needs to communicate with a “PowaPIN device”.*/

@interface PowaPEDDriver : NSObject <PowaPEDCommunicatorDelegate>
@property (nonatomic, assign) id <PowaPINDriverDelegate> delegate;


#pragma mark - Device Management

/**
 This method should be called by the mobile APP to get the value of the last battery level reading (obtained during the previous Completion Advice).
 
 <b>Reference:</b></br> getPEDBatteryLevel in PowaPIN Driver API Specification V1.07
 @brief Returns the battery level of the PowaPIN device.
 @return battery level
 */
- (NSInteger)getPEDBatteryLevel;

/**
 Requests paired devices list from mobile device.
 <b>Reference:</b></br> getAvailablePEDs in PowaPIN Driver API Specification V1.07
 @brief Called to obtain a list of connected devices.
 @return The list of devices and respective details.
 */
- (NSArray *)getAvailablePEDs;

/**
 Select device for connection.
 <b>Reference:</b></br> selectPED in PowaPIN Driver API Specification V1.07
 @param  device The selected device
 @return the void
 */
- (void)selectPED:(PowaPINDeviceInfo*)device;


/**
 This method should be called by the mobile APP to get the connected device basic information.
 <b>Reference:</b></br> getPEDInformation in PowaPIN Driver API Specification V1.07
 @return PowaDeviceInfo The Device info
 */
- (PowaPINDeviceInfo *)getPEDInformation;


#pragma mark - Update methods


/**
 This method should be called by the mobile APP whenever it finishes connecting to the PowaPIN or before every new operation taking place. The purpose for this is to make sure the PowaPIN gets all the required updates and sends any pending Completion Advice.
 
 <b>Reference:</b></br> getPEDConfigurationStatus in PowaPIN Driver API Specification V1.07
 @brief called before starting any operation on the PowaPIN.
 */

- (void)getPEDConfigurationStatus;

/**
 This method should be called by the mobile APP to initialise the connected device.
 <b>Reference:</b></br> intializePED in PowaPIN Driver API Specification V1.07
 
 @param firmwareVersion The new firmware version.
 @param newFirmware The new firmware payload to replace the current firmware.
 @param firmwareSize The total dimension in bytes of the new firmware.
 */

- (void)initPEDWithFirmwareVersion:(NSString*)version newFirmware:(NSData*)dataPacket firmwareSize:(NSInteger)length;


#pragma mark - Response Methods (OnlineAuth, Signature and CompletionAdvice)

/**
 The mobile App should call this method to return the response successfully received from the Server.

 <b>Reference:</b></br> setResponseMessage header in PowaPIN Driver API Specification V1.07
 @brief Sends the response with data from the server.
 @param data response data to be sent to powapin
 */
- (void)sendResponseWithData:(NSData *)data;

/**
 The mobile App should call this method to signal the occurrence of an error while waiting for Server response.
 
 <b>Reference:</b></br> SignalErrorFromTheApp header in PowaPIN Driver API Specification V1.07
 @brief Sends the online authorization response with error from the server.
 @param code response code to be send to powapin
 */
- (void)sendResponseWithErrorCode:(ServerErrorCode)errorCode;


/**
 The mobile App should call this method to return the result of the merchant verification.

 <b>Reference:</b></br> setSignatureVerificationResult in PowaPIN Driver API Specification V1.07
 @brief Submits signature verification result to device.
 @param confirmed confirmation result
 */
-(void)sendSignatureVerificationWithResult:(BOOL)confirmed;

/**
 The mobile App should call this method to return the application position selected by the Cardholder. Only used if the application selection is done on the MCD.

 <b>Reference:</b></br> setApplicationSelectionResult in PowaPIN Driver API Specification V1.07
 @brief Submits application selection to device when selected on mobile.
 @param applicationIndex the application index selected by the mobile
 @param success success or failure
 */

-(void)sendApplicationSelectionResult:(BOOL)success applicationIndex:(int)applicationIndex;

#pragma mark - Transaction management

/**
This method should be called by the mobile APP once it has all the information to trigger the Refund operations.
 <b>Reference:</b></br> StartTransaction in PowaPIN Driver API Specification V1.07

 @brief Starts a transaction with the PED device.
 @param operationType specifies whether the transaction is a sale, refund, cancellation or readCard.
 @param amount Should contain the transaction amount expressed in the terminal currency. The number of decimal digits is implied according to the currency exponent definition – i.e. 12345 shall be interpreted as 123.45 if the currency exponent is 2. Negative values shall not be accepted.
 @param transDate Current date/time as long
 @param cvmMethod CVM control method
 @return void
 */
- (void)startOperationWithOperationType:(PowaPINOperationType)operationType
                                 amount:(NSInteger)authorisedAmount
                              transDate:(long)transDate
                              cvmMethod:(NSInteger)cvmMethod;

/**
 This method should be called by the mobile APP once it has all the information to trigger the Cancellation operations.
 <b>Reference:</b></br> StartTransaction in PowaPIN Driver API Specification V1.07

 @brief Starts a transaction with the PED device.
 @param operationType specifies whether the transaction is a sale, refund, cancellation or readCard
 @param amount Should contain the transaction amount expressed in the terminal currency. The number of decimal digits is implied according to the currency exponent definition – i.e. 12345 shall be interpreted as 123.45 if the currency exponent is 2. Negative values shall not be accepted.
 @param transDate Current date/time as long
 @param orgTransDate Original current date/time as long
 @param orgTransID Original transaction ID
 @return returns void
 */
- (void)startOperationWithOperationType:(PowaPINOperationType)operationType
                                 amount:(NSInteger)authorisedAmount
                              transDate:(long)transDate
                           orgTransDate:(long)orgTransDate
                             orgTransID:(NSString *)identifier;
/**
This method should be called by the mobile APP once it has all the information to trigger the Sale, Refund or Cancellation operations.
 <b>Reference:</b></br> StartTransaction in PowaPIN Driver API Specification V1.07

 @brief Starts a transaction with the PED device.
 @param operationType specifies whether the transaction is a sale, refund, cancellation or readCard
 @param transDate Current date/time as long
 @param orgTransDate Original current date/time as long
 @param orgTransID Original transaction ID
 @return returns void
 */
- (void)startOperationWithOperationType:(PowaPINOperationType)operationType
                              transDate:(long)transDate
                           orgTransDate:(long)orgTransDate
                             orgTransID:(NSString *)identifier;

/**
This method should be called by the mobile APP once it has all the information to trigger the read card operations.
 <b>Reference:</b></br> StartTransaction in PowaPIN Driver API Specification V1.07

 @brief Starts a transaction with the PED device.
 @param operationType specifies whether the transaction is a sale, refund, cancellation or readCard
 @param transDate Current date/time as long
 @return returns void
 */
- (void)startOperationWithOperationType:(PowaPINOperationType)operationType
                              transDate:(long)transDate;

@end

#pragma mark -
#pragma mark PowaPINDriverDelegate

/** The delegate of a PowaPINDriver object must adopt the PowaPINDriverDelegate protocol. Optional methods of the protocol allow the delegate to perform action based on the events.*/


@protocol PowaPINDriverDelegate <NSObject>

@optional

#pragma mark- Deleagtes

/**
 This event handler should be called when all the internal procedures to initialise the device are completed.
 
 <b>Reference:</b></br> onPEDInitialised in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver to check weather firmware update is required are not.
 @param driver current PowaPINDriver object
 @param result The result identifier. Possible values: 00 – Successful initialisation, 01 – Not possible to complete initialisation

 */
- (void)powaPINDriver:(PowaPEDDriver *)driver pedInitializedWithResult:(NSInteger)result;




/**
 This event handler is called to indicate that a firmware update is about to be started.
 
 <b>Reference:</b></br> onPEDFirmwareUpdateStarted in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when a configuration update started.
 @param driver PowaPINDriver that will start updating
 */

- (void)powaPINDriverWillStartFirmwareUpdating:(PowaPEDDriver *)driver;


/**
This event handler is called to indicate the update firmware process progress.

<b>Reference:</b></br> onPEDFirmwareUpdateProgress in PowaPIN Driver API Specification V1.07
@brief Triggered by driver when no configuration download is required.
@param driver current PowaPINDriver object
@param progress Indicates % of firmware updated
 
*/

- (void)powaPINDriver:(PowaPEDDriver *)driver firmwareUpdateWithProgress:(NSInteger)progress;



/**
 This event handler is called when the firmware update process is completed or an error occurred.
 
 <b>Reference:</b></br> onPEDFirmwareUpdateFinished in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when a configuration update started.
 @param driver PowaPINDriver that will start updating
 @param result The result identifier. he result identifier. Possible values: 00 – Successful update; 01 – Check sum verification failed; 02 – Inactivity Timeout during update; 03 – Update not completed; 04 – Device disconnected
 */

- (void)powaPINDriver:(PowaPEDDriver *)driver  didFinishFirmwareUpdateWithResult:(NSInteger)result;



/**
 This event handler should be called if no updates are required by the PowaPIN. The mobile App should account for this event by proceeding with the normal operation flow.
 
 <b>Reference:</b></br> onNoUpdate in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when no configuration download is required.
 @param driver current PowaPINDriver object
 */
- (void)powaPINDriverNoUpdateNeeded:(PowaPEDDriver *)driver;


/**
 This event handler should be called to indicate that an update is about to be started. The mobile App should account for this event by preparing all communication channels with the Server.
 
 <b>Reference:</b></br> onUpdateStarted in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when a configuration update started.
 @param driver PowaPINDriver that will start updating
 */

- (void)powaPINDriverWillStartUpdating:(PowaPEDDriver *)driver;

/**
 This event handler should be called when the PowaPIN has no more updates to perform. The mobile App should account for the occurrence of several of the above updates cycles until this handler is called by the Driver. The occurrence of this event signals the end of the updates cycles and allows the mobile App to proceed with the operation flow.

 <b>Reference:</b></br> onUpdateFinished in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when configuration download completed.
 @param driver current PowaPINDriver object
 */
- (void)powaPINDriverDidFinishUpdating:(PowaPEDDriver *)driver;


/**
 This event handler should be called to indicate that a transaction is about to be started. The mobile App should account for this event by establishing communications with the server.
 
 <b>Reference:</b></br> onTransactionStarted in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when a transaction started.
 @param driver current PowaPINDriver object
 */
- (void)powaPINDriverTransactionWillStart:(PowaPEDDriver *)messageManager;


/**
 This event handler should be called to indicate that a transaction is complete.
 
 <b>Reference:</b></br> onTransactionFinished in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when transaction processing is completed.
 @param driver current PowaPINDriver object
 */
- (void)powaPINDriver:(PowaPEDDriver *)driver didFinishTransactionWithResult:(int)result;


/**
 This event handler should be called whenever an error occurred, can be triggered by receiving an error response code from the PowaPIN or from an error detected by the Driver logic (state machine or parsing routines). The mobile App should account for this event by informing the user that the operation is being terminated.
 
 <b>Reference:</b></br> onTransactionError in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when a transaction encounters an error.
 @param driver current PowaPINDriver object
 @param error transaction error code
*/
- (void)powaPINDriver:(PowaPEDDriver *)driver didFinishTransactionWithError:(NSInteger)errorCode;

/**
 This event handler should be called by the Driver to indicate that the amount was confirmed by the cardholder.
 
 <b>Reference:</b></br> onAmountConfirmed in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when amount confirmation is completed on device.
 @param driver current PowaPINDriver object
*/
- (void)powaPINDriverConfirmedTransactionAmount:(PowaPEDDriver *)driver;

/**
 This event handler should be called by the Driver to indicate that the amount was declined by the cardholder.

 <b>Reference:</b></br> copymethodhere in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when amount confirmation is declined on device.
 @param driver current PowaPINDriver object
 */
- (void)powaPINDriverDeclinedTransactionAmount:(PowaPEDDriver *)driver;

/**
 This event handler should be called by the Driver to request sending an Online Authorisation request to the server. The mobile App should account for this event by forwarding the message to the Server.
 
 <b>Reference:</b></br> onDoOnlineAuthorizationRequest in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver to request online authorization.
 @param driver current PowaPINDriver object
 @param data transaction data
 @param maskedPan maskedPan
 @param label application label
 @param waitTime The maximum time in seconds that PowaPIN will wait for the response.
 */

- (void)powaPINDriver:(PowaPEDDriver *)messageManager onlineAuthorizationWithData:(NSData *)data maskedPan:(NSString *)maskedPan applicationLabel:(NSString *)label waitTime:(NSInteger)waitTime;

/**
 This event handler should be called when the PowaPIN requires an update from the Server. The mobile App should account this event by forwarding the message to the Server.

 <b>Reference:</b></br> onDoOnlineConfigRequest in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver to resquest server configuration.
 @param driver current PowaPINDriver object
 @param data transaction data
 @param waitTime The maximum time in seconds that PowaPIN will wait for the response.
*/
- (void)powaPINDriver:(PowaPEDDriver *)driver requestedOnlineConfigurationWithData:(NSData *)data waitTime:(NSInteger)waitTime;

/**
 This event handler should be called when the PowaPIN requests a signature verification to be performed on the MCD.
 
 <b>Reference:</b></br> onVerifySignature in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver to request signature verification.
 @param driver current PowaPINDRiver object
 @param waitTime The maximum time in seconds that PowaPIN will wait for the response.
*/
- (void)powaPINDriver:(PowaPEDDriver *)driver signatureVerificationRequiredWithWaitTime:(NSInteger)time;

/**
 This event handler should be called when the PowaPIN requires sending a Completion Advice to the Server. The mobile App should account for this event by forwarding the message to the Server.
 
 <b>Reference:</b></br> onDoOnlineAdviceRequest in PowaPIN Driver API Specification V1.07

 @brief Triggered by driver to request completition advice to the server.
 @param driver current PowaPINDriver object
 @param data local data action
 @param waitTime The maximum time in seconds that PowaPIN will wait for the response.
*/
- (void)powaPINDriver:(PowaPEDDriver *)driver completionAdviceWithData:(NSData *)data waitTime:(NSInteger)waitTime;


/**
 This event handler should be called when the PowaPIN informs the common list of applications found during the EMV Build Application list phase to be presented in the MCD.
 The Selection indicator informs if the Selection should be done on the App or in the PowaPIN.
 If the Selection is to be done on the MCD the mobile App should account for this event by presenting the application list to the Cardholder for selection.

 <b>Reference:</b></br> onSelectApplication in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver to request application selection.
 @param driver current PowaPINDriver object
 @param applications list of applications
 @param onMobile application selection location
 @param waitTime The maximum time in seconds that PowaPIN will wait for the response.
*/
- (void)powaPINDriver:(PowaPEDDriver *)driver shouldSelectApplicationFromList:(NSArray *)applications location:(BOOL)onMobile waitTime:(NSInteger)waitTime;

/**
  This event handler should be called when the PowaPIN informs which EMV application was selected by the Cardholder.

 <b>Reference:</b></br> onApplicationSelected in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver to when the application was selected.
 @param driver current PowaPINDriver object
 @param application payment application selected
 */
- (void)powaPINDriver:(PowaPEDDriver *)driver didSelectApplication:(PowaPINApplication *)application;


/**
 This event handler should be called by the Driver to request the presentation of a specific message to the user.
 
 <b>Reference:</b></br> onPromptMessage in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when a message display is required by mobile application.
 @param driver current PowaPINDriver
 @param message message to be displayed
 */
- (void)powaPINDriver:(PowaPEDDriver *)driver promptMessage:(PromptMessage)message;

/**
 This event handler should be called by the Driver to request the presentation card information to the user.
 
 <b>Reference:</b></br> onCardRead in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when a card read is required by mobile application.
 @param driver current PowaPINDriver
 @param data card payload
 */

-(void)powaPINDriver:(PowaPEDDriver *)driver informCardData:(NSData *)data maskedPAN:(NSString*)maskedPAN applicationLabel:(NSString*)applicationLabel;

/**
 This event handler should be called by the Driver to SDK to notify about device connection status.
 
 <b>Reference:</b></br> onPEDConnectionResult in PowaPIN Driver API Specification V1.07
 @brief Triggered by driver when a message display is required by mobile application.
 @param driver current PowaPINDriver
 @param deviceStatus The device status
 */

- (void)powaPINDriver:(PowaPEDDriver *)driver informDeviceConnectionStatus:(NSInteger)deviceStatus;


@end