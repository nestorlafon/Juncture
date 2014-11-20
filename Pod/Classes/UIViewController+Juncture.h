//
//  UIViewController+Juncture.h
//  Pods
//
//  Created by Nestor Lafon-Gracia on 20/11/14.
//
//

#import <UIKit/UIKit.h>

typedef void (^junctureBlock)(UIViewController *viewController, NSError *error);

@interface UIViewController (Juncture)
- (BOOL)pushViewControllerWithIdentifier:(NSString *)identifier inStoryBoard:(NSString *)storyboardId onCompletion:(junctureBlock)completionBlock;
- (BOOL)presentViewControllerWithIdentifier:(NSString *)identifier inStoryBoard:(NSString *)storyboardId onCompletion:(junctureBlock)completionBlock;
- (UIViewController *)viewControllerWithIdentifier:(NSString *)identifier inStoryBoard:(NSString *)storyboardId;
@end
