//
//  MainViewController.h
//  APG 2Go
//
//  Created by Richard Davis on 9/12/11.
//  Copyright 2012 13Cubed. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    NSArray *lines;
    NSString *entireFileInString, *part, *password, *passwordWithSeparator, *passwordWithoutSeparator;
    NSInteger bitsOfEntropy, i, letterCount, lineCount, separatorCount, wordCount, x;
    
    IBOutlet UILabel *wordCountLabel;
    IBOutlet UISwitch *separatorSwitch;
    IBOutlet UITextView *passwordField;
    IBOutlet UILabel *lengthLabel;
    IBOutlet UILabel *entropyBitsLabel;
}

@property (nonatomic, retain) NSArray *lines;
@property (nonatomic, retain) NSString *entireFileInString, *passwordWithSeparator, *passwordWithoutSeparator;

- (IBAction)wordCountChanged:(UISlider*)sender;
- (IBAction)separatorSwitchChanged:(id)sender;
- (IBAction)genPassword:(id)sender;
- (IBAction)copyPassword:(id)sender;
- (IBAction)showInfo:(id)sender;

@end
