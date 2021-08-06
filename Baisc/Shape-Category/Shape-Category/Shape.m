//
//  Shape.m
//  Shape-Category
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import "Shape.h"

@implementation Shape

- (NSString *)description {
    return [NSString stringWithFormat:@"shape (%d, %d) color = %d",
            width, height, color];
}

@end
