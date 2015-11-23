//
//  Log.h
//  TIBKit
//
//  Created by Mobile Developer Lloyds Bank on 28/10/2015.
//  Copyright © 2015 Rupendra. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Log class is responsible for to replace the NSLog functionality.
 * It will Print the log in DEBUG Model only
 */


/**
 *  The utility functions `TIBLog()` use the NSString string formatting services to log error messages and user defined debug
 *  log. You should take care when specifying the argument for this functions. Following example will help you for use of
 *  `TIBLog()`
 */

// TIBLog is almost a drop-in replacement for NSLog
// TIBLog();
// TIBLog(@"here");
// TIBLog(@"value: %d", x);
// Unfortunately this doesn't work TIBLog(aStringVariable); you have to do this instead TIBLog(@"%@", aStringVariable);

#ifdef DEBUG
#	define TIBLog(format, ...) NSLog((@"%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define TIBLog(...)
#endif