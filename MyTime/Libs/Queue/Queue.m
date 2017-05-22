//
//  Queue.m
//  MyTime
//
//  Created by DanDaMan on 22/5/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import "Queue.h"

@implementation Queue

-(instancetype)init{
    if (self = [super init]){
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)enqueue:(id)addObject{
    [self.data addObject:addObject];
}

-(id)dequeue{
    id head = [self.data objectAtIndex:0];
    
    if (head != nil) {
        [self.data removeObjectAtIndex:0];
    }
    return head;
}

@end
