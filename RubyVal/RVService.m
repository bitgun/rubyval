//
//  MRRubyValService.m
//  MacRubyTest
//
//  Created by Shawn Roske on 3/7/12.
//  Copyright (c) 2012 Bitgun Interactive, LLC. All rights reserved.
//

#import "RVService.h"

@implementation RVService

@synthesize calculator = _calculator;
- (RVCalculator *)calculator
{
    if ( _calculator == nil )
    {
        RVCalculator *c = [[RVCalculator alloc] init];
        [self setCalculator:c];
    }
    return _calculator;
}

- (void)evaluateRuby:(NSPasteboard *)pboard userData:(NSString *)userData error:(NSString **)error
{
    NSString *pboardString;
    NSArray *types;
    
    types = [pboard types];
    if (![types containsObject:NSStringPboardType]) {
        *error = NSLocalizedString(@"Error: couldn't evaluate text.",
                                   @"pboard couldn't give the correct type.");
        return;
    }
    pboardString = [pboard stringForType:NSStringPboardType];
    if (!pboardString) {
        *error = NSLocalizedString(@"Error: couldn't evaluate text.",
                                   @"pboard couldn't give string.");
        return;
    }
    
    NSError *calculationError = nil;
    NSString *newString = [self.calculator calculatePhrase:pboardString error:&calculationError];
    if ( calculationError == nil ) 
    {
        types = [NSArray arrayWithObject:NSStringPboardType];
        [pboard declareTypes:types owner:nil];
        [pboard setString:newString forType:NSStringPboardType];
    }
    else
        *error = NSLocalizedString(@"Error: unable to calculate text", [calculationError localizedString]);
}

@end
