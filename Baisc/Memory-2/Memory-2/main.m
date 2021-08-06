//
//  main.m
//  Memory-2
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

int main(int argc, const char *argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    Shape *shape = [Shape new]; // retainCount = 1
    [shape retain]; // retainCount = 2
    
    [shape autorelease]; // retainCount = 2
    NSLog(@"Shape retainCount = %lu", [shape retainCount]);
    [shape release]; // retainCount = 1
    
    NSLog(@"releaseing pool");
    [pool release];
    
    @autoreleasepool {
        Shape *shape = [Shape new]; // retainCount = 1
        [shape retain]; // retainCount = 2
        
        [shape autorelease]; // retainCount = 2
        NSLog(@"Shape retainCount = %lu", [shape retainCount]);
        [shape release]; // retainCount = 1
        
        NSLog(@"releaseing pool");
    }
    return 0;
}
