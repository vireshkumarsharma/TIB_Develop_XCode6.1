//
//  PowaPINManager.h
//  PowaPIN SDK
//
//  Created by Abel Duarte on 3/13/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>

@class PED;

/** This class helps to manage the list of connected PowaPIN Devices */


@interface PowaPEDManager : NSObject

/**
 Use the returned singleton to discover connected PED devices
 @brief Returns a PEDManager singleton used to discover connected PED devices.
 @return returns a PEDManager singleton
 */

+ (PowaPEDManager *)sharedManager;

#pragma mark -
#pragma mark Devices

/**
 Returns all connected PED devices
 @brief Returns all connected devices that adhere to the PED interface.
 @return returns an array of connected PED devices
 */

- (NSArray *)getAvailablePEDs;

/**
 @brief PowaPIN is the registerd device class.
 @return Returns object of device class type.
 */
- (id) getRegisterdDeviceType;


@end
