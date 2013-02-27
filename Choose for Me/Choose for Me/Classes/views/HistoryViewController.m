//
//  HistoryViewController.m
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryManager.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController
@synthesize data, table;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data = [HistoryManager sharedManager].data;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    data = [HistoryManager sharedManager].data;
    [table reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: table delegates

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reusableID = @"tableID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableID];
    NSDictionary *item = [data objectAtIndex:indexPath.row];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reusableID];
    }
    cell.textLabel.text = [item objectForKey:@"name"];
    cell.detailTextLabel.text = [[item objectForKey:@"time"] description];
    return cell;
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


@end
