//
//  ReminderDate.h
//  Reminders
//
//  Created by Matt Tardiff on 4/21/13.
//  Copyright (c) 2013 Matthew Tardiff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reminder;

@interface ReminderDate : NSManagedObject

@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) NSSet *reminder;

@end

@interface ReminderDate (CoreDataGeneratedAccessors)

- (void)addReminderObject:(Reminder *)value;
- (void)removeReminderObject:(Reminder *)value;
- (void)addReminder:(NSSet *)values;
- (void)removeReminder:(NSSet *)values;

@end
