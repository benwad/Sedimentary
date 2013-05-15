//
//  BWFileUtilities.h
//  Sedimentary
//
//  Created by Ben Wadsworth on 14/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWFileUtilities : NSObject

+ (void)savePatterns:(NSArray*)patterns toJSONFile:(NSString*)filePath;
+ (NSArray*)loadPatternsFromJSONFile:(NSString*)filePath;

@end
