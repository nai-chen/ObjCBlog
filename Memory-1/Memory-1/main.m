//
//  main.m
//  Memory-1
//
//  Created by Peter on 2019/7/18.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject
@end

@implementation Shape

- (id)init {
    if (self = [super init]) {
        NSLog(@"Shape init retainCount = %lu", [self retainCount]);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Shape dealloc called");
    [super dealloc];
}

@end

int main(int argc, const char* argv[]) {
    Shape *shape = [Shape new];
    
    [shape retain]; // retainCount = 2
    NSLog(@"Shape retainCount = %lu", [shape retainCount]);
    
    [shape release]; // retainCount = 1
    NSLog(@"Shape retainCount = %lu", [shape retainCount]);
    
    [shape retain]; // retainCount = 2
    NSLog(@"Shape retainCount = %lu", [shape retainCount]);
    
    [shape release]; // retainCount = 1
    NSLog(@"Shape retainCount = %lu", [shape retainCount]);
    
    [shape release]; // retainCount = 0
    
    return 0;
}
