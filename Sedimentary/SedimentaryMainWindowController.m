//
//  SedimentaryMainWindowController.m
//  Sedimentary
//
//  Created by Ben Wadsworth on 10/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import "SedimentaryMainWindowController.h"

#import "SedPattern.h"

@interface SedimentaryMainWindowController ()

@end

@implementation SedimentaryMainWindowController

@synthesize patternArray;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    // Temporary input/output files
    fldInputFile.stringValue = @"/Users/wadben/Documents/Dev/Cocoa/Sedimentary/sampleInFile.txt";
    fldOutputFile.stringValue = @"/Users/wadben/Documents/Dev/Cocoa/Sedimentary/sampleOutFile.txt";
}

- (SedPattern*)getPatternAtIndex:(NSInteger)i
{
    return [patternArray objectAtIndex:i];
}

- (NSUInteger)getNumPatterns
{
    return [patternArray count];
}

#pragma mark - NSTableViewDelegate callbacks


#pragma mark - NSTableViewDataSource callbacks

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self getNumPatterns];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    SedPattern* pattern = [self getPatternAtIndex:row];
    // @todo: Display the pattern data at row index
    return nil;
}

#pragma mark - IBActions

- (IBAction)btnRunQueryPressed:(id)sender
{
    NSLog(@"Doing sed with selected pattern!");
    
    NSString* inputFile = fldInputFile.stringValue;
    NSString* outputFile = fldOutputFile.stringValue;
}

@end
