//
//  BWFileUtilities.m
//  Sedimentary
//
//  Created by Ben Wadsworth on 14/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import "BWFileUtilities.h"

#import "SedPattern.h"

@implementation BWFileUtilities

+ (void)savePatterns:(NSArray*)patterns toCSVFile:(NSString*)filePath
{
    NSMutableArray* patternDicts = [NSMutableArray arrayWithCapacity:[patterns count]];
    
    for (int i=0; i < [patterns count]; i++) {
        SedPattern *sedPattern = [patterns objectAtIndex:i];
        NSDictionary *patternDict = [NSDictionary dictionaryWithObjectsAndKeys:sedPattern.pattern ? sedPattern.pattern : @"", @"pattern",
                                                                                sedPattern.flags ? sedPattern.flags : @"", @"flags",
                                                                                sedPattern.notes ? sedPattern.notes : @"", @"notes", nil];
        [patternDicts addObject:patternDict];
    }
    
    NSData* encodedData = [NSJSONSerialization dataWithJSONObject:patternDicts options:NSJSONWritingPrettyPrinted error:nil];
    NSString* dataString = [[NSString alloc] initWithData:encodedData encoding:NSUTF8StringEncoding];
    
    if ([dataString writeToFile:filePath atomically:NO encoding:NSUTF8StringEncoding error:nil])
    {
        NSLog(@"Done!");
    }
}

+ (NSArray*)loadPatternsFromCSVFile:(NSString*)filePath
{
    return nil;
}

@end
