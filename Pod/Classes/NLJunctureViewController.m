//
//  NLJunctureViewController.m
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 30/11/14.
//
//

#import "NLJunctureViewController.h"

@implementation NLJunctureViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.junctureController = [NLJunctureController junctureController];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self.junctureController prepareForSegue:segue];
}

@end
