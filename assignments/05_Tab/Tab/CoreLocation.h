//
//  CoreLocation.h
//  Tab
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface CoreLocation : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *mLocationManager;

@property (weak, nonatomic) IBOutlet UILabel *mLat;
@property (weak, nonatomic) IBOutlet UILabel *mLong;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
