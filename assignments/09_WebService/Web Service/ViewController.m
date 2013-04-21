//
//  ViewController.m
//  Web Service
//
//  Created by Matt Tardiff on 4/21/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *searchResults;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    // search url
    NSString *searchURL = @"http://opentable.heroku.com/api/restaurants?zip=%@";
    
    // create NSURL
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:searchURL, searchBar.text]];
    
    // create NSURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // start async connection
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:q completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (! error)
        {
            NSError *err = nil;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
            
            searchResults = [[json objectForKey:@"restaurants"] copy];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.tableView reloadData];
            }];
        }
    }];
    
    // hide keyboard
    [searchBar resignFirstResponder];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // could optionally delete this method and it would default to returning 1
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[searchResults objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    cell.detailTextLabel.text = [[searchResults objectAtIndex:indexPath.row] objectForKey:@"address"];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
