//
//  ViewController.m
//  Table
//
//  Created by Matt Tardiff on 4/20/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.mList = [[NSArray alloc] initWithObjects:
                  @"Windows 3.11",
                  @"Windows 95",
                  @"Windows 98",
                  @"Windows ME",
                  @"Windows NT",
                  @"Windows 2000",
                  @"Windows XP",
                  @"Windows Vista",
                  @"Windows 7",
                  nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* This creates a new cells as they come into view. */
    
    // this can be anything unique to this table (and we only have one table), but it must match the 'Identifier' field in the prototype cell.
    static NSString *tableId = @"tableId";
    
    // determine if there were any out-of-view cells that we can reuse
    // if not, but there *is* a prototype cell, use that instead.
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:tableId];
    
    /* Always reset all of the cell properties so that reused cells don't show up with stale data. */
    
    cell.cellText.text = [self.mList objectAtIndex:indexPath.row];
    cell.cellLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    cell.cellOnOff.on = indexPath.row % 2;

    return cell;
}

@end
