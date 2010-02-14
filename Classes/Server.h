//
//  Server.h
//  mishphone
//
//  Created by Mel Gray on 2/13/10.
//  Copyright 2010 Clever Collie, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Server : NSObject {
	NSFileHandle *listeningHandle;	
	NSSocketPort *serverSocketPort;
}

- (void) start;

@end
