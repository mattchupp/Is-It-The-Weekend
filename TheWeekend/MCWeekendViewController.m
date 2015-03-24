//
//  MCWeekendViewController.m
//  IsItTheWeekend
//
//  Created by Matthew Chupp on 3/18/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCWeekendViewController.h"


@interface MCWeekendViewController ()

@property (nonatomic, weak) IBOutlet UILabel *dateToday;
@property (nonatomic, weak) IBOutlet UILabel *daysUntilWeekend;
@property (nonatomic, weak) IBOutlet UILabel *untilTheWeekend;

@end

@implementation MCWeekendViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:@"gregorian"];
    NSDate *date = [[NSDate alloc] init];
    
    // today's date
    NSDate *todaysDate = date;
    
    
    // format date to [Mon, day, year]
    _dateToday.text = [NSDateFormatter localizedStringFromDate:date
                                                     dateStyle:NSDateFormatterMediumStyle
                                                     timeStyle:NSDateFormatterNoStyle];
    
    
    // log today's date in console
    NSLog(@"%@", todaysDate);
    
    // is date a weekend?
    // BOOL wkend = [cal isDateInWeekend:todaysDate];
    
    
    // days until weekend
    int daysToAdd = 0;
    NSDate *newDate = [[NSDate alloc] init];
    
    // adds a day to the current date until date is in the weekend
    while (![cal isDateInWeekend:newDate]) {
        
        daysToAdd++;
        newDate = [todaysDate dateByAddingTimeInterval:60*60*24*daysToAdd]; // adds a day 
        
    }
    
    if (daysToAdd > 1) {
    
        _daysUntilWeekend.text = [NSString stringWithFormat:@"There are %d more days", daysToAdd];
        _untilTheWeekend.text = @"until the weekend!";
        
    }
    else if (daysToAdd == 1) {
        
        _daysUntilWeekend.text = [NSString stringWithFormat:@"There is %d more day", daysToAdd];
        _untilTheWeekend.text = @"until the weekend!";
        
    } else {
        
        _daysUntilWeekend.text = @"It is the weekend!";
        _daysUntilWeekend.textColor = [UIColor greenColor];
        _untilTheWeekend.text = @""; 
        
    }
    

    NSLog(@"There is %d more day", daysToAdd);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = [NSString stringWithFormat:@"There is %d more day", daysToAdd];
    note.fireDate = todaysDate;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
    
}





@end
