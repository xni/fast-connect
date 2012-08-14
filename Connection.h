//
//  Connection.h
//  Hello
//
//  Created by Konstantin Nikitin on 14.08.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Connection : NSObject {
	NSString* displayName_;
	NSString* serverName_;
}

- (void)setDisplayName: (NSString*)displayName;
- (void)setServerName: (NSString*)serverName;
- (NSString*)getDisplayName;
- (NSString*)getServerName;

@end
