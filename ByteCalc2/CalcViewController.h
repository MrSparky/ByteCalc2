//
//  CalcViewController.h
//  ByteCalc2
//
//  Created by Sean Parker on 9/15/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcViewController : UIViewController

- (IBAction)tapButtonAdd:(id)sender;
- (IBAction)tapButtonSubtract:(id)sender;
- (IBAction)tapButtonMultiply:(id)sender;
- (IBAction)tapButtonDivide:(id)sender;
- (IBAction)tapButtonModulo:(id)sender;
- (IBAction)tapButtonShiftL:(id)sender;
- (IBAction)tapButtonShiftR:(id)sender;
- (IBAction)tapButtonByteSwap:(id)sender;
- (IBAction)tapbuttonInvert:(id)sender;
- (IBAction)tapButtonSignChange:(id)sender;
- (IBAction)tapButtonLogicXor:(id)sender;
- (IBAction)tapButtonLogicAnd:(id)sender;
- (IBAction)tapButtonLogicOr:(id)sender;
- (IBAction)tapButtonEquals:(id)sender;
- (IBAction)tapButtonClear:(id)sender;
- (IBAction)tapButtonBackspace:(id)sender;

@end
