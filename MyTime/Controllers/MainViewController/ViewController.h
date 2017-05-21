//
//  ViewController.h
//  MyTime
//
//  Created by Daniel Richardson on 14/4/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MyTimeCustomCell.h"
#import "KAProgressLabel+KAProgressLabel_DefaultObjectProperties.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    // these are the charts for the view and will display the users scores
    IBOutlet KAProgressLabel *timeManagementShortChart;
    IBOutlet KAProgressLabel *timeMagementAttitudeChart;
    IBOutlet KAProgressLabel *timeManagementLongChart;
}

@property (nonatomic, retain) IBOutlet KAProgressLabel *timeManagementShortChart;
@property (nonatomic, retain) IBOutlet KAProgressLabel *timeMagementAttitudeChart;
@property (nonatomic, retain) IBOutlet KAProgressLabel *timeManagementLongChart;

// causes the settings view to slide in from the left of the application
- (IBAction)settingsBarButton:(UIBarButtonItem *)sender;

@end

