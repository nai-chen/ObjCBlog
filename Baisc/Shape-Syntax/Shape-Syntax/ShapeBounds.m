//
//  ShapeBounds.m
//  Shape-Syntax
//
//  Created by Peter on 2019/7/17.
//  Copyright © 2019 peter. All rights reserved.
//

#import "ShapeBounds.h"

@implementation ShapeBounds

- (void)setWidth:(int)w height:(int)h {
    width = w;
    height = h;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"(%d, %d)", width, height];
}

@end

//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        ShapeBounds *bounds = [ShapeBounds new];
//        [bounds setWidth:100 height:60];
//        NSLog(@"%@", bounds); // (100, 60)
//    }
//    return 0;
//}
