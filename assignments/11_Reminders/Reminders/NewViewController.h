//
//  NewViewController.h
//  Reminders
//
//  Created by Matt Tardiff on 4/21/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewViewController : UIViewController < UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *reminderTitle;
@property (weak, nonatomic) IBOutlet UISegmentedControl *reminderPriority;
@property (weak, nonatomic) IBOutlet UITextView *reminderDetails;
@property (weak, nonatomic) IBOutlet UIDatePicker *reminderDate;

- (IBAction)cancelNew:(id)sender;
- (IBAction)saveNew:(id)sender;

@end
