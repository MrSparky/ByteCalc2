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
    BOOL m_PendingReset;
}

@end

@implementation InputHandler

@synthesize  inputMode;

- (id) init {
    self = [super init];
    if(self) {
        m_PendingReset = false;
        m_InputMode = InputModeDecimal;
        [self clearInput];
    }
    return self;
}

- (BCInputMode)inputMode
{
    return m_InputMode;
}

- (void)setInputMode:(BCInputMode)mode
{
    // TBD - what should we do w/ current input? Convert it or trash it?
    m_InputMode = mode;
}

- (void)clearInput
{
    m_InputString = [NSMutableString string];
    m_PendingReset = false;
}

- (void)resetInput
{
    m_PendingReset = true;
}

- (void)removeLastCharacter
{
    NSUInteger length = [m_InputString length];
    [m_InputString deleteCharactersInRange:NSMakeRange(length - 1, 1)];
    // TBD - should this clear the pending "reset"?
}

- (void)appendInputWithChar:(unichar)input;
{
    if(m_PendingReset)
        [self clearInput];
    [m_InputString appendString:[NSString stringWithCharacters:&input length:1]];
}

- (void)appendInputWithValue:(NSInteger)input
{
    if(m_PendingReset)
        [self clearInput];
    [m_InputString appendString:[NSString stringWithFormat:@"%d", input]];
}

- (void)appendInputWithLetter:(NSInteger)input
{
    if(m_PendingReset)
        [self clearInput];
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

- (NSInteger)integerValue
{
    return [m_InputString integerValue];
}

- (NSString *)textValue
{
    return m_InputString;
}

- (NSString *)binaryValue
{
    return [InputHandler binaryStringFromInteger:self.integerValue andWidth:32];
}

+(NSString *)binaryStringFromInteger:(NSInteger)number andWidth:(NSInteger)width
{
    NSMutableString * string = [[NSMutableString alloc] init];
    
    int spacing = pow( 2, 3 );
    //int spacing = pow( 2, 2 );
    //int barring = pow( 2, 3 );
    //int width = ( sizeof( number ) ) * spacing;
    int binaryDigit = 0;
    int integer = number;
    
    while( binaryDigit < width )
    {
        binaryDigit++;
        
        [string insertString:( (integer & 1) ? @"1" : @"0" )atIndex:0];
        
        if( binaryDigit % spacing == 0 && binaryDigit != width)
        {
            [string insertString:@" " atIndex:0];
        }
        /*if ( binaryDigit % barring == 0 && binaryDigit != width)
        {
            [string insertString:@" |" atIndex:0];
        }*/
        
        integer = integer >> 1;
    }
    
    return string;
}

@end
