//
//  main.m
//  Data-Dictionary
//
//  Created by Peter on 2019/7/17.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSDictionary *dict1 = @{@"Mike":@"Mike Jordan", @"Tom":@"Tom Lee"};
        NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
                   @"Mike Jordan", @"Mike", @"Tom Lee", @"Tom", nil];
        
        NSLog(@"%@", [dict1 objectForKey:@"Mike"]);
        NSLog(@"%@", dict2[@"Tom"]);
        
        for (id key in dict1) {
            NSLog(@"%@ : %@", key, dict1[key]);
        }
    }
    @autoreleasepool {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:17];
        [dict setObject:@"Mike Jordan" forKey:@"Mike"];
        [dict setObject:@"Tom Lee" forKey:@"Tom"];
        for (id key in dict) {
            NSLog(@"%@ : %@", key, dict[key]);
        }
        
        [dict removeObjectForKey:@"Tom"];
        for (id key in dict) {
            NSLog(@"%@ : %@", key, dict[key]);
        }
    }
    return 0;
}
