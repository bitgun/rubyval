//
//  RVCalculatorTests.m
//  RubyVal
//
//  Created by Shawn Roske on 3/19/12.
//  Copyright (c) 2012 Bitgun Interactive, LLC. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "RVCalculator.h"

@interface RVCalculatorTests : SenTestCase
{
    RVCalculator *_calculator;
}

@property (nonatomic, strong) RVCalculator *calculator;

@end

@implementation RVCalculatorTests

@synthesize calculator = _calculator;

- (void)setUp
{
    self.calculator = [[RVCalculator alloc] init];
}

- (void)testBasicAddition
{
    NSError *error = nil;
    NSString *result = [self.calculator calculatePhrase:@"1+1" error:&error];
    if ( error != nil )
        STFail([error localizedDescription]);
    
    STAssertNotNil(result, @"result is nil!");
    STAssertTrue([result isEqualToString:@"2"], @"1+1 doesn't equal 2, something is seriously amiss");
}

@end
