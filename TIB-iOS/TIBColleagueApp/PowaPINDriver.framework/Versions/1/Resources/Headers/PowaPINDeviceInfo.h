//
//  PINDevice.h
//  PowaPINDriver
//
//  Created by Deepak Shukla on 24/06/2014.
//  Copyright (c) 2014 mpowa. All rights reserved.
//

#import <ExternalAccessory/ExternalAccessory.h>

/** Contains details regarding a device. */

@interface PowaPINDeviceInfo : NSObject

@property (nonatomic, retain) EAAccessory *accessory;

@property (nonatomic, retain) NSString *name;

@property (nonatomic, retain) NSString *macAddress;

@property (nonatomic) NSInteger position;

@property (nonatomic, retain) NSString *firmwareVersion;


@end
