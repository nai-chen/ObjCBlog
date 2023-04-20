//
//  main.m
//  Shape-Selector
//
//  Created by Peter on 2019/7/24.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject

- (void)draw;

@end

@implementation Shape

- (void)draw {
    NSLog(@"Shape draw");
}

@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        Shape *shape = [[Shape alloc] init];
        [shape draw];
        
        if ([shape respondsToSelector:@selector(draw)]) {
            [shape performSelector:@selector(draw)];
        } else {
            NSLog(@"Not has draw");
        }
        
        if ([shape respondsToSelector:@selector(drawShape)]) {
            [shape performSelector:@selector(drawShape)];
        } else {
            NSLog(@"Not has drawShape");
        }
    }
    return 0;
}
