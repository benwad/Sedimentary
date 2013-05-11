//
//  SedUtils.h
//  Sedimentary
//
//  Created by Ben Wadsworth on 11/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SedUtils : NSObject

+ (int)DoSedWithPattern:(NSString*)pattern inFilePath:(NSString*)inFilePath outFilePath:(NSString*)outFilePath;

@end
