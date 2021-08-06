//
//  main.m
//  DataDetector
//
//  Created by PeterChen on 2021/3/15.
//

#import <Foundation/Foundation.h>

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSTextCheckingTypes type = NSTextCheckingTypeDate|NSTextCheckingTypePhoneNumber|NSTextCheckingTypeLink;
        NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:type error:nil];
        
        NSString* detectorStr = @"姓名: 张三 出生日期: 19900308 电话: 13712345678 邮件: zhangsan@126.com 地址: 上海市浦东新区";
        
        // 3
        NSLog(@"%ld", [detector numberOfMatchesInString:detectorStr options:0 range:NSMakeRange(0, detectorStr.length)]);
        
        // 19900308
        NSTextCheckingResult* result = [detector firstMatchInString:detectorStr options:0 range:NSMakeRange(0, detectorStr.length)];
        if (result.range.location != NSNotFound) {
            NSLog(@"firstMatchInString result: %@", [detectorStr substringWithRange: result.range]);
        }
        
        // 19900308
        NSRange range = [detector rangeOfFirstMatchInString:detectorStr options:0 range:NSMakeRange(0, detectorStr.length)];
        if (range.location != NSNotFound) {
            NSLog(@"rangeOfFirstMatchInString result: %@", [detectorStr substringWithRange:range]);
        }
        
        // 19900308
        // 13712345678
        // zhangsan@126.com
        NSArray* results = [detector matchesInString:detectorStr options:0 range:NSMakeRange(0, detectorStr.length)];
        for (NSTextCheckingResult* result in results) {
            NSLog(@"matchesInString result: %@", [detectorStr substringWithRange:result.range]);
        }
        
        // date = 19900308
        // phone = 13712345678
        // link = zhangsan@126.com
        [detector enumerateMatchesInString:detectorStr options:0 range:NSMakeRange(0, detectorStr.length)
                        usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            if (result.resultType == NSTextCheckingTypeDate) {
                NSLog(@"date = %@", [detectorStr substringWithRange:result.range]);
            } else if (result.resultType == NSTextCheckingTypePhoneNumber) {
                NSLog(@"phone = %@", [detectorStr substringWithRange:result.range]);
            } else if (result.resultType == NSTextCheckingTypeLink) {
                NSLog(@"link = %@", [detectorStr substringWithRange:result.range]);
            }
        }];

    }
    return 0;
}
