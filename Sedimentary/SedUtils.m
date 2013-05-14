//
//  SedUtils.m
//  Sedimentary
//
//  Created by Ben Wadsworth on 11/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import "SedUtils.h"

@implementation SedUtils

+ (int)DoSedWithPattern:(NSString *)pattern inFilePath:(NSString *)inFilePath outFilePath:(NSString *)outFilePath
{
    NSTask* task;
    task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/sed"];
    
    NSArray* arguments;
    arguments = [NSArray arrayWithObjects: pattern, nil];
    [task setArguments:arguments];
    
    NSFileHandle* inFile;
    inFile = [NSFileHandle fileHandleForReadingAtPath:inFilePath];
    [task setStandardInput:inFile];
    
    NSFileHandle* outFile;
    if (outFilePath == nil) {
        NSPipe *pipe = [NSPipe pipe];
        [task setStandardOutput:pipe];
        outFile = [pipe fileHandleForReading];
    }
    else {
        outFile = [NSFileHandle fileHandleForWritingAtPath:outFilePath];
        if (!outFile) {
            [[NSFileManager defaultManager] createFileAtPath:outFilePath contents:nil attributes:nil];
            outFile = [NSFileHandle fileHandleForWritingAtPath:outFilePath];
        }
        [task setStandardOutput:outFile];
    }
    
    [task launch];
    
    return 0;
}

@end
