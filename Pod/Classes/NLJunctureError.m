//
//  NLJunctureError.m
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 30/11/14.
//
//

#import "NLJunctureError.h"

static NSString *const kJunctureErrorDomain = @"kJunctureErrorDomain";

typedef NS_ENUM(NSInteger, NLJunctureErrorCode) {
    NLJunctureErrorUndefined,
    NLJunctureErrorValidViewControllerNotFound
};

@implementation NLJunctureError

+ (NSError *)undefinedError {
    return [NSError errorWithDomain:kJunctureErrorDomain code:NLJunctureErrorUndefined userInfo:nil];
}

+ (NSError *)validViewControllerNotFoundError {
    return [NSError errorWithDomain:kJunctureErrorDomain code:NLJunctureErrorValidViewControllerNotFound userInfo:nil];
}

@end
