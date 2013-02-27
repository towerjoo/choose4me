//
//  HistoryManager.m
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import "HistoryManager.h"

@implementation HistoryManager
@synthesize data;

static HistoryManager *sharedManager = nil;

+(HistoryManager *) sharedManager{
    if (sharedManager == nil){
        sharedManager = [[HistoryManager alloc] init];
        [sharedManager loadData];
    }
    return sharedManager;
}

-(void) loadData{
    NSString *path = [[NSBundle mainBundle] pathForResource:kHistoryName ofType:@"plist"];
    data = [[NSMutableArray alloc] initWithContentsOfFile:path];
}

-(void) updateData:(NSDictionary *)newChoice{
    [data insertObject:newChoice atIndex:0];
    NSString *path = [[NSBundle mainBundle] pathForResource:kHistoryName ofType:@"plist"];
    [data writeToFile:path atomically:YES];
}

@end
