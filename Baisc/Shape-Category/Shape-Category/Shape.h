//
//  Shape.h
//  Shape-Category
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject {
    int width, height;
    int color;
}

@end

@interface Shape (ShapeBounds)

- (void)setWidth:(int)width andHeight:(int)height;

@end

@interface Shape (ShapeColor)

- (void)setColor:(int)color;

@end
