//
//  main.m
//  Shape-KVC
//
//  Created by Peter on 2019/7/25.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShapeBounds : NSObject {
    int width;
    int height;
}

@end

@implementation ShapeBounds

- (NSString*) description {
    return [NSString stringWithFormat: @"(%d, %d)", width, height];
}

@end

@interface Shape : NSObject {
    ShapeBounds* bounds;
}

@end

@implementation Shape

- (id) init {
    if (self = [super init]) {
        bounds = [[ShapeBounds alloc] init];
    }
    return self;
}

- (NSString*) description {
    return [NSString stringWithFormat: @"Shape bounds = %@", bounds];
}

@end

Shape* createShape(int width, int height) {
    Shape* shape = [[Shape alloc] init];
    
    [shape setValue: [NSNumber numberWithInt: width] forKeyPath: @"bounds.width"];
    [shape setValue: [NSNumber numberWithInt: height] forKeyPath: @"bounds.height"];
    
    return shape;
}

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        ShapeBounds* bounds = [[ShapeBounds alloc] init];
        NSLog(@"%@", bounds);
        
        [bounds setValue: [NSNumber numberWithInt: 20] forKey: @"width"];
        [bounds setValue: [NSNumber numberWithInt: 30] forKey: @"height"];
        NSLog(@"%@", bounds);
        
        NSLog(@"width = %@, height = %@", [bounds valueForKey: @"width"],
              [bounds valueForKey: @"height"]);
        
        Shape* shape = [[Shape alloc] init];
        NSLog(@"%@", shape);
        
        [shape setValue: [NSNumber numberWithInt: 20] forKeyPath: @"bounds.width"];
        [shape setValue: [NSNumber numberWithInt: 30] forKeyPath: @"bounds.height"];
        NSLog(@"%@", shape);
        
        NSLog(@"width = %@, height = %@", [shape valueForKeyPath: @"bounds.width"],
              [shape valueForKeyPath: @"bounds.height"]);
        
        NSMutableArray* array = [NSMutableArray arrayWithCapacity: 17];
        [array addObject: createShape(20, 30)];
        [array addObject: createShape(40, 50)];
        [array addObject: createShape(60, 45)];
        
        NSLog(@"width = %@", [array valueForKeyPath: @"bounds.width"]);
        NSLog(@"height = %@", [array valueForKeyPath: @"bounds.height"]);
        
        NSLog(@"count = %@", [array valueForKeyPath: @"bounds.@count"]);
        NSLog(@"sum.height = %@", [array valueForKeyPath: @"bounds.@sum.width"]);
        NSLog(@"avg.height = %@", [array valueForKeyPath: @"bounds.@avg.width"]);
        NSLog(@"min.height = %@", [array valueForKeyPath: @"bounds.@min.width"]);
        NSLog(@"max.height = %@", [array valueForKeyPath: @"bounds.@max.width"]);
        
        NSLog(@"%@", bounds);
        
        {
            NSArray* array = [NSArray arrayWithObjects: @"width", @"height", nil];
            NSDictionary* dict = [bounds dictionaryWithValuesForKeys: array];
            NSLog(@"dict = %@", dict);
            
            NSDictionary* newDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [NSNumber numberWithInt: 40], @"width",
                                     [NSNumber numberWithInt: 50], @"height", nil];
            [bounds setValuesForKeysWithDictionary: newDict];
            NSLog(@"%@", bounds);
        }
    }
    return 0;
}


