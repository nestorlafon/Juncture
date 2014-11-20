//
//  NLViewController.m
//  Juncture
//
//  Created by Nestor Lafon-Gracia on 11/19/2014.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

#import "NLViewController.h"
#import "UIViewController+Juncture.h"

@interface NLViewController () <UIActionSheetDelegate>

@end

@implementation NLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    actionButton.frame = CGRectMake(0, 0, 100, 100);
    [actionButton setTitle:@"Action" forState:UIControlStateNormal];
    [actionButton addTarget:self action:@selector(actionButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionButton];
    actionButton.center = self.view.center;
    
    if (self.navigationController && [self.navigationController.viewControllers count] == 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated)];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonAction:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Actions" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
    @"Push navVC",
    @"Present navVC",
    @"Push standaloneVC",
    @"Present standaloneVC",
    @"Push modalVC",
    @"Present modalVC",
    @"Dismiss current",
    nil];
    [actionSheet showInView:self.view];
}

- (void)dismissModalViewControllerAnimated {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self pushViewControllerWithIdentifier:@"navVC" inStoryBoard:@"NLShowModalCustom" onCompletion:nil];
            break;
        case 1:
            [self presentViewControllerWithIdentifier:nil inStoryBoard:@"NLShowModalCustom" onCompletion:nil];
            break;
        case 2:
            [self pushViewControllerWithIdentifier:@"standaloneVC" inStoryBoard:@"NLStandaloneViewController" onCompletion:nil];
            break;
        case 3:
            [self presentViewControllerWithIdentifier:@"standaloneVC" inStoryBoard:@"NLStandaloneViewController" onCompletion:nil];
            break;
        case 4:
            [self pushViewControllerWithIdentifier:@"modalVC" inStoryBoard:@"NLShowModalCustom" onCompletion:nil];
            break;
        case 5:
            [self presentViewControllerWithIdentifier:@"modalVC" inStoryBoard:nil onCompletion:nil];
            break;
        default:
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            break;
    }
}

@end
