//
//  main.m
//  NSDate
//
//  Created by PC010055 on 2023/4/20.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *currentDate = [[NSDate alloc] init];
        NSLog(@"currentDate = %@", currentDate);
        
        currentDate = [NSDate date];
        NSLog(@"currentDate = %@", currentDate);

        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:20];
        NSLog(@"IntervalSinceNow = %@", date);

        date = [NSDate dateWithTimeIntervalSinceNow:30];
        NSLog(@"IntervalSinceNow = %@", date);

        date = [[NSDate alloc] initWithTimeIntervalSince1970:20];
        NSLog(@"IntervalSince1970 = %@", date);

        date = [NSDate dateWithTimeIntervalSince1970:30];
        NSLog(@"IntervalSince1970 = %@", date);
        
        date = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:20];
        NSLog(@"IntervalSinceReferenceDate = %@", date);

        date = [NSDate dateWithTimeIntervalSinceReferenceDate:30];
        NSLog(@"IntervalSinceReferenceDate = %@", date);

        date = [[NSDate alloc] initWithTimeInterval:50 sinceDate:currentDate];
        NSLog(@"TimeInterval:sinceDate = %@", date);
        
        date = [NSDate dateWithTimeInterval:60 sinceDate:currentDate];
        NSLog(@"TimeInterval:sinceDate = %@", date);
        
        NSLog(@"timeIntervalSinceNow = %.2f", date.timeIntervalSinceNow);
        
        NSLog(@"timeIntervalSince1970 = %.2f", date.timeIntervalSince1970);
        
        NSLog(@"timeIntervalSinceReferenceDate = %.2f", date.timeIntervalSinceReferenceDate);

        date = [currentDate dateByAddingTimeInterval:20];
        NSLog(@"dateByAddingTimeInterval = %@", date);

        BOOL equal = [date isEqualToDate: [NSDate dateWithTimeInterval:20 sinceDate:currentDate]];
        if (equal) {
            NSLog(@"equal");
        } else {
            NSLog(@"not equal");
        }
        
        NSLog(@"earlierDate = %@", [date earlierDate:currentDate]);
        
        NSLog(@"laterDate = %@", [date laterDate:currentDate]);
        
        NSLog(@"compare = %ld", [date compare:currentDate]);
        
        NSLog(@"timeIntervalSinceDate = %.2f", [date timeIntervalSinceDate:currentDate]);

    }
    return 0;
}
