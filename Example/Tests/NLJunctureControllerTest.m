//
//  NLJunctureControllerTest.m
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 07/12/14.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

#import "Kiwi.h"
#import "NLJunctureController.h"
#import "NLViewController.h"

SPEC_BEGIN(NLJunctureControllerTest)

describe(@"Juncture contoller tests", ^{
    
    context(@"+junctureController", ^{
        NLJunctureController *ctl = [NLJunctureController junctureController];
        [[ctl should] beNonNil];
    });

    context(@"-addPreparationForIdentifier:block:", ^{
        NLJunctureController *ctl = [NLJunctureController junctureController];
        __block UIViewController *vc = nil;
        [ctl addPreparationForIdentifier:@"id" block:^(id viewController, NSError *error) {
            vc = viewController;
        }];
        UIViewController *testVC = [UIViewController new];
        [[expectFutureValue(vc) shouldEventually] equal:testVC];
        [ctl prepareForIndentifer:@"id" viewController:testVC];
    });

    context(@"-addPreparationAndPerformSegueWithIdentifier:sourceViewController:sender:block:", ^{
        
    });

    context(@"-removePreparationForIdentifier:", ^{
        
    });

    context(@"-removeAllPreparations", ^{
        
    });

    context(@"-prepareForSegue:", ^{
        

    });

    context(@"-prepareForIndentifer:viewController:", ^{
        
        
    });
});

SPEC_END
