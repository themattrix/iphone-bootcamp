//
//  CoreLocation.m
//  Tab
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "CoreLocation.h"

@interface CoreLocation () {
    // a pin to mark the user's current location
    MKPointAnnotation *point;
}
@end

@implementation CoreLocation

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
    self.mLocationManager = [[CLLocationManager alloc] init];
    self.mLocationManager.delegate = self;
    self.mLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // allocate the pin
    point = [[MKPointAnnotation alloc] init];

    // add the pin to the map
    [self.mapView addAnnotation:point];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];
    self.mLat.text = [NSString stringWithFormat:@"%g", newLocation.coordinate.latitude];
    self.mLong.text = [NSString stringWithFormat:@"%g", newLocation.coordinate.longitude];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(
        newLocation.coordinate,
        500,    // meters
        500);   // meters

    [self.mapView setRegion:region animated:YES];
    
    // set the pin's location
    point.coordinate = newLocation.coordinate;
    
    // set the pin's title (shows up when tapping the pin)
    point.title = @"I'm here!";
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] == kCLErrorLocationUnknown)
    {
        NSLog(@"Location unknown");
    }
    else if ([error code] == kCLErrorDenied)
    {
        NSLog(@"User denied from accessing Core Location");
    }
    
    [self.mLocationManager stopUpdatingLocation];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.mLocationManager startUpdatingLocation];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.mLocationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
