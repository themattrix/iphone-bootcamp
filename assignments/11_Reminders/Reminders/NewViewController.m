//
//  NewViewController.m
//  Reminders
//
//  Created by Matt Tardiff on 4/21/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import "NewViewController.h"
#import "AppDelegate.h"
#import "ReminderDate.h"
#import "Reminder.h"

@interface NewViewController ()
{
    NSManagedObjectContext *ctx;
}
@end

@implementation NewViewController

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

    AppDelegate *appDelegateRef = [UIApplication sharedApplication].delegate;
    ctx = appDelegateRef.managedObjectContext;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelNew:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveNew:(id)sender
{
    /* Check if date already exists. */
    
    // core data read
    NSFetchRequest *fetch = [[NSFetchRequest alloc] initWithEntityName:@"ReminderDate"];
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    // Strip the time from the DatePicker NSDate
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                               fromDate:self.reminderDate.date];
    
    NSDate *midnightDate = [calendar dateFromComponents:components];
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"SELF.date == %@",midnightDate];

    [fetch setPredicate:filter];
    
    NSError *err = nil;
    NSArray *dates = [ctx executeFetchRequest:fetch error:&err];

    ReminderDate *oneDate = [dates lastObject];

    if (! oneDate)
    {
        oneDate = [NSEntityDescription insertNewObjectForEntityForName:@"ReminderDate" inManagedObjectContext:ctx];
        
        oneDate.date = midnightDate;
    }
    
    Reminder *oneReminder = [NSEntityDescription insertNewObjectForEntityForName:@"Reminder" inManagedObjectContext:ctx];
    
    oneReminder.title = self.reminderTitle.text;
    oneReminder.priority = [NSNumber numberWithInteger:self.reminderPriority.selectedSegmentIndex];
    oneReminder.detail = self.reminderDetails.text;
    
    [oneDate addReminderObject:oneReminder];
    
    err = nil;
    
    [ctx save:&err];
    
    if (! err)
    {
        [self cancelNew:self];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.reminderTitle resignFirstResponder];
    [self.reminderDetails resignFirstResponder];
}

@end
