#import "PowaAPDU.h"
#import "PowaPINDriverContsants.h"

/**
 *  The ResponseAPDU represents one of the two possible APDU format
 *  The APDU represents one of the parameters of the message (see the Message class).
 *
 *  <table>
 *  <tr>    <td>Field</td>  <td>Description</td>                            <td>Length</td>     </tr>
 *  <tr>    <td>Data</td>   <td>String of data bytes in the response</td>   <td>var</td>        </tr>
 *  <tr>    <td>SW1</td>    <td>Command processing status</td>              <td>1</td>          </tr>
 *  <tr>    <td>SW2</td>    <td>Command processing qualifier</td>           <td>1</td>          </tr>
 *  </table>
 *
 *  This class is able to decode a response received from the PowaPIN and also it is able to
 *  encode a response for the PowaPIN.
 *
 */

@class PowaPINTLVNode;

@interface PowaResponseAPDU : PowaAPDU

/**
 *  The sw1 value associated to the ResponseAPDU
 */

@property (nonatomic, readonly) uint8_t sw1;

/**
 *  The sw2 value associated to the ResponseAPDU
 */

@property (nonatomic, readonly) uint8_t sw2;

/**
 *  The data that rappresent the whole ResponseAPDU
 */

@property (nonatomic, readonly, strong) NSData *data;

/**
 *  The data contained in the responseAPDU.
 */

@property (nonatomic, readonly, strong) NSData *responseData;

/**
 *  The response code
 */
@property (nonatomic, readonly, assign) PowaPINMessageResponseCode responseCode;

/**
 *  Initialize a new APDU instance. Should be used to decode a response received from the PowaPIN.
 *
 *  @param data the data associated to the APDU
 *
 *  @return The initalized instance of the APDU object
 */

- (id)initWithData:(NSData *)data;

/**
 *  Initialization method which creates and returns a Response APDU object with an Byte object, SW1 8 bit byte and SW2 8 bit byte
 *
 *  @param tlv The TLV object used to make the Response APDU object
 *  @param sw1 The 8 bit byte used to indiciate the SW1 of a Response APDU
 *  @param sw2 The 8 bit byte used to indiciate the SW2 of a Response APDU
 *
 *  @return A initialized instance of the ResponseAPDU
 */

- (id)initWithTLV:(PowaPINTLVNode *)tlv sw1:(uint8_t)sw1 sw2:(uint8_t)sw2;

/**
 *  Initialization method which creates and returns a Response APDU object with an Byte object, SW1 8 bit byte and SW2 8 bit byte
 *
 *  @param data The Byte object used to make the Response APDU object
 *  @param sw1 The 8 bit byte used to indiciate the SW1 of a Response APDU
 *  @param sw2 The 8 bit byte used to indiciate the SW2 of a Response APDU
 *
 *  @return A initialized instance of the ResponseAPDU
 */

- (id)initWithValueData:(NSData *)data sw1:(uint8_t)sw1 sw2:(uint8_t)sw2;

/**
 *  Initialization method which creates and returns a Response APDU object with the Response Code and the Byte 
 *  object.
 *  The data associated at this Response APDU has the following format
 *
 *  @param responseCode responseCode The response code used to make the Response APDU object
 *  @param data         The Byte object used to make the Response APDU object
 *
 *  @return A initialized instance of the ResponseAPDU
 */

- (id)initWithResponseCode:(PowaPINMessageResponseCode)responseCode data:(NSData *)data;

@end
