//
//  InputHandlerTestCase.m
//  ByteCalc2
//
//  Created by Sean Parker on 11/9/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "InputHandler.h"

@interface InputHandlerTestCase : XCTestCase

@end

@implementation InputHandlerTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testInputConvert {
    InputHandler * ih = [[InputHandler alloc] init];
    [ih setInputMode:InputModeDecimal];
    // Ensure changing input base does not change result, but changes text
    [ih setInputValue:10];
    XCTAssertEqual([ih integerValue], 10);
    XCTAssertEqualObjects([ih textValue], @"10");
    [ih setInputMode:InputModeHexidecimal];
    XCTAssertEqual([ih integerValue], 10);
    XCTAssertEqualObjects([ih textValue], @"A");
    [ih setInputMode:InputModeOctal];
    XCTAssertEqual([ih integerValue], 10);
    XCTAssertEqualObjects([ih textValue], @"12");

    // Ensure input in various bases results in correct output
    [ih resetInput];
    [ih setInputMode:InputModeHexidecimal];
    [ih appendInputWithChar:'F'];
    XCTAssertEqual([ih integerValue], 15);
    [ih setInputMode:InputModeOctal];
    XCTAssertEqualObjects([ih textValue], @"17");
    [ih appendInputWithChar:'5'];
    XCTAssertEqual([ih integerValue], 125);
    [ih setInputMode:InputModeHexidecimal];
    XCTAssertEqualObjects([ih textValue], @"7D");
    [ih appendInputWithChar:'A'];
    XCTAssertEqual([ih integerValue], 2010);
    [ih setInputMode:InputModeDecimal];
    XCTAssertEqualObjects([ih textValue], @"2010");
    [ih appendInputWithChar:'2'];
    XCTAssertEqual([ih integerValue], 20102);
    [ih setInputMode:InputModeHexidecimal];
    XCTAssertEqualObjects([ih textValue], @"4E86");
    
}

- (void)testBaseConvert {
    // Test Binary Base Conversion
    XCTAssertEqual([InputHandler integerFromString:@"1" withBase:2], 1);
    XCTAssertEqual([InputHandler integerFromString:@"10" withBase:2], 2);
    XCTAssertEqual([InputHandler integerFromString:@"100" withBase:2], 4);
    XCTAssertEqual([InputHandler integerFromString:@"1010" withBase:2], 10);
    XCTAssertEqual([InputHandler integerFromString:@"10010101" withBase:2], 0x95);
    XCTAssertEqual([InputHandler integerFromString:@"0000000011111111" withBase:2], 0x00FF);
    XCTAssertEqual([InputHandler integerFromString:@"1010101001010101" withBase:2], 0xAA55);
    
    // Test Octal Base Conversion
    XCTAssertEqual([InputHandler integerFromString:@"1" withBase:8], 01);
    XCTAssertEqual([InputHandler integerFromString:@"10" withBase:8], 010);
    XCTAssertEqual([InputHandler integerFromString:@"100" withBase:8], 0100);
    XCTAssertEqual([InputHandler integerFromString:@"123" withBase:8], 0123);
    XCTAssertEqual([InputHandler integerFromString:@"456" withBase:8], 0456);
    XCTAssertEqual([InputHandler integerFromString:@"701" withBase:8], 0701);
    XCTAssertEqual([InputHandler integerFromString:@"012345" withBase:8], 0012345);
    XCTAssertEqual([InputHandler integerFromString:@"125125" withBase:8], 0xAA55);
    
    // Test Decimal Base Conversion
    XCTAssertEqual([InputHandler integerFromString:@"1" withBase:10], 1);
    XCTAssertEqual([InputHandler integerFromString:@"10" withBase:10], 10);
    XCTAssertEqual([InputHandler integerFromString:@"100" withBase:10], 100);
    XCTAssertEqual([InputHandler integerFromString:@"123" withBase:10], 123);
    XCTAssertEqual([InputHandler integerFromString:@"456" withBase:10], 456);
    XCTAssertEqual([InputHandler integerFromString:@"789" withBase:10], 789);
    XCTAssertEqual([InputHandler integerFromString:@"012" withBase:10], 12);
    XCTAssertEqual([InputHandler integerFromString:@"43605" withBase:10], 0xAA55);
    
    // Test Hexidecimal Base Conversion
    XCTAssertEqual([InputHandler integerFromString:@"1" withBase:16], 0x1);
    XCTAssertEqual([InputHandler integerFromString:@"10" withBase:16], 0x10);
    XCTAssertEqual([InputHandler integerFromString:@"100" withBase:16], 0x100);
    XCTAssertEqual([InputHandler integerFromString:@"123" withBase:16], 0x123);
    XCTAssertEqual([InputHandler integerFromString:@"4567" withBase:16], 0x4567);
    XCTAssertEqual([InputHandler integerFromString:@"89AB" withBase:16], 0x89AB);
    XCTAssertEqual([InputHandler integerFromString:@"CDEF" withBase:16], 0xCDEF);
    XCTAssertEqual([InputHandler integerFromString:@"0FF0" withBase:16], 0x0FF0);
    XCTAssertEqual([InputHandler integerFromString:@"AA55" withBase:16], 0xAA55);
    // Test Hexidecimal Base w/ leading 0x
    //XCTAssertEqual([InputHandler integerFromString:@"0xAA" withBase:16], 0xAA);
    
}

@end
