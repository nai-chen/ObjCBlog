//
//  main.m
//  Shape-Init
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject {
    int width;
    int height;
}

@end

@implementation Shape

- (id)init {
    if (self = [self initWithWidth:20 height:20]) {
    }
    return self;
}

- (id)initWithWidth:(int)w height:(int)h {
    if (self = [super init]) {
        width = w;
        height = h;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"(%d, %d)", width, height];
}

@end

@interface Rectangle : Shape {
    int radius;
}

- (void) setRadius:(int)radius;

@end

@implementation Rectangle

- (id)initWithWidth:(int)w height:(int)h {
    if (self = [super initWithWidth:w height:h]) {
        radius = 10;
    }
    return self;
}

- (void)setRadius:(int)r {
    radius = r;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"(%d, %d) radius = %d",
            width, height, radius];
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Rectangle *rect = [[Rectangle alloc] init];
        NSLog(@"%@", rect);
        
        rect = [[Rectangle alloc] initWithWidth:100 height:100];
        [rect setRadius:20];
        NSLog(@"%@", rect);
    }
    return 0;
}

