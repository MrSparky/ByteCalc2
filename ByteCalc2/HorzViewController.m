//
//  HorzViewController.m
//  ByteCalc2
//
//  Created by Sean Parker on 9/13/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import "HorzViewController.h"
#import "CalculationEngine.h"

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
    return UIInterfaceOrientationLandscapeLeft;
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                 duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait ||
        toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        [self performSegueWithIdentifier: @"SegueToVertical"
                                  sender: self];
    }
}

#pragma Button Handling

- (IBAction)tapInputButton:(id)sender
{
    UIButton * button = (UIButton *)sender;
    NSString * title = [[button titleLabel] text];
    NSInteger value = [button tag];
    
    NSInteger newResult;
    
    if([title compare:@"1"] == 0)
    {
        newResult = [CalculationEngine clearBit:value inValue:[self.InputHandler integerValue]];
        //[[button titleLabel] setText:@"0"];
        [button setTitle:@"0" forState:UIControlStateNormal];
    }
    else
    {
        newResult = [CalculationEngine setBit:value inValue:[self.InputHandler integerValue]];
        //[[button titleLabel] setText:@"1"];
        [button setTitle:@"1" forState:UIControlStateNormal];
    }
    
    [self.InputHandler setInputValue:newResult];
    [self.ResultScreen setText:[self.InputHandler textValue]];

}

@end
