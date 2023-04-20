//
//  main.m
//  Data-Date
//
//  Created by Peter on 2019/7/17.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSDate *currentDate = [NSDate date];
        NSDate *earlierDate = [NSDate dateWithTimeIntervalSinceNow:-60];
        NSDate *laterDate = [[NSDate alloc] initWithTimeInterval:60
                   sinceDate:currentDate];
        
        if ([currentDate laterDate:laterDate]) {
            NSLog(@"laterDate");
        }
        
        if ([currentDate earlierDate:earlierDate]) {
            NSLog(@"earlierDate");
        }
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
        NSLog(@"%@", [df stringFromDate:currentDate]);
    }
    return 0;
}
