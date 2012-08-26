//
//  HelloAppDelegate.m
//  Hello
//
//  Created by Konstantin Nikitin on 11.08.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "HelloAppDelegate.h"
#import "HelloView.h"
#import "JSONKit.h"
#import "config_parser.h"
#import "ClickProcessor.h"

@implementation HelloAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
	

	
	NSMenuItem* settings = [[NSMenuItem alloc] init];
	[settings setTitle:@"Options"];

	
	NSMenuItem* sep = [NSMenuItem separatorItem];

	NSStatusBar *bar = [NSStatusBar systemStatusBar];
	NSStatusItem *theItem = [bar statusItemWithLength:NSVariableStatusItemLength];
	
	ClickProcessor* cp = [[ClickProcessor alloc] init];
	NSString* path = [NSHomeDirectory() stringByAppendingPathComponent:@".fast_connect"];
	NSString* jsonString = [NSString stringWithContentsOfFile:path];
	NSMenu* serversMenu = generate_menu_from_JSON_config(jsonString, cp);
	[jsonString release];
	[serversMenu addItem:sep];
	[serversMenu addItem:settings];
		
	[theItem setTitle:@"ssh"];
	[theItem setHighlightMode:YES];
	[theItem setMenu:serversMenu];
	
	//[theItem setView:[[HelloView alloc] init]];
	[theItem retain];
}

@end
