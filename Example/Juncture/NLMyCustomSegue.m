//
//  NLMyCustomSegue.m
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 20/11/14.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

#import "NLMyCustomSegue.h"

@implementation NLMyCustomSegue
- (void) perform {
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    [UIView transitionWithView:src.navigationController.view duration:0.2
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [src.navigationController pushViewController:dst animated:NO];
                    }
                    completion:NULL];
}
@end
