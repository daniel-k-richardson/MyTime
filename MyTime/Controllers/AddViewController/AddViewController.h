//
//  AddViewController.h
//  MyTime
//
//  Created by Daniel Richardson on 17/5/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"


@interface AddViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>


- (IBAction)dateChanged:(UIDatePicker *)sender;
- (IBAction)saveTask:(UIButton *)sender;

@end
