//
//  MainViewController.h
//  TableWithSearch
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) NSMutableArray *masterDataSource;

@property (strong, nonatomic) NSMutableArray *myDataSource;

@end
