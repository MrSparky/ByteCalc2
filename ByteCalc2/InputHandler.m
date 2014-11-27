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
    NSInteger m_InputValue;
    BOOL m_PendingReset;
}

@end

@implementation InputHandler

@synthesize  inputMode;

- (id) init {
    self = [super init];
    if(self) {
        m_PendingReset = false;
        m_InputMode = InputModeHexidecimal;
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
    // Convert the old input string into the new base
    NSInteger curVal = self.integerValue;
    m_InputMode = mode;
    
    m_InputString = [NSMutableString stringWithString:[self getStringForValueInBase:curVal]];
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
    [m_InputString appendString:[self getStringForValueInBase:input]];
    //[m_InputString appendString:[NSString stringWithFormat:@"%d", (int)input]];
}

- (void)appendInputWithLetter:(NSInteger)input
{
    if(m_PendingReset)
        [self clearInput];
    [m_InputString appendString:[NSString stringWithFormat:@"%c", 'A' + (char)input]];
}

- (void)setInputValue:(NSInteger)input
{
    m_InputString = [NSMutableString stringWithString:[self getStringForValueInBase:input]];
}

- (BOOL)hasValue
{
    return ([m_InputString length] > 0);
}

- (NSInteger)integerValue
{
    NSInteger value;
    switch (m_InputMode) {
        case InputModeHexidecimal:
            value = [InputHandler integerFromString:m_InputString withBase:16];
            break;
        case InputModeDecimal:
        default:
            value = [m_InputString integerValue];
            break;
        case InputModeOctal:
            value = [InputHandler integerFromString:m_InputString withBase:8];
            break;
        case InputModeASCII:
            
            break;
    }
    return value;
}

- (NSString *)textValue
{
    return m_InputString;
}

- (NSString *)binaryValue
{
    return [InputHandler binaryStringFromInteger:self.integerValue andWidth:32];
}

- (NSString*)getStringForValueInBase:(NSInteger)value
{
    switch (m_InputMode) {
        case InputModeOctal:
            return [NSString stringWithFormat:@"%O", value];
        case InputModeDecimal:
            return [NSString stringWithFormat:@"%D", value];
        case InputModeHexidecimal:
            return [NSString stringWithFormat:@"%X", value];
        default:
            NSLog(@"Unable to convert InputMode to Unknown");
            return @"*ERR*";
    }
}

+(NSString *)binaryStringFromInteger:(NSInteger)number andWidth:(NSInteger)width
{
    NSMutableString * string = [[NSMutableString alloc] init];
    
    int spacing = pow( 2, 3 );
    //int spacing = pow( 2, 2 );
    //int barring = pow( 2, 3 );
    //int width = ( sizeof( number ) ) * spacing;
    int binaryDigit = 0;
    int integer = (int)number;
    
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

+(NSInteger)integerFromString:(NSString *)value withBase:(NSInteger)base
{
    NSInteger intVal = 0;
    value = [value uppercaseString];
    
    for (int i = 0; i < [value length]; i++)
    {
        char digit = [value characterAtIndex:([value length] - i) - 1];
        if(digit <= '9') {
            intVal += (digit - '0') * pow(base, i);
        }else{
            intVal += ((digit - 'A') + 10) * pow(base, i);
        }
    }
    
    return intVal;
}

+(NSInteger)integerFromASCII:(NSString *)value
{
    NSInteger intVal = 0;
    
    return intVal;
}


@end
