//
//  QuestionnaireViewController.m
//  MyTime
//
//  Created by Daniel Richardson on 22/5/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import "QuestionnaireViewController.h"

@interface QuestionnaireViewController () {
    IBOutlet UILabel *sectionLabel;
    IBOutlet UILabel *questionLabel;
    
    Queue *questions;
    Queue *current;
    Queue *sectionLabels;
    
    int scores[3];
    bool isDone;
}
@end


@implementation QuestionnaireViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    scores[0] = 0;
    scores[1] = 0;
    scores[2] = 0;
    isDone = NO;
    
    Queue *section1 = [[Queue alloc] init];
    [section1 enqueue:@"1. Do you make a list of the things you have to do each day?"];
    [section1 enqueue:@"2. Do you plan your day before you start it?"];
    [section1 enqueue:@"3. Do you make a schedule of the activities you have to do on work days?"];
    [section1 enqueue:@"4. Do you write a set of goals for yourself for each day?"];
    [section1 enqueue:@"5. Do you spend time each day planning?"];
    [section1 enqueue:@"6. Do you have a clear idea of what you want to accomplish during the next week?"];
    [section1 enqueue:@"7. Do you set and honor priorities?"];
    
    Queue *section2 = [[Queue alloc] init];
    [section2 enqueue:@"1. Do you often find yourself doing things which interfere with your schoolwork simply because you hate to say \"No\" to people?"];
    [section2 enqueue:@"2. Do you feel you are in charge of your own time, by and large?"];
    [section2 enqueue:@"3. On an average class day do you spend more time with personal grooming than doing schoolwork? *"];
    [section2 enqueue:@"4. Do you believe that there is room for improvement in the way you manage your time?"];
    [section2 enqueue:@"5. Do you make constructive use of your time?"];
    [section2 enqueue:@"6. Do you continue unprofitable routines or activities?"];
    
    Queue *section3 = [[Queue alloc] init];
    [section3 enqueue:@"1. Do you usually keep your desk clear of everything other than what you are currently working on?"];
    [section3 enqueue:@"2. Do you have a set of goals for the entire quarter?"];
    [section3 enqueue:@"3. The night before a major assignment is due, are you usually still working on it?"];
    [section3 enqueue:@"4. When you have several things to do, do you think it is best to do a little bit of work on each one?"];
    [section3 enqueue:@"5. Do you regularly review your class notes, even when a test is not imminent?"];
    
    sectionLabels = [[Queue alloc] init];
    [sectionLabels enqueue:@"Short term time management"];
    [sectionLabels enqueue:@"Attitude to time management"];
    [sectionLabels enqueue:@"Long term time management"];
    
    questions = [[Queue alloc] init];
    [questions enqueue:section1];
    [questions enqueue:section2];
    [questions enqueue:section3];

    current = [questions dequeue];
    sectionLabel.text = [sectionLabels dequeue];
    questionLabel.text = [current dequeue];
}


- (IBAction)awnserClicked:(UIButton *)sender {
    static int counter = 0;
    NSString *buttonTitle = [(UIButton *)sender currentTitle];
    
    if(!isDone) {
        if ([buttonTitle isEqualToString:@"Never"]) {
            scores[counter]+= 1;
        } else if ([buttonTitle isEqualToString:@"Rarely"]) {
            scores[counter]+= 2;
        } else if ([buttonTitle isEqualToString:@"Occasionally"]) {
            scores[counter]+= 3;
        } else if ([buttonTitle isEqualToString:@"Regularly"]) {
            scores[counter]+= 4;
        } else {
            scores[counter]+= 5;
        }
        
        if ([current peek]) {
            questionLabel.text = [current dequeue];
        } else {
            if ([questions peek]) {
                current = [questions dequeue];
                questionLabel.text = [current dequeue];
                sectionLabel.text = [sectionLabels dequeue];
                counter++;
            } else {
                isDone = YES;
                counter = 0;
                questionLabel.text = @"Were are done here click slave and exit to return to the main window";
                //NSLog(@"short:%d Attitude:%d Long:%d", scores[0], scores[1], scores[2]);
                [self calculatePrecentages];
            }
        }
    }
    
}

-(void)calculatePrecentages {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

//    float shortScorePrecentage = (100 * scores[0]) / 35;
//    float attitudeScorePrecentage = (100 * scores[1]) / 30;
//    float longScorePrecentage = (100 * scores[2]) / 25;
    
    //Saving to NSUserDefaults
    [defaults setFloat:scores[0] forKey:@"shortScorePrecentage"];
    [defaults setFloat:scores[1] forKey:@"attitudeScorePrecentage"];
    [defaults setFloat:scores[2] forKey:@"longScorePrecentage"];
    [defaults synchronize];
    
    //Reading from NSUserDefaults
    float myInt = [defaults floatForKey:@"shortScorePrecentage"];
    float myString = [defaults floatForKey:@"attitudeScorePrecentage"];
    
    //Print out the values
    NSLog(@"%f %f",myInt, myString );
    
}



@end
