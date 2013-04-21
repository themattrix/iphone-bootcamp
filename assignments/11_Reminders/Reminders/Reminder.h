//
//  Reminder.h
//  Reminders
//
//  Created by Matt Tardiff on 4/21/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ReminderDate;

@interface Reminder : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * priority;
@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) ReminderDate *reminderDate;

@end
