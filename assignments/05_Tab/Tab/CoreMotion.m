//
//  CoreMotion.m
//  Tab
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "CoreMotion.h"

@interface CoreMotion () {
    CMMotionManager *motion;
}
@end

@implementation CoreMotion

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
    
    motion = [[CMMotionManager alloc] init];
    
    if (motion.isAccelerometerAvailable)
    {
        [motion setAccelerometerUpdateInterval:0.5];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchedStartButton:(id)sender
{
    if (motion.isAccelerometerAvailable)
    {
        NSOperationQueue *q = [[NSOperationQueue alloc] init];
        [motion startAccelerometerUpdatesToQueue:q withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.xLabel.text = [NSString stringWithFormat:@"%g", accelerometerData.acceleration.x];
                self.yLabel.text = [NSString stringWithFormat:@"%g", accelerometerData.acceleration.y];
                self.zLabel.text = [NSString stringWithFormat:@"%g", accelerometerData.acceleration.z];
            }];
            NSLog(@"%@", accelerometerData);
        }];
    }
}

- (IBAction)touchedStopButton:(id)sender
{
    if (motion.isAccelerometerAvailable)
    {
        [motion stopAccelerometerUpdates];
    }
}

@end
