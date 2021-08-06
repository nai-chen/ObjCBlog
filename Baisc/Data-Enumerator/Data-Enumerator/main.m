//
//  main.m
//  Data-Enumerator
//
//  Created by Peter on 2019/7/17.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = @[@"one", @"two", @"three", @"four"];
        NSEnumerator *enumerator = [array objectEnumerator];
        
        id string;
        while (string = [enumerator nextObject]) {
            NSLog(@"%@", string);
        }
        
        for (NSString *string in array) {
            NSLog(@"%@", string);
        }
    }
    return 0;
}
