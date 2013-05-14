//
//  SedimentaryMainWindowController.h
//  Sedimentary
//
//  Created by Ben Wadsworth on 10/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SedPattern;

@interface SedimentaryMainWindowController : NSWindowController <NSTableViewDelegate, NSTableViewDataSource>
{
    IBOutlet NSTextField* fldInputFile;
    IBOutlet NSTextField* fldOutputFile;
    IBOutlet NSTableView* tblPatterns;
    IBOutlet NSButton* btnRunQuery;
    
    IBOutlet NSButton* btnAdd;
    IBOutlet NSButton* btnDelete;
    IBOutlet NSButton* btnDuplicate;
    
    NSMutableArray* patternArray;
}

- (SedPattern*)getPatternAtIndex:(NSInteger)i;
- (NSUInteger)getNumPatterns;

- (IBAction)btnRunQueryPressed:(id)sender;
- (IBAction)btnAddPressed:(id)sender;
- (IBAction)btnDeletePressed:(id)sender;
- (IBAction)btnDuplicatePressed:(id)sender;

@property (nonatomic) NSMutableArray* patternArray;

@end
