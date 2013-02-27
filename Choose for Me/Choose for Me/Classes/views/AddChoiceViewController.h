//
//  AddChoiceViewController.h
//  Choose for Me
//
//  Created by Zhu Tao on 2/27/13.
//  Copyright (c) 2013 Zhu Tao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddChoiceViewController : UIViewController<UITextFieldDelegate>
{
    UIButton *save;
    UIButton *reset;
    UITextField *name;
    UITextField *place;
}
@property (nonatomic, retain) IBOutlet UIButton *save;
@property (nonatomic, retain) IBOutlet UIButton *reset;
@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UITextField *place;

-(IBAction)onSave:(id)sender;
-(IBAction)onReset:(id)sender;
@end
