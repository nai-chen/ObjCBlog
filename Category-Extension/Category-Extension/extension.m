//
//  extension.m
//  Category-Extension
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import "extension.h"

@interface Extension () {
    int param4;
}

@property (readwrite, assign) int param2;
@property int param3;

@end

@implementation Extension

@synthesize param1;
@synthesize param2;
@synthesize param3;

- (void) setParam {
    self.param1 = 20;
    self.param2 = 30;
    self.param3 = 40;
    param4 = 50;
}

- (NSString*) description {
    return [NSString stringWithFormat: @"(%d %d %d %d)",
            param1, param2, param3, param4];
}

@end
