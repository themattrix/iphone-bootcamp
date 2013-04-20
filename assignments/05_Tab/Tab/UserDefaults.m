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
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // retrieve data
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    self.persistTextField.text = [def stringForKey:@"mySavedData"];
    self.persistTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.persistTextField resignFirstResponder];
}

- (IBAction)saveDataTouched:(id)sender
{
    [self.persistTextField resignFirstResponder];
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:self.persistTextField.text forKey:@"mySavedData"];
    [def synchronize];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
