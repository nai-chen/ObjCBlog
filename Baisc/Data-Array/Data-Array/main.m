//
//  main.m
//  Data-Array
//
//  Created by Peter on 2019/7/17.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *array1 = @[@"one", @"two", @"three", @"four"];
        NSArray *array2 = [NSArray arrayWithObjects:@"one",
                           @"two", @"three", @"four", nil];
        
        for (int index = 0; index < [array1 count]; index++) {
            NSLog(@"%@", [array1 objectAtIndex:index]);
        }
        
        for (int index = 0; index < [array2 count]; index++) {
            NSLog(@"%@", array2[index]);
        }
        
        NSLog(@"%@", [array1 componentsJoinedByString:@"--"]);
    }
    
    @autoreleasepool {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity: 17];
        
        [array addObject:@"one"];
        [array addObject:@"two"];
        [array addObject:@"three"];
        
        for (int index = 0; index < [array count]; index++) {
            NSLog(@"%@", [array objectAtIndex:index]);
        }
        
        [array removeObjectAtIndex:1];
        for (int index = 0; index < [array count]; index++) {
            NSLog(@"%@", array[index]);
        }
    }
    return 0;
}
