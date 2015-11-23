#import <Foundation/Foundation.h>

enum
{
    MessageTypeResponse = 0x00,
    MessageTypeCommand = 0x10
};
typedef UInt8 MessageType;

#import "PowaPINData.h"

#import "PowaPCB.h"

/**
 *  Message Header represents a portion of a Message. It includes the ST, RFU, PCB, LEN.
 */

@interface PowaMessageHeader : PowaPINData

@property (nonatomic, strong, readonly) PowaPCB *pcb;
@property (nonatomic, readonly) uint16_t apduLength; //length does not include LRC
@property (nonatomic, strong, readonly) NSData *apduLengthData;

/**
 *  Return the data of the message header without the first four bytes of the ST ('P','O','W','A'). (read-only)
 */

@property (nonatomic, readonly, strong) NSData *dataWithoutST;

/**
 *  Initialization method that creates and returns a Message Header object with PCB object and an APDU length
 *
 *  @param pcb        The PCB object used to create the Message Header
 *  @param apduLength The apduLength indicates how long the apdu is
 *
 *  @return An instance of an Message Header object
 */

- (instancetype)initWithPCB:(PowaPCB *)pcb apduLength:(NSUInteger)apduLength;

/**
 *   Initialization method that creates and returns a Message Header object with PCB byte and an APDU length
 *
 *  @param pcbByte    The PCB byte used to create the Message Header
 *  @param apduLength The apduLength indicates how long the apdu is
 *
 *  @return An instance of an Message Header object
 */

- (instancetype)initWithPCBByte:(UInt8)pcbByte apduLength:(NSUInteger)apduLength;

- (instancetype)initWithMessageType:(MessageType)messageType apduLength:(NSUInteger)apduLength;

/**
 *  Returns a Message Header object from a PCB byte and APDU length parameters
 *
 *  @param pcbByte    The PCB byte used to create the Message Header
 *  @param apduLength The apduLength indicates how long the apdu is
 *
 *  @return An instance of an Message Header object
 */

+ (instancetype)messageHeaderWithPCBByte:(UInt8)pcbByte apduLength:(NSUInteger)apduLength;

/**
 *  Returns a Message Header object from the PCB object and APDU length parameters
 *
 *  @param pcb The PCB object used to create the Message Header
 *  @param apduLength The apduLength indicates how long the apdu is
 *
 *  @return An instance of a Message Header object
 */

+ (instancetype)messageHeaderWithPCB:(PowaPCB *)pcb apduLength:(NSUInteger)apduLength;

/**
 *  Returns a Message Header object from a NSData object
 *
 *  @param data The NSData object with the message data
 *
 *  @return An instance of a Message Header object
 */

+ (instancetype)messageHeaderWithMessageType:(MessageType)messageType apduLength:(NSUInteger)apduLength;

- (instancetype)initWithData:(NSData *)data;

@end
