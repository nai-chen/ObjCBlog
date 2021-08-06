//
//  main.m
//  Data-String
//
//  Created by Peter on 2019/7/17.
//  Copyright © 2019 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *string1 = @"Hello World";
        NSString *string2 = [NSString stringWithFormat:@"Hello World"];
        NSString *string3 = @"hello world";
        NSString *string4 = @"99";
        NSString *string5 = @"100";
        
        NSLog(@"%@ len is %lu", string1, [string1 length]);
        
        if ([string1 isEqualToString:string2]) {
            NSLog(@"equalToString");
        }
        
        if ([string1 compare:string2] == NSOrderedSame) {
            NSLog(@"same");
        }
        
        NSLog(@"compre result = %ld", [string1 compare:string3]);
        NSLog(@"CaseInsensitive compre result = %ld",
              [string1 compare:string3 options:NSCaseInsensitiveSearch]);
        NSLog(@"compre result = %ld", [string4 compare:string5]);
        NSLog(@"Numeric compre result = %ld",
              [string4 compare:string5 options:NSNumericSearch]);
        
        if ([string3 hasPrefix:@"hello"]) {
            NSLog(@"hasPrefix");
        }
        
        if ([string3 hasSuffix:@"world"]) {
            NSLog(@"hasSuffix");
        }
    }
    
    @autoreleasepool {
        NSMutableString *string = [NSMutableString stringWithCapacity: 17];
        [string appendString:@"Hello World, "];
        [string appendFormat:@"%@", @"Welcome to Objective-C."];
        NSLog(@"%@", string);
        
        NSRange range = [string rangeOfString:@"World"];
        if (range.location != NSNotFound) {
            [string deleteCharactersInRange:range];
        }
        NSLog(@"%@", string);
        
        return 0;
    }
    return 0;
}
