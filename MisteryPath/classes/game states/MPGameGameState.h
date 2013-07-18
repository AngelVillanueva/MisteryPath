//
//  MPGameGameState.h
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPGameState.h"
#include "MPLevel.h"
#include "MPAnimation.h"

@interface MPGameGameState : MPGameState

@property NSInteger current_level;
@property NSInteger active_buttons;
@property BOOL isNewLevel;
@property BOOL isNewAnimation;
@property BOOL areButtonsAdded;
@property BOOL isReadyToFinishLevel;
@property MPLevel *level;
@property MPAnimation *animation_to_play;
@property NSMutableArray *current_path;
@property NSString *animation_key;

- (void)animationDone:(NSTimer *)inTimer;
- (IBAction)buttonPressed:(id)sender;

- (IBAction)goMenu:(id)sender;

@end
