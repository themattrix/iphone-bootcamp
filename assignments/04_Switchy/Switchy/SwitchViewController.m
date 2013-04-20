//
//  SwitchViewController.m
//  Switchy
//
//  Created by Matt Tardiff on 4/19/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "SwitchViewController.h"
#import "BadNewsViewController.h"
#import "GoodNewsViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

@synthesize badNewsViewController, goodNewsViewController;

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
    
    // give 'em the bad news first
    BadNewsViewController *badController = [[BadNewsViewController alloc] initWithNibName:@"BadNewsViewController" bundle:nil];
    self.badNewsViewController = badController;
    [self.view insertSubview:badController.view atIndex:0];
}

-(void)switchViews:(id)sender
{
    if (self.goodNewsViewController.view.superview == nil)
    {
        if (self.goodNewsViewController == nil)
        {
            self.goodNewsViewController = [[GoodNewsViewController alloc] initWithNibName:@"GoodNewsViewController" bundle:nil];
        }
        [self.badNewsViewController.view removeFromSuperview];
        [self.view insertSubview:self.goodNewsViewController.view atIndex:0];
    }
    else
    {
        if (self.badNewsViewController == nil)
        {
            self.badNewsViewController = [[BadNewsViewController alloc] initWithNibName:@"BadNewsViewController" bundle:nil];
        }
        [self.goodNewsViewController.view removeFromSuperview];
        [self.view insertSubview:self.badNewsViewController.view atIndex:0];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
