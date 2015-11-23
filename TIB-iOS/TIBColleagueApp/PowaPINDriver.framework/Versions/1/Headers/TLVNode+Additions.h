//
//  TLVNode+Additions.h
//  PowaPOS SDK
//
//  Created by Abel Duarte on 3/26/14.
//  Copyright (c) 2014 Smart Business Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PowaPINTLVNode.h"
#import "PowaPINDriverContsants.h"

@interface PowaPINTLVNode (Additions)

/**
 The method to create a Transaction Date TLV
 @param date The date of the transaction
 */

+ (PowaPINTLVNode *)createTLVTransactionDate:(NSDate *)date;

+ (PowaPINTLVNode *)createTLVOriginalTransactionDate:(NSDate *)date;

/**
 The method to create a Transaction Time TLV
 @param time The time of the transaction
 */

+ (PowaPINTLVNode *)createTLVTransactionTime:(NSDate *)time;

+ (PowaPINTLVNode *)createTLVOriginalTransactionTime:(NSDate *)time;

/**
 The method to create a Transaction Type TLV
 @param transactionType The transaction type of the transaction
 */

+ (PowaPINTLVNode *)createTLVTransactionType:(PowaPINTransactionType)transactionType;

/**
 *  This method creates a Operation Type TLV
 *
 *  @param operationType PowaPINOperationType
 *
 *  @return BERTLV object
 */
+ (PowaPINTLVNode *)createTLVOperationType:(PowaPINOperationType)operationType;

/**
 The method to create an Amount Authorised TLV
 @param amount The amount of the transaction
 */

+ (PowaPINTLVNode *)createTLVAmount:(NSInteger)amount;

+ (PowaPINTLVNode *)createTLVOriginalSalesIdentifier:(NSString *)identifier;


/**
 The method to create an Acquirer ID TLV
 @param acquirerID The acquirer ID
 */

+ (PowaPINTLVNode *)createTLVAcquirerID:(NSString *)acquirerID;


/**
 The method to create CVM TLV
 @param cvmType The CVM type
 */

+ (PowaPINTLVNode *)createTLVCvmType:(NSInteger)cvmType;
+ (PowaPINTLVNode *)createTLVSoftwarePackageVersion:(NSString *)softwareVersion;
+ (PowaPINTLVNode *)createTLVSoftwarePackageLength:(NSInteger)length;

@end
