//
//  AppDelegate.h
//  ByteCalc2
//
//  Created by Sean Parker on 9/13/14.
//  Copyright (c) 2014 DaedalusApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InputHandler;
@class CalculationEngine;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (InputHandler *) inputHandler;
- (CalculationEngine *) calcEngine;

@end
