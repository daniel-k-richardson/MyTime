//
//  AppDelegate.h
//  MyTime
//
//  Created by Daniel Richardson on 14/4/17.
//  Copyright © 2017 Daniel Richardson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MMDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) MMDrawerController *DrawerController;

- (void)saveContext;


@end
