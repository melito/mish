//
//  Server.m
//  mishphone
//
//  Created by Mel Gray on 2/13/10.
//  Copyright 2010 Clever Collie, LLC. All rights reserved.
//

#import "Server.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#define PORT 8080

@implementation Server

-(void)start {
	NSLog(@"Starting server on port %d", PORT);
	
	serverSocketPort = [[NSSocketPort alloc] initWithTCPPort:PORT];
	int sockfd = [serverSocketPort socket];
	NSLog(@"sockfd: %d",sockfd);
	
	// Assign the socket fd to the NSFileHandle ivar
	listeningHandle = [[NSFileHandle alloc] initWithFileDescriptor:sockfd
					   closeOnDealloc:YES];
	
	[[NSNotificationCenter defaultCenter]
	   addObserver:self
	   selector:@selector(incomingConnectionNotice:)
	   name:NSFileHandleConnectionAcceptedNotification
	   object:nil];
	
	[listeningHandle acceptConnectionInBackgroundAndNotify];
	
}

// Observer method called when new notification is received
-(void)incomingConnectionNotice:(NSNotification *)notification {
	NSLog(@"Got notification %@", notification);	
	
	NSDictionary *userInfo = [notification userInfo];
	NSLog(@"userInfo obtained- %@",userInfo);
	NSFileHandle *remoteFileHandle = [userInfo objectForKey:
									  NSFileHandleNotificationFileHandleItem];
	
	NSNumber *errorNo = [userInfo objectForKey:@"NSFileHandleError"];
	if(errorNo) {
		NSLog(@"NSFileHandle Error: %@", errorNo);
		return;
	}
	
	[listeningHandle acceptConnectionInBackgroundAndNotify];
	
	if(remoteFileHandle){
		NSData *connData = [remoteFileHandle availableData];
		NSString *connDataString = [[NSString alloc] initWithData:connData encoding:NSASCIIStringEncoding];
		NSLog(@"Data: %@", connDataString);
		[[NSNotificationCenter defaultCenter] postNotificationName:@"refreshWebBrowserWithUrl" object:connDataString];
		[connDataString release];
	}
	
}

-(void)dealloc {
	NSLog(@"eyem in yur dealloc....being a janitor");
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[serverSocketPort release];
	[listeningHandle release];
	[super dealloc];
}

@end
