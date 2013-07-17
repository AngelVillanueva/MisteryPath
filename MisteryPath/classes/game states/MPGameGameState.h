//
//  MPGameGameState.h
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPGameState.h"
#import "MPLevel.h"

@interface MPGameGameState : MPGameState

@property NSInteger maximum_level;
@property NSInteger current_level;
@property NSInteger active_buttons;
@property BOOL isNewLevel;
@property BOOL isNewAnimation;
@property BOOL areButtonsAdded;
@property BOOL isReadyToFinish;
@property MPLevel *level;
@property NSMutableArray *current_path;
@property NSString *animation_key;

- (IBAction)goMenu:(id)sender;

@end
