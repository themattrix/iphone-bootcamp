//
//  ViewController.m
//  Social
//
//  Created by Matt Tardiff on 4/21/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareToTwitter:(id)sender
{
    SLComposeViewController *tw = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [tw setInitialText:@"testing the iOS social framework"];
    
    // [tw addImage:<#(UIImage *)#>];
    // [tw addURL:<#(NSURL *)#>];
    
    [self presentViewController:tw animated:YES completion:nil];
}

- (IBAction)shareToFacebook:(id)sender
{
    SLComposeViewController *tw = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [tw setInitialText:@"testing the iOS social framework"];
    
    // [tw addImage:<#(UIImage *)#>];
    // [tw addURL:<#(NSURL *)#>];
    
    [self presentViewController:tw animated:YES completion:nil];
}

- (IBAction)shareToEmail:(id)sender
{
    MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
    
    // mail setToRecipients:<#(NSArray *)#>
    // mail setSubject:<#(NSString *)#>
    // mail setMessageBody:<#(NSString *)#> isHTML:<#(BOOL)#>
    
    if ([MFMailComposeViewController canSendMail])
    {
        [self presentViewController:mail animated:YES completion:nil];
    }
}

@end
