/*
 *  config_parser.c
 *  Hello
 *
 *  Created by Konstantin Nikitin on 14.08.12.
 *  Copyright 2012 __MyCompanyName__. All rights reserved.
 *
 */

#import "config_parser.h"
#import "JSONKit.h"


NSMenuItem* menu_item_for_connection(Connection* connection, id click_processor) {
	NSMenuItem* result = [[NSMenuItem alloc] init];
	[result setTitle:[connection getDisplayName]];
	[result setRepresentedObject:connection];
	[result setEnabled:YES];
	[result setAction:@selector(menuItemSelected:)];
	[result setTarget:click_processor];
	[result retain];
	return result;
}

Connection* connection_from_dictionary(NSDictionary* dictionary) {
	Connection* result = [[Connection alloc] init];
	[result setServerName:[dictionary objectForKey:@"server_name"]];
	[result setDisplayName:[dictionary objectForKey:@"display_name"]];
	return result;
}

void populate_menu(NSMenu* parent, NSArray* data, id click_processor) {
	for (NSObject* item in data) {
		if ([item isKindOfClass:[NSDictionary class]]) {
			Connection* connection = connection_from_dictionary((NSDictionary*)item);
			NSMenuItem* menu_item = menu_item_for_connection(connection, click_processor);
			[parent addItem:menu_item];
		} else if ([item isKindOfClass:[NSArray class]]) {
			NSMenuItem* submenu_root = [[NSMenuItem alloc] init];
			[submenu_root setTitle:[(NSArray*)item objectAtIndex:0]];
			NSMenu* submenu = [[NSMenu alloc] init];
			populate_menu(submenu, (NSArray*)item, click_processor);
			[submenu_root setSubmenu:submenu];
			[parent addItem:submenu_root];
		}
	}	
}

NSMenu* generate_menu_from_JSON_config(NSString* json_string, id click_processor) {
	NSDictionary* data = [json_string objectFromJSONString];
	NSMenu* result = [[NSMenu alloc] init];
	populate_menu(result, [data objectForKey:@"data"], click_processor);
	return result;
}
