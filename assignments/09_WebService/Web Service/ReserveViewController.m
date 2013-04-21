//
//  ReserveViewController.m
//  Web Service
//
//  Created by Matt Tardiff on 4/21/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "ReserveViewController.h"

@interface ReserveViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *reservationWebView;

@end

@implementation ReserveViewController

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
	// Do any additional setup after loading the view.
    
    // create NSURL
    NSURL *url = [NSURL URLWithString:self.url];
    
    // create NSURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // load reserveration page
    [self.reservationWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
