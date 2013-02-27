//
//  SyncDataViewController.m
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import "SyncDataViewController.h"
#import "StorageManager.h"

@interface SyncDataViewController ()

@end

@implementation SyncDataViewController
@synthesize picker, data;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data = [NSMutableArray arrayWithObjects:@"Xi'an", @"Shenzhen", @"Nanjing", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)onSync:(id)sender{
    
}

// MARK: UIPIckerView Delegate

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [data count];
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [data objectAtIndex:row];
}



@end
