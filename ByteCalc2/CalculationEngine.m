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
}
@end

@implementation CalculationEngine

- (void)setOperand_A:(NSInteger)opA
{
    m_OpA = opA;
}

- (void)setOperand_B:(NSInteger)opB
{
    m_OpB = opB;
}

- (NSInteger)performAdd
{
    return [CalculationEngine performAddWithA:m_OpA andB:m_OpB];
}

- (NSInteger)performSubtract
{
    return [CalculationEngine performSubtractWithA:m_OpA andB:m_OpB];
}

- (NSInteger)performMultiply
{
    return [CalculationEngine performMultiplyWithA:m_OpA andB:m_OpB];
}

- (NSInteger)performDivide
{
    return [CalculationEngine performDivideWithA:m_OpA andB:m_OpB];
}

- (NSInteger)performModulo
{
    return [CalculationEngine performModuloWithA:m_OpA andB:m_OpB];
}

- (NSInteger)performShiftLeft
{
    return [CalculationEngine performShiftLeftWithA:m_OpA andB:m_OpB];
}

- (NSInteger)performShiftRight
{
    return [CalculationEngine performShiftRightWithA:m_OpA andB:m_OpB];
}

- (NSInteger)performByteSwap
{
    return [CalculationEngine performByteSwapWithA:m_OpA];
}

- (NSInteger)performInvert
{
    return [CalculationEngine performInvertWithA:m_OpA];
}

- (NSInteger)performSignChange
{
    return [CalculationEngine performSignChangeWithA:m_OpA];
}

- (NSInteger)performLogicXOr
{
    return [CalculationEngine performLogicXOrWithA:m_OpA andB:m_OpB];
}

- (NSInteger)performLogicAnd
{
    return [CalculationEngine performLogicAndWithA:m_OpA andB:m_OpB];
}

- (NSInteger)performLogicOr
{
    return [CalculationEngine performLogicOrWithA:m_OpA andB:m_OpB];
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
