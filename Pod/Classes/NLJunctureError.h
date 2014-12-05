//
//  NLJunctureError.h
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 30/11/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  Juncture error domain identifier
 */
FOUNDATION_EXTERN NSString *const kJunctureErrorDomain;

/**
 *  Juncture error codes
 */
typedef NS_ENUM(NSInteger, NLJunctureErrorCode){
    /**
     *  Undefined Error
     */
    NLJunctureErrorUndefined = 1000,
    /**
     *  Valid view controller error not found
     */
    NLJunctureErrorValidViewControllerNotFound,
    /**
     *  Navigation controller for push not found
     */
    NLJunctureErrorNavigationControllerNotFound
};

/**
 *  Helper class for creating common error for Juncture
 */
@interface NLJunctureError : NSError

/**
 *  Undefined error
 *
 *  @return An error for Juncture error domain
 */
+ (NSError *)undefinedError;

/**
 *  Error when needed view controller to complete operation is not found
 *
 *  @return An error for Juncture error domain
 */
+ (NSError *)validViewControllerNotFoundError;

/**
 *  Error when needed navigation controller to complete operation is not found
 *
 *  @return An error for Juncture error domain
 */
+ (NSError *)validNavigationControllerNotFoundError;

@end
