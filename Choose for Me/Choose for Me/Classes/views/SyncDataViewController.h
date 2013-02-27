//
//  SyncDataViewController.h
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SyncDataViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIPickerView *picker;
    NSMutableArray *data;
}
@property (nonatomic, retain) NSMutableArray *data;
@property (nonatomic, retain) IBOutlet UIPickerView *picker;

-(IBAction)onSync:(id)sender;
@end
