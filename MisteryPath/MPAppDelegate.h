//
//  MPAppDelegate.h
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "MPGameStateManager.h"

@interface MPAppDelegate : MPGameStateManager <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;

- (void)gameLoop:(id)sender;

@end
