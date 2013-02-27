//
//  HistoryManager.h
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kHistoryName @"history"

@interface HistoryManager : NSObject
{
    NSMutableArray *data;
}
@property (nonatomic, retain) NSMutableArray *data;
+(HistoryManager *)sharedManager;
-(void) loadData;
-(void) updateData:(NSDictionary *)newChoice;

@end
