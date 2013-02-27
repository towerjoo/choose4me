//
//  MainViewController.h
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
{
    NSMutableArray *data;
    UITableView *table;
}
@property (nonatomic, retain) IBOutlet UITableView *table;
@property (nonatomic, retain) NSMutableArray *data;

-(IBAction)onChoose4Me:(id)sender;
@end
