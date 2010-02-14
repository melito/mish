//
//  mishphoneViewController.h
//  mishphone
//
//  Created by Mel Gray on 2/13/10.
//  Copyright Clever Collie, LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mishphoneViewController : UIViewController {
	IBOutlet UITextField *urlField;
	IBOutlet UIWebView *webBrowser;
	IBOutlet UIButton *goButton;
}

-(IBAction)goButtonPressed:(id) sender;

@end

