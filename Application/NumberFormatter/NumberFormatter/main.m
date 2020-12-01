//
//  main.m
//  NumberFormatter
//
//  Created by PeterChen on 2020/11/30.
//

#import <Foundation/Foundation.h>

void numberStyle() {
    NSNumberFormatter* formatter = [NSNumberFormatter new];
    NSNumber* number = [NSNumber numberWithDouble:123456.654321];
    
    NSLog(@"DefaultStyle    %@", [formatter stringFromNumber:number]);
    
    // 123457，默认格式，去掉小数点
    formatter.numberStyle = NSNumberFormatterNoStyle;
    NSLog(@"NoStyle         %@", [formatter stringFromNumber:number]);

    // 123,456.654，以国际化格式输出,保留三位小数
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSLog(@"DecimalStyle    %@", [formatter stringFromNumber:number]);
    
    // ¥123,456.65，以货币通用格式输出，保留2位小数
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    NSLog(@"CurrencyStyle   %@", [formatter stringFromNumber:number]);

    // 12,345,665%，以百分制形式输出，乘以100，同时在最后加上百分号
    formatter.numberStyle = NSNumberFormatterPercentStyle;
    NSLog(@"PercentStyle    %@", [formatter stringFromNumber:number]);

    // 1.23456654321E5，以科学计数法输出
    formatter.numberStyle = NSNumberFormatterScientificStyle;
    NSLog(@"ScientificStyle %@", [formatter stringFromNumber:number]);

    // 十二万三千四百五十六点六五四三二一，原值的中文表示
    formatter.numberStyle = NSNumberFormatterSpellOutStyle;
    NSLog(@"SpellOutStyle   %@", [formatter stringFromNumber:number]);
    
    // 第123,457
    formatter.numberStyle = NSNumberFormatterOrdinalStyle;
    NSLog(@"OrdinalStyle    %@", [formatter stringFromNumber:number]);
    
    // CNY 123,456.65
    formatter.numberStyle = NSNumberFormatterCurrencyISOCodeStyle;
    NSLog(@"ISOCodeStyle    %@", [formatter stringFromNumber:number]);
    
    // 123,456.65 人民币
    formatter.numberStyle = NSNumberFormatterCurrencyPluralStyle;
    NSLog(@"PluralStyle     %@", [formatter stringFromNumber:number]);
    
    // ¥123,456.65
    formatter.numberStyle = NSNumberFormatterCurrencyAccountingStyle;
    NSLog(@"AccountingStyle %@", [formatter stringFromNumber:number]);
}

void roundingMode() {
    NSNumberFormatter* formatter = [NSNumberFormatter new];
    
    // 向上取整
    formatter.roundingMode = NSNumberFormatterRoundCeiling;
    NSLog(@"RoundCeiling     %@", [formatter stringFromNumber:@444.4]);  // 445
    NSLog(@"RoundCeiling     %@", [formatter stringFromNumber:@555.5]);  // 556
    NSLog(@"RoundCeiling     %@", [formatter stringFromNumber:@-444.4]); // -444
    NSLog(@"RoundCeiling     %@", [formatter stringFromNumber:@-555.5]); // -555
    
    // 444, -445, 向下取整
    formatter.roundingMode = NSNumberFormatterRoundFloor;
    NSLog(@"RoundFloor       %@", [formatter stringFromNumber:@444.4]);  // 444
    NSLog(@"RoundFloor       %@", [formatter stringFromNumber:@555.5]);  // 555
    NSLog(@"RoundFloor       %@", [formatter stringFromNumber:@-444.4]); // -445
    NSLog(@"RoundFloor       %@", [formatter stringFromNumber:@-555.5]); // -556

    // 456.654, -456.654, 向0的方向取整
    formatter.roundingMode = NSNumberFormatterRoundDown;
    NSLog(@"RoundDown        %@", [formatter stringFromNumber:@444.4]);  // 444
    NSLog(@"RoundDown        %@", [formatter stringFromNumber:@555.5]);  // 555
    NSLog(@"RoundDown        %@", [formatter stringFromNumber:@-444.4]); // -444
    NSLog(@"RoundDown        %@", [formatter stringFromNumber:@-555.5]); // -555

    // 456.655, -456.655, 同NSNumberFormatterRoundDown相反, 远离0的方向取整
    formatter.roundingMode = NSNumberFormatterRoundUp;
    NSLog(@"RoundUp          %@", [formatter stringFromNumber:@444.4]);  // 445
    NSLog(@"RoundUp          %@", [formatter stringFromNumber:@555.5]);  // 556
    NSLog(@"RoundUp          %@", [formatter stringFromNumber:@-444.4]); // -445
    NSLog(@"RoundUp          %@", [formatter stringFromNumber:@-555.5]); // -556

    // 若是奇数则四舍五入，若是偶数则五舍六入
    formatter.roundingMode = NSNumberFormatterRoundHalfEven;
    NSLog(@"RoundHalfEven    %@", [formatter stringFromNumber:@666.5]);  // 666
    NSLog(@"RoundHalfEven    %@", [formatter stringFromNumber:@666.6]);  // 667
    NSLog(@"RoundHalfEven    %@", [formatter stringFromNumber:@555.4]);  // 555
    NSLog(@"RoundHalfEven    %@", [formatter stringFromNumber:@555.5]);  // 556

    // 五舍六入，负数先取绝对值再五舍六入再负数
    formatter.roundingMode = NSNumberFormatterRoundHalfDown;
    NSLog(@"RoundHalfDown    %@", [formatter stringFromNumber:@555.5]);  // 555
    NSLog(@"RoundHalfDown    %@", [formatter stringFromNumber:@666.6]);  // 667
    NSLog(@"RoundHalfDown    %@", [formatter stringFromNumber:@-555.5]); // -555
    NSLog(@"RoundHalfDown    %@", [formatter stringFromNumber:@-666.6]); // -667
    
    // 四舍五入
    formatter.roundingMode = NSNumberFormatterRoundHalfUp;
    NSLog(@"RoundHalfUp      %@", [formatter stringFromNumber:@444.4]);  // 444
    NSLog(@"RoundHalfUp      %@", [formatter stringFromNumber:@555.5]);  // 556
    NSLog(@"RoundHalfUp      %@", [formatter stringFromNumber:@-444.4]); // -444
    NSLog(@"RoundHalfUp      %@", [formatter stringFromNumber:@-555.5]); // -556
}

void prefixSuffix() {
    NSNumberFormatter* formatter = [NSNumberFormatter new];
    NSNumber* number = [NSNumber numberWithDouble:123456.654321];
    
    formatter.positivePrefix = @"$"; // 前缀符号
    formatter.positiveSuffix = @"元"; // 后缀符号
    // $123457元
    NSLog(@"positive    %@", [formatter stringFromNumber:number]);
    
    number = [NSNumber numberWithDouble:-123456.654321];
    
    formatter.negativePrefix = @"^"; // 前缀符号
    formatter.negativeSuffix = @"元亏损"; // 后缀符号
    // ^123457元亏损
    NSLog(@"negative    %@", [formatter stringFromNumber:number]);
}

void padding() {
    NSNumberFormatter* formatter = [NSNumberFormatter new];
    formatter.formatWidth = 10;
    formatter.paddingCharacter = @"#";
    formatter.positivePrefix = @"$"; // 前缀符号
    formatter.positiveSuffix = @"元"; // 后缀符号
    
    // #####$123元
    formatter.paddingPosition = NSNumberFormatterPadBeforePrefix;
    NSLog(@"BeforePrefix    %@", [formatter stringFromNumber:@123.45]);
    
    // $#####123元
    formatter.paddingPosition = NSNumberFormatterPadAfterPrefix;
    NSLog(@"AfterPrefix     %@", [formatter stringFromNumber:@123.45]);

    // $123#####元
    formatter.paddingPosition = NSNumberFormatterPadBeforeSuffix;
    NSLog(@"BeforePrefix    %@", [formatter stringFromNumber:@123.45]);

    // $123元#####
    formatter.paddingPosition = NSNumberFormatterPadAfterSuffix;
    NSLog(@"AfterSuffix     %@", [formatter stringFromNumber:@123.45]);
}

void digits() {
    NSNumberFormatter* formatter = [NSNumberFormatter new];
    formatter.maximumFractionDigits = 4;
    formatter.minimumFractionDigits = 2;
    
    NSLog(@"FractionDigits     %@", [formatter stringFromNumber:@123.4]);
    NSLog(@"FractionDigits     %@", [formatter stringFromNumber:@123.45678]);
    
    formatter = [NSNumberFormatter new];
    formatter.maximumIntegerDigits = 4;
    formatter.minimumIntegerDigits = 2;
    NSLog(@"FractionDigits     %@", [formatter stringFromNumber:@1]);
    NSLog(@"FractionDigits     %@", [formatter stringFromNumber:@12345]);
}

void parameter() {
    NSNumberFormatter* formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSLog(@"groupingSeparator    %@", [formatter stringFromNumber:@123456789]);
    formatter.groupingSize = 4;
    formatter.groupingSeparator = @";";
    NSLog(@"groupingSeparator    %@", [formatter stringFromNumber:@123456789]);

    formatter.decimalSeparator = @"*";
    NSLog(@"decimalSeparator     %@", [formatter stringFromNumber:@123456.65]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        numberStyle();
        roundingMode();
        prefixSuffix();
        padding();
        
        digits();
        parameter();
    }
    return 0;
}
