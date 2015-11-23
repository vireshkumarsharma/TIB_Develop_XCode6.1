
#import "PowaPINData.h"

/**
 *  The APDU represents one of the parameters of the message (see the Message class).
 *  The APDU has two format: CommandAPDU and RequestAPDU.
 *
 *  The APDU class is the superclass for the CommandAPDU and the ResponseAPDU.
 *  You should use the subclasses and avoid to instantiate it.
 */

@interface PowaAPDU : PowaPINData

/**
 *  Initialize a new APDU instance.
 *
 *  @param data the data associated to the APDU
 *
 *  @return The initalized instance of the APDU object
 */

- (id)initWithData:(NSData *)data;

/**
 *  Return the length in byte of the APDU data
 *
 *  @return The data length in byte
 */

- (NSUInteger)length;

/**
 *  The data associated with the APDU
 */

@property (nonatomic, readonly, strong) NSData *data;


@end
