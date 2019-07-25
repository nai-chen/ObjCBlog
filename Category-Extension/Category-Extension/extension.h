//
//  extension.h
//  Category-Extension
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Extension : NSObject

@property int param1;
@property (readonly, assign) int param2;

- (void) setParam;

@end
