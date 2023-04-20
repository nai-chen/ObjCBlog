//
//  Shape.h
//  Shape-Syntax
//
//  Created by Peter on 2019/7/17.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShapeBounds;

@interface Shape : NSObject {
    ShapeBounds *bounds;
}

- (void)setBounds:(ShapeBounds *)bounds;
- (void)draw;

@end
