//
//  SedPattern.h
//  Sedimentary
//
//  Created by Ben Wadsworth on 11/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SedPattern : NSObject <NSCopying>
{
    NSString* pattern;
    NSString* flags;
    NSString* notes;
}

- (id)initWithPattern:(NSString*)pattern flags:(NSString*)flags notes:(NSString*)notes;

@property (nonatomic, copy) NSString* pattern;
@property (nonatomic, copy) NSString* flags;
@property (nonatomic, copy) NSString* notes;

@end
