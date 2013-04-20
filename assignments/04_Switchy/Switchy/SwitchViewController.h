//
//  SwitchViewController.h
//  Switchy
//
//  Created by Matt Tardiff on 4/19/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BadNewsViewController;
@class GoodNewsViewController;

@interface SwitchViewController : UIViewController

@property (strong, nonatomic) BadNewsViewController *badNewsViewController;
@property (strong, nonatomic) GoodNewsViewController *goodNewsViewController;
@property (weak, nonatomic) IBOutlet UIView *contentView;

-(IBAction)switchViews:(id)sender;

@end
