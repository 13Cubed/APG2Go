//
//  FlipsideViewController.m
//  APG 2Go
//
//  Created by Richard Davis on 9/13/11.
//  Copyright 2012 13Cubed. All rights reserved.
//

#import "FlipsideViewController.h"

@implementation FlipsideViewController

@synthesize delegate = _delegate;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *build = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"About.html" ofType:nil];
    NSString *fileURLString = [[NSURL fileURLWithPath:filePath] absoluteString];
    NSString *params = [NSString stringWithFormat:@"?version=%@&build=%@", version, build];
    NSURL *fileURL = [NSURL URLWithString:[fileURLString stringByAppendingString:params]];
    [myWebView loadRequest:[NSURLRequest requestWithURL:fileURL]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
