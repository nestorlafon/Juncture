//
//  UIViewController+Juncture.h
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 20/11/14.
//
//

#import <UIKit/UIKit.h>

/**
 *  Block type used to setup the next view controller
 *
 *  @param viewController View controller to be setup
 *  @param error          Contains any error found getting the view controller, nil otherwise.
 */
typedef void (^NLJunctureBlock)(id viewController, NSError *error);

/**
 *  Category adding easy methods to navigate between storyboards using storyboards and viewcontrollers identifiers
 */
@interface UIViewController (Juncture)

/**
 *  Pushes a view controller and sets it up using the completion block
 *
 *  @param identifier      View controller identifier
 *  @param storyboardId    Storyboard identifier
 *  @param completionBlock Setup block for the next view controller
 *
 *  @return YES if the view controller can be shown, NO otherwise
 */
- (BOOL)pushViewControllerWithIdentifier:(NSString *)identifier
                            inStoryBoard:(NSString *)storyboardId
                            onCompletion:(NLJunctureBlock)completionBlock;
/**
 *  Presents a view controller and sets it up using the completion block
 *
 *  @param identifier      View controller identifier
 *  @param storyboardId    Storyboard identifier
 *  @param completionBlock Setup block for the next view controller
 *
 *  @return YES if the view controller can be shown, NO otherwise
 */
- (BOOL)presentViewControllerWithIdentifier:(NSString *)identifier
                               inStoryBoard:(NSString *)storyboardId
                               onCompletion:(NLJunctureBlock)completionBlock;
/**
 *  Shows a view controller and sets it up using the completion block
 *
 *  @param identifier      View controller identifier
 *  @param storyboardId    Storyboard identifier
 *  @param push            YES if the view controller needs to be pushed, NO if it needs to be presented
 *  @param completionBlock Setup block for the next view controller
 *
 *  @return YES if the view controller can be shown, NO otherwise
 */
- (BOOL)showViewControllerWithIdentifier:(NSString *)identifier
                            inStoryBoard:(NSString *)storyboardId
                                 pushing:(BOOL)push
                            onCompletion:(NLJunctureBlock)completionBlock;
/**
 *  Finds a view controller using view controller and storyboard identifiers
 *
 *  @param identifier   View controller identifier
 *  @param storyboardId Storyboard identifier
 *
 *  @return The view controller with the identifier in the storyboard with the identifier, nil otherwise
 */
- (UIViewController *)viewControllerWithIdentifier:(NSString *)identifier inStoryBoard:(NSString *)storyboardId;

@end
