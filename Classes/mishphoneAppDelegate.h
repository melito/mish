//
//  mishphoneAppDelegate.h
//  mishphone
//
//  Created by Mel Gray on 2/13/10.
//  Copyright Clever Collie, LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class mishphoneViewController;

@interface mishphoneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    mishphoneViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet mishphoneViewController *viewController;

@end

