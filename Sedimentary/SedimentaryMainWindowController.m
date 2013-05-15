//
//  SedimentaryMainWindowController.m
//  Sedimentary
//
//  Created by Ben Wadsworth on 10/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import "SedimentaryMainWindowController.h"

#import "SedPattern.h"
#import "SedUtils.h"

@interface SedimentaryMainWindowController ()

@end

@implementation SedimentaryMainWindowController

@synthesize patternArray;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
        self.patternArray = [[NSMutableArray alloc] init];
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
    
    if ([tableColumn.identifier isEqualToString:@"colPattern"]) {
        return pattern.pattern;
    }
    else if ([tableColumn.identifier isEqualToString:@"colFlags"]) {
        return pattern.flags;
    }
    else if ([tableColumn.identifier isEqualToString:@"colNotes"]) {
        return pattern.notes;
    }
    
    return nil;
}

- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return YES;
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString* ident = [tableColumn identifier];
    if ([ident isEqualToString:@"colPattern"]) {
        [[self.patternArray objectAtIndex:row] setPattern:object];
    }
    else if ([ident isEqualToString:@"colFlags"]) {
        [[self.patternArray objectAtIndex:row] setFlags:object];
    }
    else if ([ident isEqualToString:@"colNotes"]) {
        [[self.patternArray objectAtIndex:row] setNotes:object];
    }
    else {
        
    }
}

#pragma mark - IBActions

- (IBAction)btnRunQueryPressed:(id)sender
{
    NSString* inputFile = fldInputFile.stringValue;
    NSString* outputFile = fldOutputFile.stringValue;
    
    if ([tblPatterns selectedRow] != -1) {
        SedPattern* pattern = [self.patternArray objectAtIndex:[tblPatterns selectedRow]];        
        [SedUtils DoSedWithPattern:pattern.pattern inFilePath:inputFile outFilePath:outputFile];
    }
}

- (IBAction)btnAddPressed:(id)sender
{
    SedPattern* newPattern = [[SedPattern alloc] initWithPattern:@"pattern" flags:@"flags" notes:@"notes"];
    [self.patternArray addObject:newPattern];
    [tblPatterns beginUpdates];
    [tblPatterns insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:[self.patternArray count]] withAnimation:0];
    [tblPatterns endUpdates];
}

- (IBAction)btnDeletePressed:(id)sender
{
    NSInteger selectedRow = [tblPatterns selectedRow];
    [self.patternArray removeObjectAtIndex:selectedRow];
    [tblPatterns reloadData];
}

- (IBAction)btnDuplicatePressed:(id)sender
{
    NSInteger selectedRow = [tblPatterns selectedRow];
    SedPattern* duplicatePattern = [[self.patternArray objectAtIndex:selectedRow] copy];
    [self.patternArray insertObject:duplicatePattern atIndex:selectedRow+1];
    [tblPatterns reloadData];
}

@end
