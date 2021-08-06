//
//  main.m
//  Blocks
//
//  Created by Peter on 2019/7/24.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        int a = 11;
        int b = 13;
        
        void (^void_block)(void) = ^{ NSLog(@"Hello World!"); };
        void_block();
        
        typedef int (^add_block)(int num1, int num2);
        add_block block = ^(int num1, int num2) {return num1 + num2; };
        NSLog(@"%d + %d = %d", a, b, block(a, b));
        
        int (^multiply)(void) = ^{ return a * b; };
        NSLog(@"%d, %d, %d", a, b, multiply());
        
        a = 15;
        b = 17;
        NSLog(@"%d, %d, %d", a, b, multiply());
        
        __block int c;
        void (^minus)(int num1, int num2) = ^(int num1, int num2) { c = num1 - num2; };
        minus(a, b);
        NSLog(@"c = %d", c);
    }
    return 0;
}
