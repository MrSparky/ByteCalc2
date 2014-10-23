//
//  CalcEngineTestCase.m
//  ByteCalc2
//
//  Created by Sean Parker on 10/2/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CalculationEngine.h"

@interface CalcEngineTestCase : XCTestCase

@end

@implementation CalcEngineTestCase

CalculationEngine * m_CalcEngine;

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    m_CalcEngine = [[CalculationEngine alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testOperands
{
    // Operands should both initially be False
    XCTAssertFalse([m_CalcEngine hasOperand_A], @"InitNoOpA");
    XCTAssertFalse([m_CalcEngine hasOperand_B], @"InitNoOpB");

    // Setting operand A should not affect B
    [m_CalcEngine setOperand_A:1];
    XCTAssertTrue([m_CalcEngine hasOperand_A], @"SetOpA");
    XCTAssertFalse([m_CalcEngine hasOperand_B], @"OpAnotOpB");
    
    // Setting operand B should not affect A
    [m_CalcEngine setOperand_B:5];
    XCTAssertTrue([m_CalcEngine hasOperand_B], @"SetOpB");
    XCTAssertTrue([m_CalcEngine hasOperand_A], @"OpBstillOpA");
    
    // Clearing operand B should not affect A
    [m_CalcEngine clearOperand_B];
    XCTAssertFalse([m_CalcEngine hasOperand_B], @"ClrOpB");
    XCTAssertTrue([m_CalcEngine hasOperand_A], @"ClrOpBstillA");
    
    // Clearing operand A should not affect B
    [m_CalcEngine setOperand_B:8];
    [m_CalcEngine clearOperand_A];
    XCTAssertFalse([m_CalcEngine hasOperand_A], @"ClrOpB");
    XCTAssertTrue([m_CalcEngine hasOperand_B], @"ClrOpAstillB");
    
    // Performing operation should clear B
    [m_CalcEngine setOperand_A:2];
    [m_CalcEngine pushAdd];
    [m_CalcEngine setOperand_B:1];
    XCTAssertEqual([m_CalcEngine performOperation], 3, @"OpsStored");
    XCTAssertTrue([m_CalcEngine hasOperand_A], @"OpApost+");
    XCTAssertTrue([m_CalcEngine hasOperand_B], @"OpBpost+");
    
}

-(void)testAddOperation
{
    // Test Static PerformAdd
    XCTAssertEqual([CalculationEngine performAddWithA:2 andB:2], 4, @"2+2=4");
    XCTAssertEqual([CalculationEngine performAddWithA:2 andB:-2], 0, @"2+(-2)=0");
    XCTAssertEqual([CalculationEngine performAddWithA:-2 andB:-2], -4, @"(-2)+(-2)=-4");
    
    XCTAssertEqual([CalculationEngine performAddWithA:NSIntegerMax andB:NSIntegerMin], -1, @"MinMax");
    XCTAssertEqual([CalculationEngine performAddWithA:NSIntegerMax andB:0], NSIntegerMax, @"MaxInt+0");
    XCTAssertEqual([CalculationEngine performAddWithA:NSIntegerMax andB:1], NSIntegerMin, @"Overflow");
}

-(void)testSubtractOperation
{
    //Test Static PerformSub
    XCTAssertEqual([CalculationEngine performSubtractWithA:5 andB:5], 0, @"5-5=0");
    XCTAssertEqual([CalculationEngine performSubtractWithA:-5 andB:-5], 0, @"(-5)-(-5)=0");
    XCTAssertEqual([CalculationEngine performSubtractWithA:5 andB:-5], 10, @"5-(-5)=10");
    XCTAssertEqual([CalculationEngine performSubtractWithA:-5 andB:5], -10, @"(-5)-5=-10");
    XCTAssertEqual([CalculationEngine performSubtractWithA:0 andB:5], -5, @"0-5=-5");
    XCTAssertEqual([CalculationEngine performSubtractWithA:5 andB:0], 5, @"5-0=5");
    
    XCTAssertEqual([CalculationEngine performSubtractWithA:NSIntegerMax andB:NSIntegerMax], 0, @"MaxInt-MaxInt");
    XCTAssertEqual([CalculationEngine performSubtractWithA:NSIntegerMax andB:0], NSIntegerMax, @"MaxInt-0");
    XCTAssertEqual([CalculationEngine performSubtractWithA:0 andB:NSIntegerMax], NSIntegerMin+1, @"0-MaxInt");
    XCTAssertEqual([CalculationEngine performSubtractWithA:NSIntegerMin andB:0], NSIntegerMin, @"MinInt-0");
    
    XCTAssertEqual([CalculationEngine performSubtractWithA:0 andB:NSIntegerMin], NSIntegerMin, @"OverflowPos");
    XCTAssertEqual([CalculationEngine performSubtractWithA:NSIntegerMin andB:1], NSIntegerMax, @"OverflowNeg");
}

-(void)testMultiplyOperation
{
    // Test Static PerformMult
    XCTAssertEqual([CalculationEngine performMultiplyWithA:3 andB:3], 9, @"3*3=9");
    XCTAssertEqual([CalculationEngine performMultiplyWithA:3 andB:4], 12, @"3*4=12");
    XCTAssertEqual([CalculationEngine performMultiplyWithA:15 andB:1], 15, @"15*1=15");
    XCTAssertEqual([CalculationEngine performMultiplyWithA:1 andB:15], 15, @"1*15=15");
    XCTAssertEqual([CalculationEngine performMultiplyWithA:10 andB:-1], -10, @"10*-1=-10");
    XCTAssertEqual([CalculationEngine performMultiplyWithA:-1 andB:-5], 5, @"-1*-5=5");
    XCTAssertEqual([CalculationEngine performMultiplyWithA:9 andB:0], 0, @"9*0=0");
    XCTAssertEqual([CalculationEngine performMultiplyWithA:0 andB:9], 0, @"0*9=0");
    
    XCTAssertEqual([CalculationEngine performMultiplyWithA:NSIntegerMax andB:1], NSIntegerMax, @"MaxInt");
    XCTAssertEqual([CalculationEngine performMultiplyWithA:NSIntegerMin andB:1], NSIntegerMin, @"MinInt");
    XCTAssertEqual([CalculationEngine performMultiplyWithA:NSIntegerMax andB:-1], NSIntegerMin+1, @"MaxIntInv");
    
    XCTAssertEqual([CalculationEngine performMultiplyWithA:NSIntegerMax andB:2], -2, @"Overflow");
    
}

-(void)testDivideOperation
{
    // Test Static PerformDiv
    XCTAssertEqual([CalculationEngine performDivideWithA:4 andB:2], 2, @"4/2=2");
    XCTAssertEqual([CalculationEngine performDivideWithA:20 andB:2], 10, @"20/2=10");
    XCTAssertEqual([CalculationEngine performDivideWithA:5 andB:1], 5, @"5/1=5");
    XCTAssertEqual([CalculationEngine performDivideWithA:5 andB:2], 2, @"5/2=2");
    XCTAssertEqual([CalculationEngine performDivideWithA:50 andB:4], 12, @"50/4=12");
}

-(void)testModuloOperation
{
    // Test Static PerformModulo
    XCTAssertEqual([CalculationEngine performModuloWithA:5 andB:3], 2, @"5%%3=2");
    XCTAssertEqual([CalculationEngine performModuloWithA:2 andB:4], 2, @"2%%4=2");
    XCTAssertEqual([CalculationEngine performModuloWithA:4 andB:2], 0, @"4%%2=0");
}

-(void)testShiftLOperation
{
    // Test Static Perform Shift Left
    XCTAssertEqual([CalculationEngine performShiftLeftWithA:4 andB:1], 8, @"4<<1=8");
    XCTAssertEqual([CalculationEngine performShiftLeftWithA:0x1234 andB:5], 0x24680, @"1234<<5");
    XCTAssertEqual([CalculationEngine performShiftLeftWithA:1 andB:30], 0x40000000, @"1<30 > 0");
    XCTAssertEqual([CalculationEngine performShiftLeftWithA:-1 andB:30], 0xC0000000, @"-1<30 < 0");
    XCTAssertEqual([CalculationEngine performShiftLeftWithA:1 andB:31], NSIntegerMin, @"1<31");
    XCTAssertEqual([CalculationEngine performShiftLeftWithA:-1 andB:31], NSIntegerMin, @"-1<<31");

    // If the right-operand of << is greater than Variable size, result is undefined!
    //XCTAssertEqual([CalculationEngine performShiftLeftWithA:1 andB:32], 0, @"1<<32=0");
    //XCTAssertEqual([CalculationEngine performShiftRightWithA:-1 andB:32], 0, @"-1<<32=0");
    
    XCTAssertEqual([CalculationEngine performShiftLeftWithA:NSIntegerMax andB:1], -2, @"MaxInt<<1");
    XCTAssertEqual([CalculationEngine performShiftLeftWithA:NSIntegerMin andB:1], 0, @"MinInOVF");
}

-(void)testShiftROperation
{
    // Test Static Perform Shift Right
    XCTAssertEqual([CalculationEngine performShiftRightWithA:4 andB:1], 2, @"4>>1=2");
    XCTAssertEqual([CalculationEngine performShiftRightWithA:0x1234 andB:2], 0x48D, @"1234>>2");
    XCTAssertEqual([CalculationEngine performShiftRightWithA:1 andB:1], 0, @"1>>1=0");
    XCTAssertEqual([CalculationEngine performShiftRightWithA:NSIntegerMax andB:31], 0, @"MaxInt>>31");
    
    // TBD - Do we wan't Sign Extend? Depends on NSInteger or NSUnsigned arguments
    XCTAssertEqual([CalculationEngine performShiftRightWithA:-1 andB:1], -1, @"-1>>1");
    XCTAssertEqual([CalculationEngine performShiftRightWithA:0x80000000 andB:1], 0xC0000000, @"MinInt>>1");
    XCTAssertEqual([CalculationEngine performShiftRightWithA:NSIntegerMin andB:31], -1, @"MinInt>>31");
    
    // If the right-operand of >> is greater than the Variable size, result is undefined!
    //XCTAssertEqual([CalculationEngine performShiftRightWithA:0x80000000 andB:32], 0, @"MinInt>>32");
}

-(void)testByteSwap
{
    XCTAssertEqual([CalculationEngine performByteSwapWithA:0x12], 0x12, @"ByteSwap8");
    XCTAssertEqual([CalculationEngine performByteSwapWithA:0x1234], 0x3412, @"ByteSwap16");
    XCTAssertEqual([CalculationEngine performByteSwapWithA:0x12345678], 0x78563412, @"ByteSwap32");
}

-(void)testInvert
{
    XCTAssertEqual([CalculationEngine performInvertWithA:0x55], 0xAA, @"Invert8");
    XCTAssertEqual([CalculationEngine performInvertWithA:0xAA55], 0x55AA, @"Invert16");
    XCTAssertEqual([CalculationEngine performInvertWithA:0xAA5500FF], 0x55AAFF00, @"Invert32");
}

@end
