//
//  main.m
//  Dictionary-Gson
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Gson.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary *dict = @{@"Mike" : @"Mike Jordan", @"Tom" : @"Tom Lee"};
        NSLog(@"%@", [dict toGson]);
    }
    return 0;
}
