/*
 *  config_parser.h
 *  Hello
 *
 *  Created by Konstantin Nikitin on 14.08.12.
 *  Copyright 2012 __MyCompanyName__. All rights reserved.
 *
 */

#import "Connection.h"
#import <Cocoa/Cocoa.h>

Connection* connection_from_dictionary(NSDictionary* dictionary);

NSMenu* generate_menu_from_JSON_config(NSString* json_string, id click_processor);
