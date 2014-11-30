//
//  NLJunctureViewController.h
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 30/11/14.
//
//

#import <UIKit/UIKit.h>
#import "NLJunctureController.h"
#import "UIViewController+Juncture.h"

/**
 *  NLJunctureViewController is a simple subclass of UIViewController which holds a NLJunctureController and tries to use it to prepare for segues.
 *
 *  You don't need to inherit from this class to use Juncture but doing it makes easier to take adventage of the UIViewController+Juncture methods
 *  as well as the NLJunctureController.
 *
 *  If you only want to use Juncture to easily navigate to different Storyboards you simply need to include the UIViewController category, otherwise if you
 *  want to be able to use blocks to setup the destination viewcontroller using segues you only need to use NLJunctureController and use it in 
 *  prepareForSegue:sender: as this class does.
 */
@interface NLJunctureViewController : UIViewController

@property (nonatomic, strong) NLJunctureController *junctureController;

@end
