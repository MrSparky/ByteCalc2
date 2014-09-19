//
//  InputHandler.m
//  ByteCalc2
//
//  Created by Sean Parker on 9/18/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import "InputHandler.h"

@interface InputHandler () {
    BCInputMode m_InputMode;
    NSMutableString * m_InputString;
}

@end

@implementation InputHandler

- (id) init {
    self = [super init];
    if(self) {
        m_InputMode = InputModeDecimal;
        [self clearInput];
    }
    return self;
}

- (void)setInputMode:(BCInputMode)mode
{
    // TBD - what should we do w/ current input? Convert it or trash it?
    m_InputMode = mode;
}

- (void)clearInput
{
    m_InputString = [NSMutableString string];
}

- (void)removeLastCharacter
{
    NSUInteger length = [m_InputString length];
    [m_InputString deleteCharactersInRange:NSMakeRange(length - 1, 1)];
}

- (void)appendInputWithChar:(unichar)input;
{
    [m_InputString appendString:[NSString stringWithCharacters:&input length:1]];
}

- (void)appendInputWithValue:(NSInteger)input
{
    [m_InputString appendString:[NSString stringWithFormat:@"%d", input]];
}

- (void)appendInputWithLetter:(NSInteger)input
{
    [m_InputString appendString:[NSString stringWithFormat:@"%c", 'A' + input]];
}

- (void)setInputValue:(NSInteger)input
{
    m_InputString = [NSMutableString stringWithFormat:@"%d", input];
}

- (BOOL)hasValue
{
    return ([m_InputString length] > 0);
}

- (int)integerValue
{
    return [m_InputString integerValue];
}

- (NSString *)textValue
{
    return m_InputString;
}

@end
