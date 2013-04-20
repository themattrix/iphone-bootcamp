//
//  Generator.m
//  PasswordGenerator
//
//  Created by Matt Tardiff on 4/19/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "Generator.h"

@implementation Generator

-(NSString *)generateRandom:(int)length
{
    // available letters to make the password
    NSString *availableLetters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    
    // array to hold the password components
    NSMutableString *components = [[NSMutableString alloc] initWithCapacity:length];
    
    // generate
    for (int i = 0; i < length; i++)
    {
        unichar c = [availableLetters characterAtIndex:arc4random() % [availableLetters length]];
        [components appendFormat:@"%C", c];
    }
    
    // return
    return components;
}

@end
