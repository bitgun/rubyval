//
//  main.m
//  MacRubyTest
//
//  Created by Shawn Roske on 3/6/12.
//  Copyright (c) 2012 Bitgun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVService.h"

int main (int argc, const char * argv[])
{
    @autoreleasepool 
    {
        RVService *service = [[RVService alloc] init];
        NSRegisterServicesProvider(service, @"RubyValService");
        [[NSRunLoop currentRunLoop] acceptInputForMode:NSDefaultRunLoopMode 
                                            beforeDate:[NSDate dateWithTimeIntervalSinceNow:30.0]];
        [service release];
    }
    return 0;
}

