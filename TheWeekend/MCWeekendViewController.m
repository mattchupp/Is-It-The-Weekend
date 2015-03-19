//
//  MCWeekendViewController.m
//  IsItTheWeekend
//
//  Created by Matthew Chupp on 3/18/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCWeekendViewController.h"


@interface MCWeekendViewController ()

@property (nonatomic, weak) IBOutlet UILabel *isItWeekend;
@property (nonatomic, weak) IBOutlet UILabel *yesOrNo;
@property (nonatomic, weak) IBOutlet UILabel *dateToday; 

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
    NSLog(@"%@", todaysDate);
    
    // is date a weekend?
    BOOL wkend = [cal isDateInWeekend:todaysDate];
    
    
    if (wkend) {
        
        _yesOrNo.text = @"Yes";
        _yesOrNo.textColor = [UIColor greenColor];
        
    } else {
        
        _yesOrNo.text = @"No";
        _yesOrNo.textColor = [UIColor redColor];
    }
    
    
    
}



@end
