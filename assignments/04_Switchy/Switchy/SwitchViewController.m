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
    [self.contentView insertSubview:badController.view atIndex:0];
    self.badNewsViewController.view.frame = self.contentView.frame;
    
    // add gesture recognizer
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] init];
    
    // set up properties of the gesture recognizer
    // since we're using a swipe recognizer, we need to add a direction
    gesture.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    
    // normally when selecting a method to send, it would have no arguments; in this case nil is sent as the argument.
    [gesture addTarget:self action:@selector(switchViews:)];
    
    // add this gesture recognizer to the content view
    [self.contentView addGestureRecognizer:gesture];
}

-(void)switchViews:(id)sender
{
    // If the good news view is on screen, switch to the bad news view - and vice-versa.
    
    // context:nil == current context
    [UIView beginAnimations:@"flip views" context:nil];
    // 0.5 second animation - any changes to the view will be animated over this duration.
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    // caching makes sense because we'll likely be switching many times
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.contentView cache:YES];
    
    
    // self.goodNewsViewController.view.superview is checked for nil before self.goodNewsViewController is checked for nil to prove a point: calling any method on nil returns nil.
    
    // if superview is nil, the view is not on the screen
    if (self.goodNewsViewController.view.superview == nil)
    {
        // ensure that the good news controller is instantiated
        if (self.goodNewsViewController == nil)
        {
            self.goodNewsViewController = [[GoodNewsViewController alloc] initWithNibName:@"GoodNewsViewController" bundle:nil];
        }
        // replace the current view with the new one
        [self.badNewsViewController.view removeFromSuperview];
        [self.contentView insertSubview:self.goodNewsViewController.view atIndex:0];
        self.goodNewsViewController.view.frame = self.contentView.frame;
    }
    else
    {
        // ensure that the bad news controller is instantiated
        if (self.badNewsViewController == nil)
        {
            self.badNewsViewController = [[BadNewsViewController alloc] initWithNibName:@"BadNewsViewController" bundle:nil];
        }
        // replace the current view with the new one
        [self.goodNewsViewController.view removeFromSuperview];
        [self.contentView insertSubview:self.badNewsViewController.view atIndex:0];
        self.badNewsViewController.view.frame = self.contentView.frame;
    }
    
    // perform the animations
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
