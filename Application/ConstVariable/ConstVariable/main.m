//
//  main.m
//  ConstVariable
//
//  Created by PeterChen on 2020/12/8.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    {
        int x = 1;
        int y = 2;

        int* const xp = &x;
        NSLog(@"%p", xp);
        NSLog(@"%d", *xp);

    //    xp = &y; Cannot assign to variable 'xp' with const-qualified type 'int *const'
        *xp = 10;
        NSLog(@"%p", xp);
        NSLog(@"%d", *xp);
    }
    {
        int x = 1;
        int y = 2;
        
        int const *xp = &x;
        NSLog(@"%p", xp);
        NSLog(@"%d", *xp);
        
        xp = &y;
    //    *xp = 10; Read-only variable is not assignable
        NSLog(@"%p", xp);
        NSLog(@"%d", *xp);
    }
    {
        int x = 1;
        int y = 2;
        
        int const * const xp = &x;
//        xp = &y; Cannot assign to variable 'xp' with const-qualified type 'int *const'
//        *xp = 10; Read-only variable is not assignable
    }
    
    return 0;
}
