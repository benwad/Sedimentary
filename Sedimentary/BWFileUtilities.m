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

+ (void)savePatterns:(NSArray*)patterns toJSONFile:(NSString*)filePath
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

+ (NSArray*)loadPatternsFromJSONFile:(NSString*)filePath
{
    NSData* jsonData = [NSData dataWithContentsOfFile:filePath];
    NSArray* patternsJson = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray* patternObjects = [NSMutableArray arrayWithCapacity:[patternsJson count]];
    
    for (int i=0; i < [patternsJson count]; i++) {
        NSDictionary* patternDict = [patternsJson objectAtIndex:i];
        SedPattern* newPattern = [[SedPattern alloc] initWithPattern:[patternDict objectForKey:@"pattern"]
                                                               flags:[patternDict objectForKey:@"flags"]
                                                               notes:[patternDict objectForKey:@"notes"]];
        [patternObjects addObject:newPattern];
    }
    
    return [NSArray arrayWithArray:patternObjects];
}

@end
