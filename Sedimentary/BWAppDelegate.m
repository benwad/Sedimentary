//
//  BWAppDelegate.m
//  Sedimentary
//
//  Created by Ben Wadsworth on 10/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import "BWAppDelegate.h"

#import "BWFileUtilities.h"

@implementation BWAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
//    mainWindowController = [[SedimentaryMainWindowController alloc] initWithWindow:self.window];
    mainWindowController = [[SedimentaryMainWindowController alloc] initWithWindowNibName:@"MainWindow"];
    
    NSMutableString *filePath = [NSMutableString stringWithString:[[NSBundle mainBundle] resourcePath]];
    [filePath appendString:@"/savedPatterns.txt"];
    [mainWindowController.patternArray addObjectsFromArray:[BWFileUtilities loadPatternsFromJSONFile:filePath]];
    [mainWindowController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    NSMutableString *filePath = [NSMutableString stringWithString:[[NSBundle mainBundle] resourcePath]];
    [filePath appendString:@"/savedPatterns.txt"];
    
    [BWFileUtilities savePatterns:mainWindowController.patternArray toJSONFile:filePath];
}

@end
