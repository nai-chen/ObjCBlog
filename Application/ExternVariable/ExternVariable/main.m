//
//  main.m
//  ExternVariable
//
//  Created by PeterChen on 2020/12/8.
//

#import <Foundation/Foundation.h>
//#import "GlobalConstant.h"

extern NSString* const GC_NUMBER;

int main(int argc, const char * argv[]) {

    NSLog(@"%@", GC_NUMBER);
    return 0;
}
