//
//  ViewController.h
//  PasswordGenerator
//
//  Created by Matt Tardiff on 4/19/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *passwordDisplay;
@property (weak, nonatomic) IBOutlet UISlider *lengthSelector;
@property (weak, nonatomic) IBOutlet UILabel *lengthDisplay;

- (IBAction)touchedGeneratePassword:(id)sender;
- (IBAction)slidLengthSelector:(id)sender;

@end
