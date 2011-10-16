//
//  GANHelpersDemoViewController.m
//  GANHelpersDemo
//
//  Created by Ahmet Ardal on 10/16/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import "GANHelpersDemoViewController.h"
#import "GANHelpers.h"
#import "OtherViewController.h"

@implementation GANHelpersDemoViewController

- (void) dealloc
{
    [super dealloc];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [GANHelpers trackPageview:@"/GANHelpersDemoViewController"];
}

- (IBAction) showOtherViewControllerButtonTapped:(id)sender
{
    [GANHelpers trackEvent:@"UI" action:@"ShowOtherViewControllerButtonTapped"];

    OtherViewController *ovc = [[OtherViewController alloc] initWithNibName:@"OtherViewController" bundle:nil];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:ovc];
    [self presentModalViewController:nc animated:YES];
    [ovc release];
    [nc release];
}

@end
