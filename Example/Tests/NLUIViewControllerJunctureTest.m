//
//  NLUIViewControllerJunctureTest.m
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 04/12/14.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

#import "Kiwi.h"
#import "UIViewController+Juncture.h"
#import "NLXibViewController.h"
#import "NLJunctureError.h"

SPEC_BEGIN(NLUIViewControllerJunctureTest)

describe(@"finding tests", ^{
    
    NLViewController *rootVC = (NLViewController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    context(@"using a valid VC id and ST id", ^{
        context(@"and a valid ST id", ^{
            it(@"should find the view controller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:@"standaloneVC" inStoryBoard:@"NLStandaloneViewController"];
                [[vc shouldNot] beNil];
            });
        });
        
        context(@"and an invalid ST id", ^{
            it(@"should NOT find the view controller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:@"standaloneVC" inStoryBoard:@"invalidID"];
                [[vc should] beNil];
            });
        });

        context(@"and an incorrect ST id", ^{
            it(@"should NOT find the view controller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:@"standaloneVC" inStoryBoard:@"NLShowModalCustom"];
                [[vc should] beNil];
            });
        });

        context(@"and nil ST id being the next VC in the same ST as the presenter", ^{
            it(@"should find the view controller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:@"modalVC" inStoryBoard:nil];
                [[vc shouldNot] beNil];
            });
        });
        
        context(@"and nil ST id NOT being the next VC in the same ST as the presenter", ^{
            it(@"should NOT find the view controller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:@"standaloneVC" inStoryBoard:nil];
                [[vc should] beNil];                
            });
        });
    });
    
    context(@"using a valid ST id", ^{
        context(@"and an invalid VC id", ^{
            it(@"should NOT find the view controller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:@"invalidID" inStoryBoard:@"NLStandaloneViewController"];
                [[vc should] beNil];
            });
        });
        
        context(@"and a nil VC id", ^{
            it(@"should find the view controller if ST has initial viewcontroller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:nil inStoryBoard:@"NLStandaloneViewController"];
                [[vc shouldNot] beNil];
            });
        });
    });
    
    
    context(@"using a invalid VC id, being the VC id VC controller class with xib", ^{
        context(@"with valid ST id", ^{
            it(@"should find the view controller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:@"NLXibViewController" inStoryBoard:@"NLStandaloneViewController"];
                [[vc shouldNot] beNil];
            });
        });
        
        context(@"with invalid ST id", ^{
            it(@"should find the view controller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:@"NLXibViewController" inStoryBoard:@"invalidID"];
                [[vc shouldNot] beNil];
            });
        });
        
        context(@"with nil ST id", ^{
            it(@"should find the view controller", ^{
                UIViewController *vc = [rootVC viewControllerWithIdentifier:@"NLXibViewController" inStoryBoard:nil];
                [[vc shouldNot] beNil];
            });
        });
    });
});


describe(@"navigation tests", ^{
    
    NLViewController *rootVC = (NLViewController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    context(@"presenting modaly a viewcontroller", ^{
        it(@"view controller found is presented", ^{
            BOOL good = [rootVC presentViewControllerWithIdentifier:@"NLXibViewController" inStoryBoard:nil onCompletion:nil];
            UIViewController *pVC = rootVC.presentedViewController;
            
            [[theValue(good) should] beYes];
            [[pVC shouldNot] beNil];
            [[pVC should] beKindOfClass:[NLXibViewController class]];
        });
        
        it(@"view controller not found is not presented", ^{
            __block NSError *e = nil;
            UIViewController *ppVC = rootVC.presentedViewController;
            BOOL good = [rootVC presentViewControllerWithIdentifier:@"invalidID" inStoryBoard:nil onCompletion:^(id viewController, NSError *error) {
                e = error;
            }];
            UIViewController *pVC = rootVC.presentedViewController;
            
            [[theValue(good) should] beNo];
            [[ppVC should] equal:pVC];
            [[expectFutureValue(theValue(e.code)) shouldEventually] equal:@(NLJunctureErrorValidViewControllerNotFound)];
        });
        
        
    });
    
    context(@"push a viewcontroller", ^{
        context(@"into a navigation stack", ^{
            it(@"view controller found is pushed", ^{
                UINavigationController *nvc = (UINavigationController *)rootVC;
                [[nvc should] receive:@selector(pushViewController:animated:)];
                UIViewController *vc = [nvc topViewController];
                __block UIViewController *pvc = nil;
                BOOL good = [vc pushViewControllerWithIdentifier:@"NLXibViewController" inStoryBoard:nil onCompletion:^(id viewController, NSError *error) {
                    pvc = viewController;
                }];
                [[theValue(good) should] beYes];
                [[expectFutureValue(pvc) shouldEventually] beKindOfClass:[NLXibViewController class]];
            });
        
            it(@"view controller not found is not pushed", ^{
                UINavigationController *nvc = (UINavigationController *)rootVC;
                [[nvc should] receive:@selector(pushViewController:animated:) withCount:0];
                UIViewController *vc = [nvc topViewController];
                __block UIViewController *pvc = nil;
                __block NSError *e = nil;
                BOOL good = [vc pushViewControllerWithIdentifier:@"invalidID" inStoryBoard:nil onCompletion:^(id viewController, NSError *error) {
                    pvc = viewController;
                    e = error;
                }];
                [[theValue(good) should] beNo];
                [[expectFutureValue(pvc) shouldEventually] beNil];
                [[expectFutureValue(theValue(e.code)) shouldEventually] equal:@(NLJunctureErrorValidViewControllerNotFound)];
            });
            
            it(@"view controller is a navigation controller and the root view controller is pushed", ^{
                UINavigationController *nvc = (UINavigationController *)rootVC;
                [[nvc should] receive:@selector(pushViewController:animated:)];
                UIViewController *vc = [nvc topViewController];
                __block UIViewController *pvc = nil;
                __block UINavigationController *pnvc = nil;
                BOOL good = [vc pushViewControllerWithIdentifier:nil inStoryBoard:@"NLShowModalCustom" onCompletion:^(UIViewController *viewController, NSError *error) {
                    pvc = viewController;
                    pnvc = viewController.navigationController;
                }];
                [[theValue(good) should] beYes];
                [[expectFutureValue(pnvc) shouldNotEventually] equal:nvc];
                [[expectFutureValue(pnvc) shouldNotEventually] equal:expectFutureValue(pvc.navigationController)];
                [[expectFutureValue(pnvc) shouldEventually] beKindOfClass:[UINavigationController class]];
                [[expectFutureValue(pvc) shouldNotEventually] beKindOfClass:[UINavigationController class]];
            });
            
        });
        
        //TODO:
//        context(@"without a navigation stack", ^{
//            it(@"view controller is not pushed and error in completion returnes", ^{
//
//            });
//        });

    });
    
    
});

describe(@"configuration tests", ^{
    
    NLViewController *rootVC = (NLViewController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    context(@"if next vc controller is found", ^{
        it(@"configuration block sets the correct title", ^{
            
            NSString *titleToSet = @"TEST_TITLE_1";
            __block UIViewController *vc = nil;
            [rootVC presentViewControllerWithIdentifier:@"standaloneVC" inStoryBoard:@"NLStandaloneViewController" onCompletion:^(UIViewController *viewController, NSError *error) {
                viewController.title = titleToSet;
                vc = viewController;
            }];
            [[expectFutureValue(vc) shouldEventually] beNonNil];
            [[expectFutureValue(vc.title) shouldEventually] equal:titleToSet];
        });
    });
    
    context(@"if next vc controller is not found", ^{
        it(@"configuration blocks get the correct error", ^{
            
             __block UIViewController *vc = nil;
             __block NSError *e = nil;
            [rootVC presentViewControllerWithIdentifier:@"invalidID" inStoryBoard:nil onCompletion:^(UIViewController *viewController, NSError *error) {
                vc = viewController;
                e = error;
            }];
            
            [[expectFutureValue(vc) shouldEventually] beNil];
            [[expectFutureValue(e) shouldEventually] beNonNil];
            [[expectFutureValue(theValue(e.code)) shouldEventually] equal:@(NLJunctureErrorValidViewControllerNotFound)];
        });
    });

    
});

SPEC_END
