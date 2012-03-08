//
//  MRRubyValService.h
//  MacRubyTest
//
//  Created by Shawn Roske on 3/7/12.
//  Copyright (c) 2012 Bitgun Interactive, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <MacRuby/MacRuby.h>

@interface RVService : NSObject
{
    // nothing
}

- (void)evaluateRuby:(NSPasteboard *)pboard userData:(NSString *)userData error:(NSString **)error;

@end
