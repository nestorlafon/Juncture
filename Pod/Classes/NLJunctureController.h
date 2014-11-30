//
//  NLJunctureController.h
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 30/11/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  Block type used to prepare a view controller for segue
 *
 *  @param viewController View controller to be prepared, the destination view controller of the segue
 *  @param error          Contains any error found getting the view controller, nil otherwise.
 */
typedef void (^NLJuncturePreparationBlock)(id viewController, NSError *error);

/**
 *  The Juncture Controller is here to help you to forget about scrolling to prepareForSegue:sender: to setup or check
 *  how you are configuring the next viewcontroller after a segue, and using the beloved block syntax!.
 *
 *  You can register the block to be executed a segue identifer and simply invoking prepareForSegue: in the Juncture controller
 *  will do de work for you. You can also make your view controller class to inherit from NLJunctureViewController and forget about
 *  setting up the Juncture controller and invoking the preparation method.
 *
 *  You only set one preparation block per identifier for now, sender object is ignored for now, will be supported in the future.
 */
@interface NLJunctureController : NSObject

/**
 *  Juncture controller constructor
 *
 *  @return A new Juncture controller
 */
+ (instancetype)junctureController;

/**
 *  Adds a preparation block for a segue identifier
 *
 *  @param identifier       Segue identifer
 *  @param preparationBlock Preparation block
 */
- (void)addPreparationForIdentifier:(NSString *)identifier block:(NLJuncturePreparationBlock)preparationBlock;


/**
 *  Helper method to add a prepartion block for a segue identifier and perform it
 *
 *  @param identifier           Segue identifer
 *  @param sourceViewcontroller View controller to be used to perform the segue
 *  @param sender               The object that you want to use to initiate the segue
 *  @param preparationBlock     Preparation block
 */
- (void)addPreparationAndPerformSegueWithIdentifier:(NSString *)identifier
                               sourceViewController:(UIViewController *)sourceViewcontroller //usually the one holding the controller
                                             sender:(id)sender
                                              block:(NLJuncturePreparationBlock)preparationBlock;
/**
 *  Removes a preparation block for a segue identifier
 *
 *  @param identifier Segue identifier
 */
- (void)removePreparationForIdentifier:(NSString *)identifier;

/**
 *  Removes all preparation blocks
 */
- (void)removeAllPreparations;

/**
 *  Prepares the destination view controller for segue using the preparation block defined for the segue identifier
 *
 *  @param segue Segue to be prepared
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue;

/**
 *  Prepares the destination view controller for segue using the preparation block defined for the segue identifier
 *
 *  @param identifier     Segue identifier
 *  @param viewController Destination view controller
 */
- (void)prepareForIndentifer:(NSString *)identifier viewController:(UIViewController *)viewController;

@end
