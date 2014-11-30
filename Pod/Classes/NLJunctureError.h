//
//  NLJunctureError.h
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 30/11/14.
//
//

#import <Foundation/Foundation.h>

@interface NLJunctureError : NSError

+ (NSError *)undefinedError;
+ (NSError *)validViewControllerNotFoundError;
@end
