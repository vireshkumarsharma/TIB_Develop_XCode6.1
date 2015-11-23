//
//  NSData+Helper.h
//  PowaPINDriver
//
//  Created by Deepak Shukla on 11/08/2014.
//  Copyright (c) 2014 mpowa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (NSDataHelper)

- (NSURL *)applicationDocumentsDirectory;

- (void)storeData:(NSData*)data atFilePath:(NSURL*)urlPath;

- (NSData*)retriveDataFromFilePath:(NSURL*)urlPath;

@end
