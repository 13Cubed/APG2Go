//
//  APG_2GoAppDelegate.h
//  APG 2Go
//
//  Created by Richard Davis on 9/13/11.
//  Copyright 2012 13Cubed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface APG_2GoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
