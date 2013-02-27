//
//  MainViewController.m
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import "MainViewController.h"
#import "HistoryManager.h"
#import "StorageManager.h"
@interface MainViewController ()

@end

@implementation MainViewController
@synthesize data, table;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data = [HistoryManager sharedManager].data;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: table delegates

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return MIN(7, [data count]);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reusableID = @"tableID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableID];
    NSDictionary *item = [data objectAtIndex:indexPath.row];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reusableID];
        cell.textLabel.text = [item objectForKey:@"name"];
        cell.detailTextLabel.text = [[item objectForKey:@"time"] description];
    }
    return cell;
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(IBAction)onChoose4Me:(id)sender{
    NSDictionary *choice = [[StorageManager sharedManager] getRandomChoice];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:choice];
    NSDate *now = [NSDate date];
    [dict setObject:now forKey:@"date"];
    [[HistoryManager sharedManager] updateData:dict];
    NSString *result = [NSString stringWithFormat:@"We choose %@ for you at %@. Enjoy your meal!",
                        [choice objectForKey:@"name"], [choice objectForKey:@"place"]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Choice for you" message:result delegate:self cancelButtonTitle:@"Thanks"otherButtonTitles:nil, nil];
    [alert show];
}

// MARK: UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
    [table reloadData];
}
@end
