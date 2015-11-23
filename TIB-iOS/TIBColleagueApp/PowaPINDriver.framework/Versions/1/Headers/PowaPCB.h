
#import "PowaPINData.h"

@interface PowaPCB : PowaPINData

typedef NS_ENUM(NSInteger, PowaPINMessageType) {
    PowaPINMessageTypeResponse = 0,
    PowaPINMessageTypeCommand = 1
};

@property (nonatomic, assign, readonly) uint8_t byte;
@property (nonatomic, assign, readonly) PowaPINMessageType messageType;

/**
 *  Returns a PCB object which is initialized from the 8 bit byte.
 *
 *  @param byte An 8 bit byte
 *
 *  @return PCB object which has been initialized with the byte object
 */

- (instancetype)initWithByte:(uint8_t)byte;

/**
 Returns a PCB object which is initialized from the message type
 @param type A uint value which specifies the messageType
 */

/**
 *   Returns a PCB object which is initialized from the message type
 *
 *  @param type An unsigned integer value which specifies the messageType
 *
 *  @return PCB object which has been initialized an unsigned integer
 */
- (instancetype)initWithMessageType:(PowaPINMessageType)type;

/**
 *  Returns a PCB object which is initialized from a NSData object. This method overrides the Super Class method
 *
 *  @param data NSData with an 8 bit byte
 *
 *  @return PCB object which has been initialied by an NSData object
 */

- (instancetype)initWithData:(NSData *)data;

@end
