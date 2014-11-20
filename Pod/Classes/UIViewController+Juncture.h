//
//  UIViewController+Juncture.h
//  Pods
//
//  Created by Nestor Lafon-Gracia on 20/11/14.
//
//

#import <UIKit/UIKit.h>

typedef void (^JunctureBlock)(UIViewController *viewController, NSError *error);

@interface UIViewController (Juncture)

- (BOOL)pushViewControllerWithIdentifier:(NSString *)identifier
                            inStoryBoard:(NSString *)storyboardId
                            onCompletion:(JunctureBlock)completionBlock;

- (BOOL)presentViewControllerWithIdentifier:(NSString *)identifier
                               inStoryBoard:(NSString *)storyboardId
                               onCompletion:(JunctureBlock)completionBlock;

- (BOOL)showViewControllerWithIdentifier:(NSString *)identifier
                            inStoryBoard:(NSString *)storyboardId
                                 pushing:(BOOL)push
                            onCompletion:(JunctureBlock)completionBlock;

- (UIViewController *)viewControllerWithIdentifier:(NSString *)identifier inStoryBoard:(NSString *)storyboardId;

@end
