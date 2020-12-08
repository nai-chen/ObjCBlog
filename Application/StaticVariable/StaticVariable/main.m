//
//  main.m
//  StaticVariable
//
//  Created by PeterChen on 2020/12/8.
//

#import <Foundation/Foundation.h>

int add(int value) {
    static int sum = 0;
    sum += value;
    return sum;
}

int main(int argc, const char * argv[]) {
    NSLog(@"%d", add(1));
    NSLog(@"%d", add(3));
    NSLog(@"%d", add(5));
    NSLog(@"%d", add(7));
    
    return 0;
}
