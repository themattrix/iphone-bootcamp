//
//  UserDefaults.h
//  Tab
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDefaults : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *persistTextField;

- (IBAction)saveDataTouched:(id)sender;

@end
