//
//  MainViewController.m
//  TableWithSearch
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "MainViewController.h"
#import "Reachability.h"

@interface MainViewController () {
    BOOL inSearchMode;
}

- (NSString *)documentsPath;

@end

@implementation MainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *)documentsPath
{
    /* When saving data to iOS, there's only one directory (Documents) that your app can write to. Let's find it. */

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // there should only be one object in iOS
    return [paths lastObject];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    inSearchMode = NO;

    NSURL *url = [NSURL URLWithString:@"http://www.icodeblog.com/samples/nsoperation/data.plist"];
    
    Reachability *internetStatus = [Reachability reachabilityForInternetConnection];
    NetworkStatus currentStatus = [internetStatus currentReachabilityStatus];
    
    if (currentStatus != NotReachable)
    {
        /* Internet connection available. */

        self.masterDataSource = [[NSArray arrayWithContentsOfURL:url] mutableCopy];
        
        /* In the future, an internet connection may not be available. After downloading and populating the master data list, serialize it and write it to NVM. */
        
        NSData *masterSerialized = [NSKeyedArchiver archivedDataWithRootObject:self.masterDataSource];
        
        [masterSerialized writeToFile:[self.documentsPath stringByAppendingPathComponent:@"data.plist"] atomically:YES];
    }
    else
    {
        /* Internet connection NOT available - attempt to read from NVM. */
        
        // this will come back as nil if the file does not exist
        NSData *masterSerialized = [NSData dataWithContentsOfFile:[self.documentsPath stringByAppendingPathComponent:@"data.plist"]];
        
        if (masterSerialized)
        {
            self.masterDataSource = [[NSKeyedUnarchiver unarchiveObjectWithData:masterSerialized] mutableCopy];
        }
        else
        {
            /* No internet connection AND no existing file. */
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No data available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
            [alert show];
        }
    }

    self.myDataSource = [self.masterDataSource mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    self.myDataSource = [[self.masterDataSource filteredArrayUsingPredicate:filter] mutableCopy];
    [self.tableView reloadData];
}

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
{
    inSearchMode = YES;
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
    self.myDataSource = [self.masterDataSource mutableCopy];
    [self.tableView reloadData];
    inSearchMode = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // could optionally delete this method and it would default to returning 1
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myDataSource.count;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        id cell = [self.myDataSource objectAtIndex:indexPath.row];
        
        [self.myDataSource removeObject:cell];
        [self.masterDataSource removeObject:cell];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell;
    
    if (inSearchMode)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    }
    
    cell.textLabel.text = [self.myDataSource objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
