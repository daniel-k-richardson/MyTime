//
//  ViewController.m
//  MyTime
//
//  Created by Daniel Richardson on 14/4/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *tasks;
    NSManagedObjectContext *context;
    MyTimeCustomCell *cell;
    NSUserDefaults *defaults;
    
}


// The user's score chart for short, attitude and long term goals
@synthesize timeManagementShortChart;
@synthesize timeMagementAttitudeChart;
@synthesize timeManagementLongChart;


// stuff in here gets refreshed every time the view is opened <insert happy moji>.
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // blue theme for short term time management
    NSDictionary *blueTheme = @{@"red":@0.03f, @"green":@0.22f, @"blue":@0.39f, @"alpha":@1.0f};
    NSDictionary *redTheme = @{@"red":@0.40f, @"green":@0.00f, @"blue":@0.00f, @"alpha":@1.0f};
    NSDictionary *greenTheme = @{@"red":@0.15f, @"green":@0.31f, @"blue":@0.07f, @"alpha":@1.0f};

    // populate short term time management chart with default data
    self.timeManagementShortChart = [KAProgressLabel fillWithDefaultValues: self.timeManagementShortChart
                                                             categoryScore:[defaults floatForKey:@"shortScorePrecentage"]
                                                                 endDegree:35.0f
                                                               colourTheme:blueTheme];
    
    // populate short term time management chart with default data
    self.timeMagementAttitudeChart = [KAProgressLabel fillWithDefaultValues: self.timeMagementAttitudeChart
                                                              categoryScore:[defaults floatForKey:@"attitudeScorePrecentage"]
                                                                  endDegree:30.0f
                                                                colourTheme:redTheme];
    
    // populate short term time management chart with default data
    self.timeManagementLongChart = [KAProgressLabel fillWithDefaultValues: self.timeManagementLongChart
                                                            categoryScore:[defaults floatForKey:@"longScorePrecentage"]
                                                                endDegree:25.0f
                                                              colourTheme:greenTheme];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tasks"];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tasks" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    // check for errors
    NSError *error = nil;
    tasks = [context executeFetchRequest:fetchRequest error:&error];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // defaults storing their time management scores
    defaults = [NSUserDefaults standardUserDefaults];
    
    // coredata for storing tasks for the custom cell
    context = ((AppDelegate*)[UIApplication sharedApplication].delegate).persistentContainer.viewContext;
}


/**
 Listens for the setting button, once the user has clicked the button the view should
 slide in from the left side. If the settings view is already open then it will slide
 it back out and the view returns to normal.

 @param sender the settings button object.
 */
- (IBAction)settingsBarButton:(UIBarButtonItem *)sender {
    
    AppDelegate *navigationAppDelegage = (AppDelegate*) [UIApplication sharedApplication].delegate;
    [navigationAppDelegage.DrawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

/**
 The table view can contain more than one item, consider the element as a table
 whereby each row contains a number of columns. In this analogy section refers to
 the columns, this fucntion gets the number of columns in a row.

 @param tableView the TableView that the task items will be visible in.
 @param section an array of items.
 @return returns the number of rows in the section.
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tasks count];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        //[cell removeObjectAtIndex:indexPath.row];
        
        //[colorNames removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView reloadData]; // tell table to refresh now
    }
}


/**
 This function takes three arrays of values, in this case name, unitcode etc. the
 purpose of this function is to traverse through each of the four arrays assign the
 labels stored in the CustomCell class and return the cell back to the TableView.

 @param tableView the tableview to set the datasource.
 @param indexPath the index of the TableView the cell will be assigned.
 @return <#return value description#>
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // connect my custom cell with the TableView by the identifier
    cell = [tableView dequeueReusableCellWithIdentifier:@"myTimeCustomCell" forIndexPath:indexPath];
    NSManagedObject *task = [self->tasks objectAtIndex:indexPath.row];
    
    [cell.assignmentName setText:[NSString stringWithFormat:@"%@", [task valueForKey:@"name"]]];
    [cell.unitCode setText:[NSString stringWithFormat:@"%@", [task valueForKey:@"unit_code"]]];
    [cell.weight setText:[NSString stringWithFormat:@"%@", [task valueForKey:@"weight"]]];
    [cell.dueDate setText:[NSString stringWithFormat:@"%@", [task valueForKey:@"due_date"]]];
    [cell.importance setText:[NSString stringWithFormat:@"%@", [task valueForKey:@"importance"]]];
    
    
    
    return cell;
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        NSLog(@"index: %ld",(long)indexPath.row);
        
        //NSManagedObject *task = [self->tasks objectAtIndex:indexPath.row];
        
        [context deleteObject:[self->tasks objectAtIndex:indexPath.row]];
        NSError * error = nil;
        if (![context save:&error])
        {
            NSLog(@"Error ! %@", error);
        }
        
        
        
        
        [tableView reloadData];
        
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    return @[deleteAction];
}

@end
