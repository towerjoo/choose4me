//
//  ListChoicesViewController.h
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListChoicesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *data;
}
@property (nonatomic, retain) NSMutableArray *data;

@end
