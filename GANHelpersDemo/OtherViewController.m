//
//  OtherViewController.m
//  GANHelpersDemo
//
//  Created by Ahmet Ardal on 10/16/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import "OtherViewController.h"
#import "GANHelpers.h"

@implementation OtherViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

#pragma mark - View lifecycle

- (IBAction) doneButtonTapped:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    [GANHelpers trackEvent:@"UI" action:@"OtherViewControllerDoneButtonTapped"];
}

- (void) viewDidLoad
{
    [super viewDidLoad];

    self.title = @"OtherViewController";

    UIBarButtonItem *bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                        target:self
                                                                        action:@selector(doneButtonTapped:)];
    self.navigationItem.rightBarButtonItem = bi;
    [bi release];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [GANHelpers trackPageview:@"/OtherViewController"];
}

@end
