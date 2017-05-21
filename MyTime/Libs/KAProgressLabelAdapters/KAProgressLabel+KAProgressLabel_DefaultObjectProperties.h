//
//  KAProgressLabel+KAProgressLabel_DefaultObjectProperties.h
//  MyTime
//
//  Created by DanDaMan on 27/4/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//
//  This is an adapter pattern class (or catagory). I created this class because while the KAProgressLabel class is pretty good
//  I needed to set a lot of properties for it to look and behave the way I wanted it to do and caused a lot of repetertive code.
//  Extending the KAProgressLabel I added an additional method that would allow me to set
//
//

#import "KAProgressLabel.h"

@interface KAProgressLabel (KAProgressLabel_DefaultObjectProperties)

+(KAProgressLabel *)fillWithDefaultValues:(KAProgressLabel *)label
                            categoryScore:(CGFloat)score
                                endDegree:(CGFloat)endDegree
                              colourTheme:(NSDictionary *)colourTheme;

@end
