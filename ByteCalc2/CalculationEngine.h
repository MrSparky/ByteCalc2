//
//  CalculationEngine.h
//  ByteCalc2
//
//  Created by Sean Parker on 9/15/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum e_Operation {
    OperationAdd,
    OperationSubtract,
    OperationMultiply,
    OperationDivide,
    OperationModulo,
    OperationShiftL,
    OperationShiftR,
    OperationByteSwap,
    OperationInvert,
    OperationSignChange,
    OperationLogicXor,
    OperationLogicAnd,
    OperationLogicOr
} BCOperation;

@interface CalculationEngine : NSObject

- (BOOL)hasOperand_A;
- (BOOL)hasOperand_B;

- (void)setOperand_A:(NSInteger)opA;
- (void)setOperand_B:(NSInteger)opB;

- (void)clearOperand_A;
- (void)clearOperand_B;

- (NSInteger)performOperation;

- (void)pushOperation:(BCOperation)op;
- (void)pushAdd;
- (void)pushSubtract;
- (void)pushMultiply;
- (void)pushDivide;
- (void)pushModulo;
- (void)pushShiftLeft;
- (void)pushShiftRight;
- (void)pushLogicXOr;
- (void)pushLogicAnd;
- (void)pushLogicOr;

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

+ (NSInteger)setBit:(NSInteger)bit inValue:(NSInteger)value;
+ (NSInteger)clearBit:(NSInteger)bit inValue:(NSInteger)value;

@end
