//
//  VertViewController.m
//  ByteCalc2
//
//  Created by Sean Parker on 9/15/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import "VertViewController.h"

@interface VertViewController ()

@end

@implementation VertViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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


- (UIButton *)getButtonforValue:(NSInteger)value
{
    return (UIButton *)[self.view viewWithTag:value];
}


#pragma Button Handling

- (IBAction)tapInputButton:(id)sender
{
    UIButton * button = (UIButton *)sender;
    NSString * title = [[button titleLabel] text];
    //NSInteger value = [button tag];
    
    [self.InputHandler appendInputWithChar:[title characterAtIndex:0]];
    [self updateResultScreen];
}

// Override
- (IBAction)InputModeSelected:(id)sender
{
    [super InputModeSelected:sender];
    switch (self.InputMode)
    {
        case InputModeASCII:
        case InputModeHexidecimal:
            [[self getButtonforValue:15] setEnabled:YES];
            [[self getButtonforValue:14] setEnabled:YES];
            [[self getButtonforValue:13] setEnabled:YES];
            [[self getButtonforValue:12] setEnabled:YES];
            [[self getButtonforValue:11] setEnabled:YES];
            [[self getButtonforValue:10] setEnabled:YES];
            [[self getButtonforValue:9]  setEnabled:YES];
            [[self getButtonforValue:8]  setEnabled:YES];
            break;
        case InputModeDecimal:
            [[self getButtonforValue:15] setEnabled:NO];
            [[self getButtonforValue:14] setEnabled:NO];
            [[self getButtonforValue:13] setEnabled:NO];
            [[self getButtonforValue:12] setEnabled:NO];
            [[self getButtonforValue:11] setEnabled:NO];
            [[self getButtonforValue:10] setEnabled:NO];
            [[self getButtonforValue:9]  setEnabled:YES];
            [[self getButtonforValue:8]  setEnabled:YES];
            break;
        case InputModeOctal:
            [[self getButtonforValue:15] setEnabled:NO];
            [[self getButtonforValue:14] setEnabled:NO];
            [[self getButtonforValue:13] setEnabled:NO];
            [[self getButtonforValue:12] setEnabled:NO];
            [[self getButtonforValue:11] setEnabled:NO];
            [[self getButtonforValue:10] setEnabled:NO];
            [[self getButtonforValue:9]  setEnabled:NO];
            [[self getButtonforValue:8]  setEnabled:NO];
            break;
        default:
            NSLog(@"Unsupported InputMode for VerViewController! (%d)", self.InputMode);
            break;
    }
}


@end
