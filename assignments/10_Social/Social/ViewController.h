//
//  ViewController.h
//  Social
//
//  Created by Matt Tardiff on 4/21/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)shareToTwitter:(id)sender;
- (IBAction)shareToFacebook:(id)sender;
- (IBAction)shareToEmail:(id)sender;

@end
