//
//  CalcViewController.m
//  ByteCalc2
//
//  Created by Sean Parker on 9/15/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import "CalcViewController.h"
#import "InputHandler.h"
#import "CalculationEngine.h"
#import "AppDelegate.h"

@interface CalcViewController ()
{
    InputHandler * m_InputHandler;
    CalculationEngine * m_CalcEngine;
}
@end

@implementation CalcViewController

@synthesize ResultScreen;
@synthesize BinaryResultScreen;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        m_InputHandler = [[self sharedAppDelegate] inputHandler];
        m_CalcEngine = [[self sharedAppDelegate] calcEngine];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    m_InputHandler = [[self sharedAppDelegate] inputHandler];
    m_CalcEngine = [[self sharedAppDelegate] calcEngine];
    
    [self setBitWidth:32];
    [self setInputMode:InputModeHexidecimal];
    if([m_InputHandler hasValue]) {
        [ResultScreen setText:[m_InputHandler textValue]];
    }else{
        [ResultScreen setText:@""];
    }
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

- (AppDelegate *) sharedAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma Button Handling

- (IBAction)InputModeSelected:(id)sender {
    UISegmentedControl * inputSelector = (UISegmentedControl*)sender;
    switch (inputSelector.selectedSegmentIndex) {
        case 0:
            [self setInputMode:InputModeASCII];
            break;
        case 1:
            [self setInputMode:InputModeHexidecimal];
            break;
        case 2:
            [self setInputMode:InputModeDecimal];
            break;
        case 3:
            [self setInputMode:InputModeOctal];
            break;
        default:
            // TBD - how did we get here?
            NSLog(@"Set InputMode to Unknown (%d)", inputSelector.selectedSegmentIndex);
            break;
    }
}

- (IBAction)ResultModeSelected:(id)sender {
    UISegmentedControl * inputSelector = (UISegmentedControl*)sender;
    switch (inputSelector.selectedSegmentIndex) {
        case 0:
            [self setBitWidth:32];
            break;
        case 1:
            [self setBitWidth:24];
            break;
        case 2:
            [self setBitWidth:16];
            break;
        case 3:
            [self setBitWidth:8];
            break;
        default:
            // TBD - how did we get here?
            NSLog(@"Set BitWidth to Unknown (%d)", inputSelector.selectedSegmentIndex);
            break;
    }
}

- (IBAction)tapButtonAdd:(id)sender
{
    
}

- (IBAction)tapButtonSubtract:(id)sender
{
    
}

- (IBAction)tapButtonMultiply:(id)sender
{
    
}

- (IBAction)tapButtonDivide:(id)sender
{
    
}

- (IBAction)tapButtonModulo:(id)sender
{
    
}

- (IBAction)tapButtonShiftL:(id)sender
{
    
}

- (IBAction)tapButtonShiftR:(id)sender
{
    
}

- (IBAction)tapButtonByteSwap:(id)sender
{
    
}

- (IBAction)tapbuttonInvert:(id)sender
{
    
}

- (IBAction)tapButtonSignChange:(id)sender
{
    
}

- (IBAction)tapButtonLogicXor:(id)sender
{
    
}

- (IBAction)tapButtonLogicAnd:(id)sender
{
    
}

- (IBAction)tapButtonLogicOr:(id)sender
{
    
}

- (IBAction)tapButtonEquals:(id)sender
{
    
}

- (IBAction)tapButtonClear:(id)sender
{
    
}

- (IBAction)tapButtonBackspace:(id)sender
{
    
}

@end
