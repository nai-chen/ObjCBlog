//
//  main.m
//  Shape-Copy
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject <NSCopying>

@property int width;
@property int height;

@end

@implementation Shape

@synthesize width;
@synthesize height;

- (id) init {
    if (self = [super init]) {
        width = 20;
        height = 20;
        NSLog(@"Shape init");
    }
    return self;
}

- (id) copyWithZone: (NSZone*) zone {
    Shape* shapeCopy = [[[self class] allocWithZone: zone] init];
    shapeCopy.width = width;
    shapeCopy.height = height;
    
    return shapeCopy;
}

- (NSString*) description {
    return [NSString stringWithFormat: @"(%d, %d)",
            [self width], [self height]];
}

@end

@interface Rectangle : Shape

@property int radius;

@end

@implementation Rectangle

@synthesize radius;

- (id) copyWithZone: (NSZone*) zone {
    Rectangle* rectangleCopy = [super copyWithZone: zone];
    rectangleCopy.radius = [self radius];
    
    return rectangleCopy;
}

- (NSString*) description {
    return [NSString stringWithFormat: @"(%d, %d) radius = %d",
            [self width], [self height], [self radius]];
}

@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        Shape* shape = [[Shape alloc] init];
        shape.width = 30;
        shape.height = 25;
        NSLog(@"%@", [shape copy]);
        
        Rectangle* rect = [[Rectangle alloc] init];
        rect.width = 100;
        rect.height = 60;
        rect.radius = 5;
        NSLog(@"%@", [rect copy]);
    }
    return 0;
}


