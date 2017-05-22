//
//  AddViewController.m
//  MyTime
//
//  Created by Daniel Richardson on 17/5/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import "AddViewController.h"
#import "AppDelegate.h"

@interface AddViewController () {
    
    IBOutlet UITextField *taskName;
    IBOutlet UITextField *unitcode;
    
    
    IBOutlet UIDatePicker *dueDatePicker;
    IBOutlet UIPickerView *categoryPicker;
 
    NSArray *_categoryPickerData;
    NSArray *_weightValuePickerData;
    
    NSString *assignmentTitle;
    NSString *importance;
    NSDate *dueDate;
    NSString *assignmentWeight;
    NSString *unitCode;
    
    NSManagedObjectContext *context;
}

@property (nonatomic, strong) ViewController *vcontroller;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    _categoryPickerData = @[@"Important",
                            @"Urgent",
                            @"Both"];
    
     _weightValuePickerData = @[@"5%", @"10%", @"15%",@"20%", @"25%", @"5%",
                                @"10%", @"15%",@"20%", @"25%", @"30%",
                                @"35%", @"40%",@"45%", @"50%", @"55%",
                                @"60%", @"65%",@"70%", @"75%", @"80%",
                                @"85%", @"90%",@"95%", @"100%"];
    
    
    self->categoryPicker.dataSource = self;
    self->categoryPicker.delegate = self;
    

    
}


// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return _categoryPickerData.count;
    }
    
    return _weightValuePickerData.count;
    
    //return _categoryPickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   //return _categoryPickerData[component][row];
    if (component == 0) {
        return _categoryPickerData[row];
    }
    return _weightValuePickerData[row];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    if (component == 0)
    {
        self->importance  = [[NSString alloc] initWithFormat:@"%@", _categoryPickerData[row]];
    } else {
        self->assignmentWeight = [[NSString alloc] initWithFormat:@"%@", _weightValuePickerData[row]];
    }
}



- (IBAction)dateChanged:(UIDatePicker *)sender {
    
    self->dueDate = sender.date;
}

- (IBAction)saveTask:(UIButton *)sender {
    self->assignmentTitle = taskName.text;
    self->unitCode = unitcode.text;
    
    //todo validate fiels before save.
    
    context = ((AppDelegate*)[UIApplication sharedApplication].delegate).persistentContainer.viewContext;
    NSManagedObject *entityNameObj = [NSEntityDescription insertNewObjectForEntityForName:@"Tasks" inManagedObjectContext:context];
    
    
    [entityNameObj setValue:self->assignmentTitle forKey:@"name"];
    [entityNameObj setValue:self->dueDate forKey:@"due_date"];
    [entityNameObj setValue:self->unitCode forKey:@"unit_code"];
    [entityNameObj setValue:self->assignmentWeight forKey:@"weight"];
    [entityNameObj setValue:self->importance forKey:@"importance"];

    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    

}
@end
