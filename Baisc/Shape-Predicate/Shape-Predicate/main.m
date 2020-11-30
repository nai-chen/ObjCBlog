//
//  main.m
//  Shape-Predicate
//
//  Created by Peter on 2019/7/25.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShapeBounds : NSObject {
    int width;
    int height;
}

@property int width;
@property int height;

@end

@implementation ShapeBounds

@synthesize width;
@synthesize height;

- (NSString*) description {
    return [NSString stringWithFormat:@"(%d, %d)", width, height];
}

@end

@interface Shape : NSObject {
    ShapeBounds* bounds;
}

@property (readwrite, retain) ShapeBounds* bounds;

@end

@implementation Shape

@synthesize bounds;

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
    
    shape.bounds.width = width;
    shape.bounds.height = height;
    
    return shape;
}

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        {
            ShapeBounds* bounds = [[ShapeBounds alloc] init];
            bounds.width = 20;
            NSPredicate* predicate = [NSPredicate predicateWithFormat: @"width == 20"];
            if ([predicate evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject true");
            }

            predicate = [NSPredicate predicateWithFormat: @"bounds.width == 20"];
            NSMutableArray* array = [NSMutableArray arrayWithCapacity: 4];
            [array addObject: createShape(20, 30)];
            [array addObject: createShape(40, 50)];
            [array addObject: createShape(20, 45)];
            
            NSArray* result = [array filteredArrayUsingPredicate: predicate];
            NSLog(@"%@", result);
        }
        {
            ShapeBounds* bounds = [[ShapeBounds alloc] init];
            bounds.width = 20;
            NSPredicate* predicate = [NSPredicate predicateWithFormat: @"width == %d", 20];
            if ([predicate evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject true");
            }

            NSPredicate* predicate1 = [NSPredicate predicateWithFormat:
                    @"%K == %d", @"width", 20];
            if ([predicate1 evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject true");
            }

            NSPredicate* predicateTemplate = [NSPredicate predicateWithFormat:
                    @"width == $WIDTH"];
            NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                    [NSNumber numberWithInt: 20], @"WIDTH", nil];
            NSPredicate* predicate2 = [predicateTemplate
                    predicateWithSubstitutionVariables: dict];
            if ([predicate2 evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject true");
            }
        }
        {
            ShapeBounds* bounds = [[ShapeBounds alloc] init];
            bounds.width = 20;
            bounds.height = 30;
            NSPredicate* predicate = [NSPredicate predicateWithFormat: @"width > 10"];
            if ([predicate evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject >");
            }

            predicate = [NSPredicate predicateWithFormat: @"width < 30"];
            if ([predicate evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject <");
            }

            predicate = [NSPredicate predicateWithFormat: @"width != 30"];
            if ([predicate evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject !=");
            }

            predicate = [NSPredicate predicateWithFormat:
                         @"(width == 20) AND (height = 30)"];
            if ([predicate evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject AND");
            }

            predicate = [NSPredicate predicateWithFormat: @"width BETWEEN {10, 30}"];
            if ([predicate evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject BETWEEN");
            }

            predicate = [NSPredicate predicateWithFormat: @"width IN {10, 20, 30}"];
            if ([predicate evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject IN");
            }

            // SELF是响应谓词计算的对象
            predicate = [NSPredicate predicateWithFormat: @"SELF.width IN {10, 20, 30}"];
            if ([predicate evaluateWithObject: bounds]) {
                NSLog(@"evaluateWithObject IN");
            }

            predicate = [NSPredicate predicateWithFormat: @"SELF IN {'Tom', 'Mike'}"];
            NSArray* array = [NSArray arrayWithObjects: @"Tom", @"July", nil];
            NSArray* result = [array filteredArrayUsingPredicate: predicate];
            NSLog(@"%@", result);
        }
    }
    return 0;
}


