//
//  BWAppDelegate.h
//  Sedimentary
//
//  Created by Ben Wadsworth on 10/05/2013.
//  Copyright (c) 2013 Ben Wadsworth. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "SedimentaryMainWindowController.h"

@interface BWAppDelegate : NSObject <NSApplicationDelegate>
{
    SedimentaryMainWindowController* mainWindowController;
}

@property (assign) IBOutlet NSWindow *window;

@end
