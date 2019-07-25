//
//  main.m
//  Shape-Category
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        Shape* shape = [[Shape alloc] init];
        [shape setWidth: 30 andHeight: 40];
        [shape setColor: 23];
        
        NSLog(@"%@", shape);
    }
    return 0;
}
