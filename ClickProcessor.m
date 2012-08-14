//
//  ClickProcessor.m
//  Hello
//
//  Created by Konstantin Nikitin on 14.08.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ClickProcessor.h"
#import "Connection.h"
#import <Cocoa/Cocoa.h>


@implementation ClickProcessor

- (IBAction)menuItemSelected: (id)sender {
	Connection* connection = [(NSMenuItem*)sender representedObject];
	
	NSString* command = [@"ssh " stringByAppendingString:[connection getServerName]];
	char *utf8Script = [command cString];
	char *bundleID = "com.apple.terminal";
	
    AppleEvent evt, res;
    AEDesc desc;
    OSStatus err;
    
	// Build event
    err = AEBuildAppleEvent(kAECoreSuite, kAEDoScript,
                            typeApplicationBundleID,
                            bundleID, strlen(bundleID),
                            kAutoGenerateReturnID,
                            kAnyTransactionID,
                            &evt, NULL,
                            "'----':utf8(@)", strlen(utf8Script),
							utf8Script);
	err = AESendMessage(&evt, &res, kAEWaitReply, kAEDefaultTimeout);
    AEDisposeDesc(&evt);
	err = AEGetParamDesc(&res, keyErrorNumber, typeSInt32, &desc);
    AEDisposeDesc(&res);
    if (!err) {
        AEGetDescData(&desc, &err, sizeof(err));
        AEDisposeDesc(&desc);
    }	
}

@end
