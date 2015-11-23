#import "PowaPINData.h"
#import "PowaMessageHeader.h"
#import "PowaPINDriverContsants.h"

@class PowaMessageHeader;
@class PowaAPDU;

/**
 *  The Message represents a command that can be recived or send. It's a semplification of the
 *  ISO 7816-4. The message as the following structur
 *___________________________________________________________________________
 *  ST | Fixed value 'P'                                                | 1 |
 *  ST | Fixed value 'O'                                                | 1 |
 *  ST | Fixed value 'W'                                                | 1 |
 *  ST | Fixed value 'A'                                                | 1 |
 * RFU | Future use. Fixed with value 0x00                              | 1 |
 * PCB | The protocol control byte provides message type info           | 1 |
 * LEN | The LEN bytes indicates the number of bytes of the APDU        |1-3|
 * APDU| Request or Response application protocol data unit             |var|
 * LRC | Longitudinal redundancy check calculated over the entire cmd   | 1 |
 *___________________________________________________________________________
 *
 */

@interface PowaMessage : PowaPINData

/**
 *  Calculate the LRC of the provided data
 *
 *  @param data The data on which to calculate the LRC
 *
 *  @return The LRC value
 */

+ (uint8_t)calculateLRC:(NSData *)data;

/**
 *  The header associated with the message. (read-only)
 */

@property (nonatomic, readonly, strong) PowaMessageHeader *header;

/**
 *  The apdu associated with the message. (read-only)
 */

@property (nonatomic, readonly, strong) PowaAPDU *apdu;

/**
 *  The type of the message. (read-only)
 */

@property (nonatomic, readonly, assign) MessageType type;

/**
 *  The LRC (Longitudinal Redundancy Check) associated with the message. (read-only)
 */

@property (nonatomic, readonly, assign) uint8_t lrc;

/**
 *  The encoded data of the message
 */

@property (nonatomic, readonly) NSData *data;


/**
 *  This method creates a start operation message
 *
 *  @param date             Operation date
 *  @param authorisedAmount Peration amount
 *  @param cvmMethod        CVM Method
 *  @param operationType    PowaPINOperationType
 *
 *  @return An instance of the Message class
 */

+ (instancetype)startOperationMessageWithDate:(NSDate *)date
                            transactionAmount:(NSInteger)transactionAmount
                                    cvmMethod:(NSInteger)cvmMethod
                                operationType:(PowaPINOperationType)operationType;





/**
 *  This method creates a refund operation message
 *
 *  @param date                     Operation date
 *  @param authorisedAmount         Peration amount
 *  @param operationType            PowaPINOperationType
 *  @param originalDate             Transaction date
 *  @param originalSaleIdentifier   Transaction identifier
 *
 *  @return An instance of the Message class
 */


+ (instancetype)startOperationMessageWithDate:(NSDate *)date
                             authorisedAmount:(NSInteger)authorisedAmount
                                operationType:(PowaPINOperationType)operationType
                                 originalDate:(NSDate *)originalDate
                       originalSaleIdentifier:(NSString *)identifier;




/**
 *  This method creates a cancellation operation message
 *
 *  @param date                     Operation date
 *  @param operationType            PowaPINOperationType
 *  @param originalDate             Transaction date
 *  @param originalSaleIdentifier   Transaction identifier
 *
 *  @return An instance of the Message class
 */


+ (instancetype)startOperationMessageWithDate:(NSDate *)date
                                operationType:(PowaPINOperationType)operationType
                                 originalDate:(NSDate *)originalDate
                       originalSaleIdentifier:(NSString *)identifier;


/**
 *  This method creates a read operation message
 *
 *  @param date                     Operation date
 *  @param operationType            PowaPINOperationType
 *
 *  @return An instance of the Message class
 */


+(instancetype)readCardWithDate:(NSDate *)date
                  operationType:(PowaPINOperationType)operationType;




+ (instancetype)resetOperationMessage;

+(instancetype)initiateOperationMessageWithSoftwareVersion:(NSString *)version andLength:(NSInteger)length;


/**
 *  This method creates a response message
 *
 *  @param responseCode Response code
 *  @param data         Message data
 *
 *  @return An instance of the Message class
 */

+ (instancetype)responseMessageWithResponseCode:(PowaPINMessageResponseCode)responseCode data:(NSData *)data;

/**
 *  Initialization method which makes a Message object with a Messager Header and an APDU object
 *  Use it for the encoding
 *
 *  @param header The message header of the message
 *  @param apdu   The apdu of the message
 *
 *  @return A initialized instance of a Message
 */

- (id)initWithHeader:(PowaMessageHeader *)header apdu:(PowaAPDU *)apdu;

/**
 *  Initialization method which makes a Message object with a Messager Header and an APDU object
 *  Use it for the decoding
 *
 *  @param data The raw data that rappresent the message.
 *
 *  @return A initialized instance of the message
 */

- (id)initWithData:(NSData *)data;

@end
