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
    [self setInputMode:[m_InputHandler inputMode]];
    
    if([m_InputHandler hasValue]) {
        [self updateResultScreen];
    }else{
        [self clearResultScreen];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Public Interface

- (InputHandler *)InputHandler
{
    return m_InputHandler;
}

- (void) clearResultScreen
{
    [ResultScreen setText:@""];
    // set BinaryInputScreen to all 0s
    [BinaryResultScreen setText:[InputHandler binaryStringFromInteger:0 andWidth:32]];
}

- (void) updateResultScreen
{
    [ResultScreen setText:[m_InputHandler textValue]];
    // set BinaryInputScreen to value
    [BinaryResultScreen setText:[m_InputHandler binaryValue]];
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

#pragma Private Helper Methods

- (AppDelegate *) sharedAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void) applyOperation {
    // If user has provided input, capture it
    if([m_InputHandler hasValue])
    {
        NSInteger currentInput = [m_InputHandler integerValue];
        
        // If calculator already has 1st operand stored, apply stored operation
        // and store result as new first operation
        if([m_CalcEngine hasOperand_A])
        {
            [m_CalcEngine setOperand_B:currentInput];
            NSInteger result = [m_CalcEngine performOperation];
            [m_CalcEngine clearOperand_B];
            // TBD - store Result somewhere
            [m_CalcEngine setOperand_A:result];
            // Update Result Display
            [m_InputHandler setInputValue:result];
            [self updateResultScreen];
        }
        // store input as 1st operand
        else
        {
            [m_CalcEngine setOperand_A:currentInput];
        }
        [m_InputHandler resetInput];
    }
}

- (void) applyImmediateOp:(BCOperation)op
{
    // If user has provided input, capture it
    if([m_InputHandler hasValue])
    {
        NSInteger currentInput = [m_InputHandler integerValue];
        NSInteger result;
        
        if(op == OperationSignChange)
        {
            result = [CalculationEngine performSignChangeWithA:currentInput];
        }
        else if(op == OperationInvert)
        {
            result = [CalculationEngine performInvertWithA:currentInput];
        }
        else if(op == OperationByteSwap)
        {
            result = [CalculationEngine performByteSwapWithA:currentInput];
        }
        else{
            // Unsupported operation
            NSLog(@"Attempted to apply unsupported ImmediateOp! (%d)", op);
            return;
        }
        
        [m_InputHandler setInputValue:result];
        [self updateResultScreen];
        [m_InputHandler resetInput];
    }
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
    [self applyOperation];
    
    [m_CalcEngine pushAdd];
}

- (IBAction)tapButtonSubtract:(id)sender
{
    [self applyOperation];
    
    [m_CalcEngine pushSubtract];
}

- (IBAction)tapButtonMultiply:(id)sender
{
    [self applyOperation];
    
    [m_CalcEngine pushMultiply];
}

- (IBAction)tapButtonDivide:(id)sender
{
    [self applyOperation];
    
    [m_CalcEngine pushDivide];
}

- (IBAction)tapButtonModulo:(id)sender
{
    [self applyOperation];
    
    [m_CalcEngine pushModulo];
}

- (IBAction)tapButtonShiftL:(id)sender
{
    [self applyOperation];
    
    [m_CalcEngine pushShiftLeft];
}

- (IBAction)tapButtonShiftR:(id)sender
{
    [self applyOperation];
    
    [m_CalcEngine pushShiftRight];
}

- (IBAction)tapButtonByteSwap:(id)sender
{
    [self applyImmediateOp:OperationByteSwap];
}

- (IBAction)tapbuttonInvert:(id)sender
{
    [self applyImmediateOp:OperationInvert];
}

- (IBAction)tapButtonSignChange:(id)sender
{
    [self applyImmediateOp:OperationSignChange];
}

- (IBAction)tapButtonLogicXor:(id)sender
{
    [self applyOperation];
    
    [m_CalcEngine pushLogicXOr];
}

- (IBAction)tapButtonLogicAnd:(id)sender
{
    [self applyOperation];
    
    [m_CalcEngine pushLogicAnd];
}

- (IBAction)tapButtonLogicOr:(id)sender
{
    [self applyOperation];
    
    [m_CalcEngine pushLogicOr];
}

- (IBAction)tapButtonEquals:(id)sender
{
    [self applyOperation];
    // Equals breaks the result / operation chain
    [m_CalcEngine clearOperand_A];
}

- (IBAction)tapButtonClear:(id)sender
{
    // If input present, just erase
    if([m_InputHandler hasValue])
    {
        [m_InputHandler clearInput];
        [self updateResultScreen];
    }
    // If no input, reset calculator
    else
    {
        [m_CalcEngine clearOperand_A];
        [m_CalcEngine clearOperand_B];
    }
}

- (IBAction)tapButtonBackspace:(id)sender
{
    [m_InputHandler removeLastCharacter];
    [self updateResultScreen];
}


@end
