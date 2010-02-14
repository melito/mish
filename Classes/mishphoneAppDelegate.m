//
//  mishphoneAppDelegate.m
//  mishphone
//
//  Created by Mel Gray on 2/13/10.
//  Copyright Clever Collie, LLC 2010. All rights reserved.
//

#import "mishphoneAppDelegate.h"
#import "mishphoneViewController.h"
#import "Server.h"

@implementation mishphoneAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    [[Server alloc] start];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
