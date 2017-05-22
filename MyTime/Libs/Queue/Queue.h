//
//  Queue.h
//  MyTime
//
//  Created by DanDaMan on 22/5/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject
@property (strong) NSMutableArray *data;

-(void)enqueue:(id)anObject;
-(id)dequeue;
-(id)peek;

@end
