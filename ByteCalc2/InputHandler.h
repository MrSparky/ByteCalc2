//
//  InputHandler.h
//  ByteCalc2
//
//  Created by Sean Parker on 9/18/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum e_InputMode {
    InputModeASCII,
    InputModeHexidecimal,
    InputModeDecimal,
    InputModeOctal
} BCInputMode;

@interface InputHandler : NSObject

@property (assign) BCInputMode inputMode;

// returns Input to 'empty' string
- (void)clearInput;

// keeps input unchanged, but next append will clear overwrite input
- (void)resetInput;

- (void)removeLastCharacter;

- (void)appendInputWithChar:(unichar)input;
- (void)appendInputWithValue:(NSInteger)input;
- (void)appendInputWithLetter:(NSInteger)input;

- (void)setInputValue:(NSInteger)input;

- (BOOL)hasValue;
- (NSInteger)integerValue;
- (NSString *)textValue;
- (NSString *)binaryValue;

+(NSString *)binaryStringFromInteger:(NSInteger)number andWidth:(NSInteger)width;

@end
