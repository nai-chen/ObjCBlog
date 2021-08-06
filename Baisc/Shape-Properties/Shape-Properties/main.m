//
//  main.m
//  Shape-Properties
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject

@property int width;
@property int height;

@end

@implementation Shape

@synthesize width;
@synthesize height;

- (id)init {
    if (self = [super init]) {
        width = 20;
        height = 20;
        NSLog(@"Shape init");
    }
    return self;
}

@end

@interface Rectangle : NSObject {
    int value;
}

@property int radius;

@end

@implementation Rectangle

@synthesize radius = value;

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Shape *shape = [[Shape alloc] init];
        NSLog(@"%@", [NSString stringWithFormat:@"(%d, %d)",
                      [shape width], [shape height]]);
        
        NSLog(@"%@", [NSString stringWithFormat:@"(%d, %d)",
                      shape.width, shape.height]);
        
        Rectangle *rect = [[Rectangle alloc] init];
        rect.radius = 20;
        NSLog(@"Rectangle radius = %d", [rect radius]);
    }
    return 0;
}
