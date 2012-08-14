//
//  Connection.m
//  Hello
//
//  Created by Konstantin Nikitin on 14.08.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Connection.h"


@implementation Connection

- (void)setServerName:(NSString *)serverName {
	[serverName retain];
	[serverName_ release];
	serverName_ = serverName;
}

- (void)setDisplayName:(NSString *)displayName {
	[displayName retain];
	[displayName_ release];
	displayName_ = displayName;
}

- (NSString*)getDisplayName {
	[displayName_ retain];
	return displayName_;
}

- (NSString*)getServerName {
	[serverName_ retain];
	return serverName_;
}

@end
