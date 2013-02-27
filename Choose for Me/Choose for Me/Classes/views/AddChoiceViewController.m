//
//  AddChoiceViewController.m
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import "AddChoiceViewController.h"
#import "StorageManager.h"

@interface AddChoiceViewController ()

@end

@implementation AddChoiceViewController
@synthesize save, reset, name, place;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)onSave:(id)sender{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *newName = [name.text stringByTrimmingCharactersInSet:set];
    NSString *newPlace = [place.text stringByTrimmingCharactersInSet:set];
    
    if ([newName isEqualToString:@""]){
        [name becomeFirstResponder];
        return;
    }
    if ([newPlace isEqualToString:@""]){
        [place becomeFirstResponder];
        return;
    }
    NSArray *keys = [NSArray arrayWithObjects:@"name", @"place", nil];
    NSArray *values = [NSArray arrayWithObjects:newName, newPlace, nil];
    NSDictionary *data = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    [[StorageManager sharedManager] updateData:data];
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onReset:(id)sender{
    [name setText:@""];
    [place setText:@""];
}

// MARK: Text Field Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == name){
        [place becomeFirstResponder];
    }
    else if (textField == place){
        [self onSave:nil];
    }
    return YES;
}

@end
