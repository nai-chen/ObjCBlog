//
//  main.m
//  Category-Extension
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "extension.h"

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        Extension *ext = [Extension new];
        NSLog(@"%@", ext); // (0, 0, 0, 0)
        
        [ext setParam];
        NSLog(@"%@", ext); // (20, 30, 40, 50)
    }
    return 0;
}
