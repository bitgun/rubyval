//
//  RVMacRubyTests.m
//  RubyVal
//
//  Created by Shawn Roske on 3/13/12.
//  Copyright (c) 2012 Bitgun Interactive, LLC. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MacRuby/MacRuby.h>

@interface RVMacRubyTests : SenTestCase

@end

@implementation RVMacRubyTests

- (void)testBundleLogic
{
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"calculator" ofType:@"rb"];
    id res = [[MacRuby sharedRuntime] evaluateFileAtPath:path];
    STAssertNotNil(res, @"result is NIL");
}

- (void)testLogicInjection
{    
    NSString *source =  [NSString stringWithFormat:@"require 'rubygems'; require 'active_support/time'; module Calculator; def self.process; (%@); end; end", @"1.day.ago"];
    [[MacRuby sharedRuntime] evaluateString:source];
    id helper = [[MacRuby sharedRuntime] evaluateString:@"Calculator"];
    NSString *result = [NSString stringWithFormat:@"%@", [helper performRubySelector:@selector(process)]];
    STAssertNotNil(result, @"result is NIL");
}


@end
