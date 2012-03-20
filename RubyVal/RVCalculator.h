//
//  RVCalculator.h
//  RubyVal
//
//  Created by Shawn Roske on 3/19/12.
//  Copyright (c) 2012 Bitgun Interactive, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RVCalculator : NSObject

- (NSString *)calculatePhrase:(NSString *)phrase error:(NSError **)error;

@end
