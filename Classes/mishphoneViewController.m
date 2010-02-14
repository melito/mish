//
//  mishphoneViewController.m
//  mishphone
//
//  Created by Mel Gray on 2/13/10.
//  Copyright Clever Collie, LLC 2010. All rights reserved.
//

#import "mishphoneViewController.h"

@implementation mishphoneViewController

-(void) loadURL:(NSString *)urlString {
	NSLog(@"loadUrl before cleanup: %@", urlString);
	
	// Requests weren't successfull do to the newline required by the server
	urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	urlString = [urlString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
	
	NSLog(@"loadUrl after cleanup: %@", urlString);
	
	NSURL *url = [[NSURL alloc] initWithString: urlString];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	
	NSLog(@"webBrowser loadRequest");
	[webBrowser loadRequest:request];
	[request release];
	[url release];
}

-(void) reloadURL:(id) sender {
	NSLog(@"reloadUrl called from observer");
	NSLog(@"%@", sender);
    urlField.text = [sender object];
	NSLog(@"%d", [[sender object] length]);
	[self loadURL:urlField.text];
}

-(IBAction)goButtonPressed:(id) sender {
	NSLog(@"goButtonPressed");
	[urlField resignFirstResponder];
	NSLog(@"Calling loadUrl with: %@", urlField.text);
	[self loadURL:urlField.text];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(reloadURL:) name: @"refreshWebBrowserWithUrl" object: nil];
	NSLog(@"urlField val: %@", urlField.text);

}
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
}


- (void)dealloc {
    [super dealloc];
}

@end
