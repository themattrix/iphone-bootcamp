//
//  ViewController.m
//  PasswordGenerator
//
//  Created by Matt Tardiff on 4/19/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "ViewController.h"
#import "Generator.h"

@interface ViewController ()

@property (strong, nonatomic) NSNumber *passwordLength;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self slidLengthSelector:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchedGeneratePassword:(id)sender
{
    Generator *generator = [[Generator alloc] init];
    NSString *password = [generator generateRandom:[self.passwordLength intValue]];
    self.passwordDisplay.text = password;
}

- (IBAction)slidLengthSelector:(id)sender
{
    NSNumber *newLength = [[NSNumber alloc] initWithInt:(int)self.lengthSelector.value];
    
    if (! [self.passwordLength isEqualToNumber:newLength])
    {
        self.passwordLength = newLength;
        self.lengthDisplay.text = [NSString stringWithFormat:@"%d", [newLength intValue]];
        [self touchedGeneratePassword:nil];
    }
}

@end
