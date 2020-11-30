//
//  Circle.m
//  Shape-Syntax
//
//  Created by Peter on 2019/7/17.
//  Copyright © 2019 peter. All rights reserved.
//

#import "Circle.h"
#import "ShapeBounds.h"

@implementation Circle

- (void) draw {
    [super draw];
    NSLog(@"draw Circle.");
}

@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        ShapeBounds* bounds = [ShapeBounds new];
        [bounds setWidth: 100 height: 60];
        Shape* circle = [Circle new];
        [circle setBounds: bounds];
        [circle draw];
    }
    return 0;
}
