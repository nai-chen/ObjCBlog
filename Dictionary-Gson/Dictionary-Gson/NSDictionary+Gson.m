//
//  NSDictionary+Gson.m
//  Dictionary-Gson
//
//  Created by Peter on 2019/7/23.
//  Copyright © 2019 peter. All rights reserved.
//

#import "NSDictionary+Gson.h"

@implementation NSDictionary (Gson)

- (NSString *)toGson {
    NSMutableString *gson = [NSMutableString stringWithCapacity:42];
    
    [gson appendString:@"{"];
    for (id key in self) {
        [gson appendFormat:@"%@ : \"%@\", ", key, self[key]];
    }
    NSUInteger len = [gson length];
    if (len > 1) {
        NSRange range = NSMakeRange(len - 2, 2);
        [gson deleteCharactersInRange:range];
    }
    [gson appendString:@"}"];
    
    return gson;
}

@end
