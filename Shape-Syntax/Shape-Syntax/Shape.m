//
//  Shape.m
//  Shape-Syntax
//
//  Created by Peter on 2019/7/17.
//  Copyright © 2019 peter. All rights reserved.
//

#import "Shape.h"
#import "ShapeBounds.h"

@implementation Shape

- (void)setBounds:(ShapeBounds *)b {
    bounds = b;
}

- (void)draw {
    NSLog(@"draw Shape at %@.", bounds);
}

@end
