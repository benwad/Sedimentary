//
//  BWFileUtilities.h
//  Sedimentary
//
//  Created by Ben Wadsworth on 14/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWFileUtilities : NSObject

+ (void)savePatterns:(NSArray*)patterns toCSVFile:(NSString*)filePath;
+ (NSArray*)loadPatternsFromCSVFile:(NSString*)filePath;

@end
