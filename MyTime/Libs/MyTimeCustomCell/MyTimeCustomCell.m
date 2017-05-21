//
//  MyTimeCustomCell.m
//  MyTime
//
//  Created by DanDaMan on 14/5/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import "MyTimeCustomCell.h"

@implementation MyTimeCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (void)updateCellData:(NSString *)assignmentName unitCode:(NSString *)unitCode weight:(NSString *)weight dueDate:(NSString *)dueDate importance:(NSString *)importance {
    self.assignmentName.text = assignmentName;
    self.unitCode.text = unitCode;
    self.weight.text = weight;
    self.dueDate.text = dueDate;
    self.importance.text = importance;
}


@end
