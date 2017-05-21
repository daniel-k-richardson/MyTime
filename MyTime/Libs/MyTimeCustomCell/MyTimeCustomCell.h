//
//  MyTimeCustomCell.h
//  MyTime
//
//  Created by DanDaMan on 14/5/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTimeCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *assignmentName;
@property (weak, nonatomic) IBOutlet UILabel *unitCode;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *dueDate;
@property (strong, nonatomic) IBOutlet UILabel *importance;

- (void)updateCellData:(NSString *)assignmentName unitCode:(NSString *)unitCode weight:(NSString *)weight dueDate:(NSString *)dueDate importance:(NSString *)importance;
@end
