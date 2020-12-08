//
//  DataManager.m
//  StaticVariable
//
//  Created by PeterChen on 2020/12/8.
//

#import "DataManager.h"

@implementation DataManager

static DataManager* manager = nil;

+ (DataManager *)getDataManager {
    static dispatch_once_t once;
    
    dispatch_once(&once, ^(void){
        manager = [[DataManager alloc] init];
    });
    return manager;
}

@end
