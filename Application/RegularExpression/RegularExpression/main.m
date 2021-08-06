//
//  main.m
//  RegularExpression
//
//  Created by PeterChen on 2021/3/9.
//

#import <Foundation/Foundation.h>

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSString *pattern = @"a[B|C]d";
        NSRegularExpressionOptions option = NSRegularExpressionCaseInsensitive;
        NSError *error = nil;
        
        NSString *str = @"abc abd acb acd adb adc";
        
        // 0
        NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
        NSLog(@"%ld", [regular numberOfMatchesInString:str options:0 range:NSMakeRange(0, str.length)]);
        
        // 2
        regular = [[NSRegularExpression alloc] initWithPattern:pattern options:option error:&error];
        NSLog(@"%ld", [regular numberOfMatchesInString:str options:0 range:NSMakeRange(0, str.length)]);
        
        // abd
        NSTextCheckingResult *result = [regular firstMatchInString:str options:0 range:NSMakeRange(0, str.length)];
        if (result.range.location != NSNotFound) {
            NSLog(@"firstMatchInString result: %@", [str substringWithRange: result.range]);
        }
        
        // abd
        NSRange range = [regular rangeOfFirstMatchInString:str options:0 range:NSMakeRange(0, str.length)];
        if (range.location != NSNotFound) {
            NSLog(@"rangeOfFirstMatchInString result: %@", [str substringWithRange:range]);
        }
        
        // abd
        // acd
        NSArray *results = [regular matchesInString:str options:0 range:NSMakeRange(0, str.length)];
        for (NSTextCheckingResult *result in results) {
            NSLog(@"matchesInString result: %@", [str substringWithRange:result.range]);
        }
        
        // abd
        // acd
        [regular enumerateMatchesInString:str options:0 range:NSMakeRange(0, str.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
                NSLog(@"enumerateMatchesInString result: %@", [str substringWithRange:result.range]);
        }];
        
        // abc ### acb ### adb adc
        NSString *replaceStr = [regular stringByReplacingMatchesInString:str options:0 range:NSMakeRange(0, str.length) withTemplate:@"###"];
        NSLog(@"stringByReplacingMatchesInString result: %@", replaceStr);
        
        // 2
        // abc ### acb ### adb adc
        NSMutableString *mutableString = [NSMutableString stringWithString:str];
        NSUInteger number = [regular replaceMatchesInString:mutableString options:0 range:NSMakeRange(0, mutableString.length) withTemplate:@"###"];
        NSLog(@"replaceMatchesInString number = %ld result: %@", number, mutableString);
        
    }
    return 0;
}
