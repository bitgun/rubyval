//
//  RVCalculator.m
//  RubyVal
//
//  Created by Shawn Roske on 3/19/12.
//  Copyright (c) 2012 Bitgun Interactive, LLC. All rights reserved.
//

#import "RVCalculator.h"
#import <MacRuby/MacRuby.h>

@implementation RVCalculator

- (id)init
{
    if ( self = [super init] )
    {
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"calculator" ofType:@"rb"];
        [[MacRuby sharedRuntime] evaluateFileAtPath:path];
    }
    return self;
}

- (NSString *)calculatePhrase:(NSString *)phrase error:(NSError **)error
{
    if ( phrase == nil || [phrase isEqualToString:@""] )
        *error = [NSError errorWithDomain:@"RVCalculationError" code:42 userInfo:nil];
    
    NSLog(@"calculating phrase: '%@'", phrase);
    id result = [[MacRuby sharedRuntime] evaluateString:[NSString stringWithFormat:@"CALC.process( \"%@\" )", phrase]];
    return [NSString stringWithFormat:@"%@", result];
}

@end
