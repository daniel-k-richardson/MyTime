//
//  KAProgressLabel+KAProgressLabel_DefaultObjectProperties.m
//  MyTime
//
//  Created by DanDaMan on 27/4/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import "KAProgressLabel+KAProgressLabel_DefaultObjectProperties.h"

@implementation KAProgressLabel (KAProgressLabel_DefaultObjectProperties)


/**
 Sets the default values for each KAProgressLabel and passes in the attributes that are
 not default values. This drasticaly reduces the code that needs to be written overall.

 @param label object that is returned to the caller once this method has been filled in.
 @param score this is the score of a questionnaire category; short term, attitude and longterm 
 time management results.
 @param endDegree this is the overall size of the bar. This will be the 100% value to calculate 
 the presentage of the user's score.
 @param colourTheme there are two parts to setting the colour with the chart. one is the background
 colour and the other is the forground (the progress). The theme takes one colour and offsets it by 0.30
 this allows for only one colour to be passed to it to reduce code.
 @return a KAProgressLabel to the caller.
 */
+(KAProgressLabel *)fillWithDefaultValues:(KAProgressLabel *)label categoryScore:(CGFloat)score
                                endDegree:(CGFloat)endDegree colourTheme:(NSDictionary *)colourTheme {
    
    // colour offset value
    CGFloat offset = 0.30;
    
    // set the start of the chat and the end of the chart to show progress
    label.startDegree = 2.0f;
    label.endDegree = endDegree;
    label.progress = (score / label.endDegree);
    
    // style of the charts, widths, thickness etc..
    label.trackWidth = 15.0f;
    label.progressWidth = 15.0f;
    label.roundedCornersWidth = 15.0f;
    label.trackWidth = 15.0f;
    label.progressWidth = 15.0f;
    label.roundedCornersWidth = 15.0f;
    label.backgroundColor = [UIColor clearColor];
    
    // sets the background colour of the chart
    label.fillColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    label.trackColor = [UIColor colorWithRed:[colourTheme[@"red"] floatValue]
                                       green:[colourTheme[@"green"] floatValue]
                                        blue:[colourTheme[@"blue"] floatValue]
                                       alpha:[colourTheme[@"alpha"] floatValue]];
    
    // sets the progress colour of the chart
    label.progressColor = [UIColor colorWithRed:[colourTheme[@"red"] floatValue] + offset
                                          green:[colourTheme[@"green"] floatValue] + offset
                                           blue:[colourTheme[@"blue"] floatValue] + offset
                                          alpha:[colourTheme[@"alpha"] floatValue]];
    
    // shows the precentage value to the user
    label.text = [NSString stringWithFormat:@"%.0f%%", (score * 100) / endDegree];
    
    // stops the labels from being moved around by the user
    label.isStartDegreeUserInteractive = NO;
    label.isEndDegreeUserInteractive = NO;
    
    return label;
}

@end
