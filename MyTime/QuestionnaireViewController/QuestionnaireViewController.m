//
//  QuestionnaireViewController.m
//  MyTime
//
//  Created by Daniel Richardson on 22/5/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import "QuestionnaireViewController.h"

@interface QuestionnaireViewController () {
    IBOutlet UILabel *sectionName;
    IBOutlet UILabel *questionLabel;
    
    NSDictionary *questionnaire;
}
@end


typedef enum {
    Never = 1,
    Raraly = 2,
    Occasionally = 3,
    Regularly = 4,
    Always = 5
} AWNSERS_VALUES;

typedef struct sectionsScores {
    int sectioShort;
    int sectionAttitude;
    int sectionLong;
} scores;


@implementation QuestionnaireViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    // this is a dictionary of sections and each sections question that will be displayed to the user as they go through the questionnaire
    questionnaire = [NSDictionary dictionary];
    
    // section 1 (short term goals) for time management questions
    NSArray *sectionOne = [NSArray arrayWithObjects:
                           @"1. Do you make a list of the things you have to do each day?",
                           @"2. Do you plan your day before you start it?",
                           @"3. Do you make a schedule of the activities you have to do on work days?",
                           @"4. Do you write a set of goals for yourself for each day?",
                           @"5. Do you spend time each day planning?",
                           @"6. Do you have a clear idea of what you want to accomplish during the next week?",
                           @"7. Do you set and honor priorities?",
                           nil];
    
    // section 2 (attidute to time managemnet) questions for time management
    NSArray *sectionTwo = [NSArray arrayWithObjects:
                           @"1. Do you often find yourself doing things which interfere with your schoolwork simply because you hate to say \"No\" to people?",
                           @"2. Do you feel you are in charge of your own time, by and large?",
                           @"3. On an average class day do you spend more time with personal grooming than doing schoolwork?*",
                           @"4. Do you believe that there is room for improvement in the way you manage your time?",
                           @"5. Do you make constructive use of your time?",
                           @"6. Do you continue unprofitable routines or activities?",
                           nil];

    // section 3 (long term time management goals) questions for time management
    NSArray *sectionThree = [NSArray arrayWithObjects:
                             @"1. Do you usually keep your desk clear of everything other than what you are currently working on?",
                             @"2. Do you have a set of goals for the entire quarter?",
                             @"3. The night before a major assignment is due, are you usually still working on it?",
                             @"4. When you have several things to do, do you think it is best to do a little bit of work on each one?",
                             @"5. Do you regularly review your class notes, even when a test is not imminent?",
                             nil];
    
    // compile all the sections of questions above into one array of sections
    NSArray *sections = [NSArray arrayWithObjects: sectionOne, sectionTwo, sectionThree, nil];
    
    // an array of keys related to their sections, this will be used to create a dict where these keys will correspond to sections questions for easy access
    NSArray *keysArray = [NSArray arrayWithObjects: @"Short-Range Planning", @"Time Attitudes", @"Long-Range Planning", nil];
    
    // assign the dict with a key and an array of questions by compiling all the above.
    questionnaire = [[NSDictionary alloc] initWithObjects: sections forKeys: keysArray];
    
    // for debug and example of how this will work.
    NSLog ( @"%@", [questionnaire objectForKey: @"Short-Range Planning"]);
}


- (IBAction)awnserClicked:(UIButton *)sender {
    // get the buttons name
    //self->questionLabel.text = [(UIButton *)sender currentTitle];
    
    NSString *buttonTitle = [(UIButton *)sender currentTitle];
    
    // convert the button name to value to calculate the score for the section
    if ([buttonTitle isEqualToString:@"Never"]) {
        self->questionLabel.text = [(UIButton *)sender currentTitle];
    } else if ([buttonTitle isEqualToString:@"Rarely"]) {
        // todo
        self->questionLabel.text = [(UIButton *)sender currentTitle];
    } else if ([buttonTitle isEqualToString:@"Occasionally"]) {
        self->questionLabel.text = [(UIButton *)sender currentTitle];
        // todo
    } else if ([buttonTitle isEqualToString:@"Regularly"]) {
        // todo
        self->questionLabel.text = [(UIButton *)sender currentTitle];
    } else {
        // todo
        self->questionLabel.text = @"Always";
    }
    
    // check to see if there is another question
    
    // if other question exists then display question
    // if all questions in section is finished move to next session
    // change section label then display section question
    
    // if last section and question is complete prompt for save and exit.
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
