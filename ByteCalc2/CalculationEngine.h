//
//  CalculationEngine.h
//  ByteCalc2
//
//  Created by Sean Parker on 9/15/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationEngine : NSObject

- (void)setOperand_A:(NSInteger)opA;
- (void)setOperand_B:(NSInteger)opB;

- (NSInteger)performAdd;
- (NSInteger)performSubtract;
- (NSInteger)performMultiply;
- (NSInteger)performDivide;
- (NSInteger)performModulo;
- (NSInteger)performShiftLeft;
- (NSInteger)performShiftRight;
- (NSInteger)performByteSwap;
- (NSInteger)performInvert;
- (NSInteger)performSignChange;
- (NSInteger)performLogicXOr;
- (NSInteger)performLogicAnd;
- (NSInteger)performLogicOr;

+ (NSInteger)performAddWithA:(NSInteger)opA andB:(NSInteger)opB;
+ (NSInteger)performSubtractWithA:(NSInteger)opA andB:(NSInteger)opB;
+ (NSInteger)performMultiplyWithA:(NSInteger)opA andB:(NSInteger)opB;
+ (NSInteger)performDivideWithA:(NSInteger)opA andB:(NSInteger)opB;
+ (NSInteger)performModuloWithA:(NSInteger)opA andB:(NSInteger)opB;
+ (NSInteger)performShiftLeftWithA:(NSInteger)opA andB:(NSInteger)opB;
+ (NSInteger)performShiftRightWithA:(NSInteger)opA andB:(NSInteger)opB;
+ (NSInteger)performByteSwapWithA:(NSInteger)opA;
+ (NSInteger)performInvertWithA:(NSInteger)opA;
+ (NSInteger)performSignChangeWithA:(NSInteger)opA;
+ (NSInteger)performLogicXOrWithA:(NSInteger)opA andB:(NSInteger)opB;
+ (NSInteger)performLogicAndWithA:(NSInteger)opA andB:(NSInteger)opB;
+ (NSInteger)performLogicOrWithA:(NSInteger)opA andB:(NSInteger)opB;

@end
