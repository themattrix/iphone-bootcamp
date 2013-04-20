//
//  CoreMotion.h
//  Tab
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface CoreMotion : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *xLabel;
@property (weak, nonatomic) IBOutlet UILabel *yLabel;
@property (weak, nonatomic) IBOutlet UILabel *zLabel;

- (IBAction)touchedStartButton:(id)sender;
- (IBAction)touchedStopButton:(id)sender;

@end
