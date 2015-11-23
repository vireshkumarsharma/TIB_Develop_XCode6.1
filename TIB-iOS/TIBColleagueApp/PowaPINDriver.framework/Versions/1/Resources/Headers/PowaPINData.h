#import <Foundation/Foundation.h>

@interface PowaPINData : NSObject

/**
 Initialization method which takes an NSData object
 @param data An NSData object which represents the object in bytes
 */

- (id)initWithData:(NSData *)data;

- (NSUInteger)length;

@property (nonatomic, readonly, strong) NSData *data;


@end
