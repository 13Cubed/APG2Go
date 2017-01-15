//
//  MainViewController.m
//  APG 2Go
//
//  Created by Richard Davis on 9/12/11.
//  Copyright 2012 13Cubed. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

@synthesize lines;
@synthesize entireFileInString, passwordWithSeparator, passwordWithoutSeparator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set rounded corners for password field textview
    passwordField.layer.cornerRadius = 5.0;
    [passwordField.layer setBorderWidth:2.0];
    [passwordField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    
    self.entireFileInString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Words" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    self.lines = [entireFileInString componentsSeparatedByString:@"\n"];
    lineCount = ([lines count] - 1);
    
    wordCount = 2; // Set initial word count to 2
    [wordCountLabel setText:[NSString stringWithFormat:@"2"]]; // Set initial word count label to 2
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

- (IBAction)wordCountChanged:(UISlider*)sender
{
    wordCount = round ([sender value]); // Round float to an integer
    [sender setValue:(float)wordCount]; // Set slider to this value
    [wordCountLabel setText:[NSString stringWithFormat:@"%ld", (long)wordCount]]; // Update word count label accordingly
}

- (IBAction)separatorSwitchChanged:(id)sender
{
    if (password) { // If a password has already been generated ...
        [self displayPassword]; // ... handoff to displayPassword to update results
    }
}

- (void)displayPassword
{
    if ([separatorSwitch isOn]) {
        password = self.passwordWithSeparator;
        separatorCount = 1;
    }
    
    else {
        password = self.passwordWithoutSeparator;
        separatorCount = 0;
    }
    
    [passwordField setText:password];
    
    letterCount = [password length];
    bitsOfEntropy = (round((log2(lineCount) * wordCount)) + separatorCount);
    
    [lengthLabel setText:[NSString stringWithFormat:@"%ld", (long)letterCount]];
    [entropyBitsLabel setText:[NSString stringWithFormat:@"~%ld", (long)bitsOfEntropy]];
}

- (IBAction)genPassword:(id)sender
{
    for (x=0; x<wordCount; x++) {
        i = arc4random() % lineCount;
        part = [lines objectAtIndex:i];
        
        if (x == 0) {
            self.passwordWithSeparator = part;
            self.passwordWithoutSeparator = part;
        }
        
        else {
            self.passwordWithSeparator = [[self.passwordWithSeparator stringByAppendingString:@"-"] stringByAppendingString:part];
            self.passwordWithoutSeparator = [self.passwordWithoutSeparator stringByAppendingString:part];
        }
    }
    
    [self displayPassword];
}

- (IBAction)copyPassword:(id)sender
{
    if (password) {
        [UIPasteboard generalPasteboard].string = passwordField.text; // Copy password to clipboard
        [passwordField setText:@"Copied!"]; // Display "Copied!" acknowledgement
        [self performSelector:@selector(displayPassword) withObject:self afterDelay:1.0 ]; // Re-display original password
    }
}

- (IBAction)showInfo:(id)sender
{
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
    [controller release];
}

@end
