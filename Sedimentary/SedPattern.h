//
//  SedPattern.h
//  Sedimentary
//
//  Created by Ben Wadsworth on 11/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SedPattern : NSObject
{
    NSString* pattern;
    NSString* flags;
    NSString* notes;
}

@property (nonatomic) NSString* pattern;
@property (nonatomic) NSString* flags;
@property (nonatomic) NSString* notes;

@end
