//
//  HorzViewController.m
//  ByteCalc2
//
//  Created by Sean Parker on 9/13/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import "HorzViewController.h"

@interface HorzViewController ()

@end

@implementation HorzViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        [self performSegueWithIdentifier: @"SegueToHorizontal"
                                  sender: self];
    }
}

@end
