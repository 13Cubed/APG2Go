//
//  FlipsideViewController.h
//  APG 2Go
//
//  Created by Richard Davis on 9/13/11.
//  Copyright 2012 13Cubed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;

@end

@interface FlipsideViewController : UIViewController {
    IBOutlet UIWebView *myWebView;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
