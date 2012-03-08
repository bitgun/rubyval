//
//  MRRubyValService.m
//  MacRubyTest
//
//  Created by Shawn Roske on 3/7/12.
//  Copyright (c) 2012 Bitgun Interactive, LLC. All rights reserved.
//

#import "RVService.h"

@implementation RVService

- (void)evaluateRuby:(NSPasteboard *)pboard userData:(NSString *)userData error:(NSString **)error
{
    NSLog(@"!!!!!!evaluateRuby: %@", pboard);
    NSString *pboardString;
    NSString *newString;
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
    
     NSLog(@"!!!!!!pboardString: %@", pboardString);
    
    NSString *source =  [NSString stringWithFormat:@"module Calculator; def self.process; (%@); end; end", pboardString];
    [[MacRuby sharedRuntime] evaluateString:source];
    id helper = [[MacRuby sharedRuntime] evaluateString:@"Calculator"];
    newString = [NSString stringWithFormat:@"%@", [helper performRubySelector:@selector(process)]];
    
    types = [NSArray arrayWithObject:NSStringPboardType];
    [pboard declareTypes:types owner:nil];
    [pboard setString:newString forType:NSStringPboardType];
}

@end
