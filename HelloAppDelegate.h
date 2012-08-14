//
//  HelloAppDelegate.h
//  Hello
//
//  Created by Konstantin Nikitin on 11.08.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface HelloAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
