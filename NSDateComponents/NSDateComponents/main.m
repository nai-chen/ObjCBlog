//
//  main.m
//  NSDateComponents
//
//  Created by PC010055 on 2023/4/20.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        dateComponents.year = 2021;
        dateComponents.month = 1;
        dateComponents.day = 2;
        dateComponents.hour = 3;
        dateComponents.minute = 4;
        dateComponents.second = 56;
        NSLog(@"date = %@", [[NSCalendar currentCalendar] dateFromComponents:dateComponents]);
        
        NSInteger unitFlag = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour
                | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitQuarter
                | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitYearForWeekOfYear | NSCalendarUnitNanosecond;
        dateComponents = [[NSCalendar currentCalendar] components:unitFlag fromDate:[NSDate date]];

        NSLog(@"NSDateComponents Era               = %ld", dateComponents.era);
        NSLog(@"NSDateComponents year              = %ld", dateComponents.year);
        NSLog(@"NSDateComponents month             = %ld", dateComponents.month);
        NSLog(@"NSDateComponents day               = %ld", dateComponents.day);
        NSLog(@"NSDateComponents hour              = %ld", dateComponents.hour);
        NSLog(@"NSDateComponents minute            = %ld", dateComponents.minute);
        NSLog(@"NSDateComponents second            = %ld", dateComponents.second);
        NSLog(@"NSDateComponents Weekday           = %ld", dateComponents.weekday);
        NSLog(@"NSDateComponents WeekdayOrdinal    = %ld", dateComponents.weekdayOrdinal);
        NSLog(@"NSDateComponents Quarter           = %ld", dateComponents.quarter);
        NSLog(@"NSDateComponents WeekOfMonth       = %ld", dateComponents.weekOfMonth);
        NSLog(@"NSDateComponents WeekOfYear        = %ld", dateComponents.weekOfYear);

        
    }
    return 0;
}
