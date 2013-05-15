//
//  SedPattern.m
//  Sedimentary
//
//  Created by Ben Wadsworth on 11/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import "SedPattern.h"

@implementation SedPattern

@synthesize pattern, flags, notes;

- (id)initWithPattern:(NSString*)pPattern flags:(NSString*)pFlags notes:(NSString*)pNotes
{
    self = [super init];
    
    if (self) {
        self.pattern = pPattern;
        self.flags = pFlags;
        self.notes = pNotes;
    }
    
    return self;
}

#pragma mark - NSCopying methods
- (id)copyWithZone:(NSZone*)zone
{
    SedPattern* myCopy = [[SedPattern alloc] initWithPattern:self.pattern flags:self.flags notes:self.notes];
    
    return myCopy;
}

@end
