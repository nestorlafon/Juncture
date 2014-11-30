//
//  NLJunctureController.m
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 30/11/14.
//
//

#import "NLJunctureController.h"
#import "NLJunctureError.h"

@interface NLJunctureController ()
@property (nonatomic, strong) NSMapTable *preparationsTable;
@end

@implementation NLJunctureController

+ (instancetype)junctureController {
    NLJunctureController *controller = [self new];
    controller.preparationsTable = [NSMapTable mapTableWithKeyOptions:NSMapTableCopyIn valueOptions:NSMapTableCopyIn];
    return controller;
}

//TODO: support sender, to chose the block but also to recieve it in the block
- (void)addPreparationForIdentifier:(NSString *)identifier block:(NLJuncturePreparationBlock)preparationBlock {
    [self.preparationsTable setObject:preparationBlock forKey:identifier];
}

- (void)addPreparationAndPerformSegueWithIdentifier:(NSString *)identifier
                               sourceViewController:(UIViewController *)sourceViewcontroller //usually the one holding the controller
                                             sender:(id)sender
                                              block:(NLJuncturePreparationBlock)preparationBlock {
    [self addPreparationForIdentifier:identifier block:preparationBlock];
    [sourceViewcontroller performSegueWithIdentifier:identifier sender:sender];
}

- (void)removePreparationForIdentifier:(NSString *)identifier {
    [self.preparationsTable removeObjectForKey:identifier];
}

- (void)removeAllPreparations {
    [self.preparationsTable removeAllObjects];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue {
    if (segue) {
        [self prepareForIndentifer:segue.identifier viewController:segue.destinationViewController];
    }
}

- (void)prepareForIndentifer:(NSString *)identifier viewController:(UIViewController *)viewController {
    NLJuncturePreparationBlock preparationBlock = [self.preparationsTable objectForKey:identifier];
    if (preparationBlock) {
        if ([viewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navigationViewController = (UINavigationController *)viewController;
            if ([[navigationViewController viewControllers] count] > 0) {
                preparationBlock([[navigationViewController viewControllers] firstObject], nil);
            }
            else {
                preparationBlock(nil, [NLJunctureError validViewControllerNotFoundError]);
            }
        }
        else {
            preparationBlock(viewController, nil);
        }
    }
}

@end