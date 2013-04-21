//
//  ViewController.m
//  Touches
//
//  Created by Matt Tardiff on 4/21/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *currentlySelected;
}
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"finger down");
    
    currentlySelected = nil;
    
    BOOL inSquare = NO;

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    for (UIView *tempView in [self.view.subviews reverseObjectEnumerator])
    {
        if (CGRectContainsPoint(tempView.frame, point))
        {
            inSquare = YES;
            currentlySelected = tempView;
            break;
        }
    }
    
    if (! inSquare)
    {
        UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(point.x - 20, point.y - 20, 40, 40)];
        
        CGFloat r = ((double)(arc4random() / 2.0) / (double)NSIntegerMax);
        CGFloat g = ((double)(arc4random() / 2.0) / (double)NSIntegerMax);
        CGFloat b = ((double)(arc4random() / 2.0) / (double)NSIntegerMax);
        
        [newView setBackgroundColor:[UIColor colorWithRed:r green:g blue:b alpha:1.0]];
        [self.view addSubview:newView];
        
        currentlySelected = newView;
    }
    
    currentlySelected.alpha = 0.75;
    [self.view insertSubview:currentlySelected aboveSubview:self.view.subviews.lastObject];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    // canceled
    currentlySelected.alpha = 1.0;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    currentlySelected.alpha = 1.0;
    NSLog(@"finger up");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // display coordinates of the finger (or SOME finger if multiple are touching)
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    currentlySelected.center = point;
    
    NSLog(@"finger at %f and %f", point.x, point.y);
}

@end
