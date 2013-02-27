//
//  StorageManager.m
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import "StorageManager.h"

@implementation StorageManager
@synthesize data;

static StorageManager *sharedManager = nil;

+(StorageManager *) sharedManager{
    if (sharedManager == nil){
        sharedManager = [[StorageManager alloc] init];
        [sharedManager loadData];
    }
    return sharedManager;
}

-(void) loadData{
    NSString *path = [[NSBundle mainBundle] pathForResource:kStorageName ofType:@"plist"];
    data = [[NSMutableArray alloc] initWithContentsOfFile:path];
}

-(void) updateData:(NSDictionary *)newChoice{
    [data insertObject:newChoice atIndex:0];
    NSString *path = [[NSBundle mainBundle] pathForResource:kStorageName ofType:@"plist"];
    [data writeToFile:path atomically:YES];
}

-(NSDictionary *) getRandomChoice{
    int randomInt = arc4random() % [data count];
    return [data objectAtIndex:randomInt];
}

@end
