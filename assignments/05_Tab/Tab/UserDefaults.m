//
//  UserDefaults.m
//  Tab
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "UserDefaults.h"

@interface UserDefaults ()

@end

@implementation UserDefaults

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // retrieve data
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    self.usernameField.text = [def stringForKey:@"mySavedData"];
    self.passwordField.delegate = self;
    self.usernameField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.usernameField resignFirstResponder];
}

- (IBAction)saveDataTouched:(id)sender
{
    [self.usernameField resignFirstResponder];
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:self.usernameField.text forKey:@"mySavedData"];
    [def synchronize];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    id next = [self.view viewWithTag:textField.tag + 1];
    
    if (next != nil)
    {
        [next becomeFirstResponder];
    }
    else
    {
        /* whatever code needs to run on [GO] here */
        
        // close keyboard
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end
