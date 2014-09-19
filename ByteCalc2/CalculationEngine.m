//
//  CalculationEngine.m
//  ByteCalc2
//
//  Created by Sean Parker on 9/15/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import "CalculationEngine.h"

@interface CalculationEngine (){
    NSInteger m_OpA;
    NSInteger m_OpB;
    BOOL m_HasOpA;
    BOOL m_HasOpB;
    BCOperation m_LastOperation;
}
@end

@implementation CalculationEngine

- (id) init
{
    self = [super init];
    if(self) {
        m_OpA = 0;
        m_OpB = 0;
        m_HasOpA = false;
        m_HasOpB = false;
    }
    return self;
}

- (BOOL)hasOperand_A
{
    return m_HasOpA;
}

- (BOOL)hasOperand_B
{
    return m_HasOpB;
}

- (void)setOperand_A:(NSInteger)opA
{
    m_OpA = opA;
    m_HasOpA = true;
}

- (void)setOperand_B:(NSInteger)opB
{
    m_OpB = opB;
    m_HasOpB = true;
}

- (void)clearOperand_B {
    m_HasOpB = 0;
    m_HasOpB = false;
}

- (NSInteger)performOperation
{
    switch (m_LastOperation) {
        case OperationAdd:
            return [CalculationEngine performAddWithA:m_OpA andB:m_OpB];
        case OperationSubtract:
            return [CalculationEngine performSubtractWithA:m_OpA andB:m_OpB];
        case OperationMultiply:
            return [CalculationEngine performMultiplyWithA:m_OpA andB:m_OpB];
        case OperationDivide:
            return [CalculationEngine performDivideWithA:m_OpA andB:m_OpB];
        case OperationModulo:
            return [CalculationEngine performModuloWithA:m_OpA andB:m_OpB];
        case OperationShiftL:
            return [CalculationEngine performShiftLeftWithA:m_OpA andB:m_OpB];
        case OperationShiftR:
            return [CalculationEngine performShiftRightWithA:m_OpA andB:m_OpB];
        case OperationByteSwap:
            return [CalculationEngine performByteSwapWithA:m_OpA];
        case OperationInvert:
            return [CalculationEngine performInvertWithA:m_OpA];
        case OperationLogicXor:
            return [CalculationEngine performLogicXOrWithA:m_OpA andB:m_OpB];
        case OperationLogicAnd:
            return [CalculationEngine performLogicAndWithA:m_OpA andB:m_OpB];
        case OperationLogicOr:
            return [CalculationEngine performLogicOrWithA:m_OpA andB:m_OpB];
        default:
            return 0;
    }
}

- (void)pushOperand:(BCOperation)op
{
    m_LastOperation = op;
}

- (void)pushAdd
{
    [self pushOperand:OperationAdd];
}

- (void)pushSubtract
{
    [self pushOperand:OperationSubtract];
}

- (void)pushMultiply
{
    [self pushOperand:OperationMultiply];
}

- (void)pushDivide
{
    [self pushOperand:OperationDivide];
}

- (void)pushModulo
{
    [self pushOperand:OperationModulo];
}

- (void)pushShiftLeft
{
    [self pushOperand:OperationShiftL];
}

- (void)pushShiftRight
{
    [self pushOperand:OperationShiftR];
}

- (void)pushByteSwap
{
    [self pushOperand:OperationByteSwap];
}

- (void)pushInvert
{
    [self pushOperand:OperationInvert];
}

- (void)pushLogicXOr
{
    [self pushOperand:OperationLogicXor];
}

- (void)pushLogicAnd
{
    [self pushOperand:OperationLogicAnd];
}

- (void)pushLogicOr
{
    [self pushOperand:OperationLogicOr];
}

+ (NSInteger)performAddWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA + opB;
}

+ (NSInteger)performSubtractWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA - opB;
}

+ (NSInteger)performMultiplyWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA * opB;
}

+ (NSInteger)performDivideWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA / opB;
}

+ (NSInteger)performModuloWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA % opB;
}

+ (NSInteger)performShiftLeftWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA << opB;
}

+ (NSInteger)performShiftRightWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA >> opB;
}

+ (NSInteger)performByteSwapWithA:(NSInteger)opA
{
    return opA; // TBD - determine how to perform byteSwap
}

+ (NSInteger)performInvertWithA:(NSInteger)opA
{
    return ~opA;
}

+ (NSInteger)performSignChangeWithA:(NSInteger)opA
{
    return 0 - opA;
}

+ (NSInteger)performLogicXOrWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA ^ opB;
}

+ (NSInteger)performLogicAndWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA & opB;
}

+ (NSInteger)performLogicOrWithA:(NSInteger)opA andB:(NSInteger)opB
{
    return opA | opB;
}

@end
