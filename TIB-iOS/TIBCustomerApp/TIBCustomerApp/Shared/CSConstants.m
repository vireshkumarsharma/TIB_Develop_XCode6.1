//
//  CSConstants.m
//  TIBCustomerApp
//
//  Created by Mobile Developer Lloyds Bank on 11/13/15.
//  Copyright © 2015 Rupendra. All rights reserved.
//


#import "CSConstants.h"

// This two-step procedure is necessary because the pre-processor is a bit quirky and daft.
// Its Working..Not have much idea, its start code need to follow for pre-processor
#define TO_STRING_STEP_TWO(x) #x
#define TO_STRING_STEP_ONE(x) TO_STRING_STEP_TWO(x)


NSString * const kInternetBankingPersonalSite = @ "https://" TO_STRING_STEP_ONE(IB_RETAIL_URL);

NSString * const kInternetBankingBusinessSite = @ "https://" TO_STRING_STEP_ONE(IB_BUSINESS_URL);
