//
//  NLJunctureError.m
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 30/11/14.
//
//

#import "NLJunctureError.h"

NSString *const kJunctureErrorDomain = @"kJunctureErrorDomain";

@implementation NLJunctureError

+ (NSError *)undefinedError {
    return [NSError errorWithDomain:kJunctureErrorDomain code:NLJunctureErrorUndefined userInfo:nil];
}

+ (NSError *)validViewControllerNotFoundError {
    return [NSError errorWithDomain:kJunctureErrorDomain code:NLJunctureErrorValidViewControllerNotFound userInfo:nil];
}

+ (NSError *)validNavigationControllerNotFoundError {
    return [NSError errorWithDomain:kJunctureErrorDomain code:NLJunctureErrorNavigationControllerNotFound userInfo:nil];
}

@end
