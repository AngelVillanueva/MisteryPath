//
//  MPGameGameState.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPGameGameState.h"
#import "MPMainMenuGameState.h"
#import "MPWinGameState.h"

@implementation MPGameGameState

- (void)update {
    // assigns gameManager instance
    gameManager = gameManager ? gameManager : [[UIApplication sharedApplication] delegate];
    // If new game initialize Game
    if (self.current_level == 0) {
        self.current_level = INITIAL_LEVEL;
        self.maximum_level = MAXIMUM_LEVEL;
        self.isNewLevel = YES;
        //NSLog(@"Game init with level %d de %d (es nuevo %c)", self.current_level, self.maximum_level, self.isNewLevel);
    }
    
    // If this is a new level we need to initialized it
    if (self.isNewLevel == YES) {
        self.isNewLevel = NO;
        // If there are no more levels to load then load the WinGame state: kudos, you Won the Game! (except if this is the first level, which is always loaded)
        if (self.current_level != 1 && self.current_level > self.maximum_level) {
            [gameManager doStateChange:[MPWinGameState class]];
        } else {
        // Load new level
            self.level = [[MPLevel alloc] initWithLevel:self.current_level];
            self.isNewAnimation = YES;
            self.areButtonsAdded = NO;
            self.current_path = [[NSMutableArray alloc] initWithCapacity:self.level.movimientos.count];
            self.active_buttons = self.level.movimientos.count;
            self.isReadyToFinish = YES;
            self.animation_key = @"0";
        }
    }
    
}

- (void)render {
    //NSLog(@"Rendering from Game");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)goMenu:(id)sender {
    gameManager = [[UIApplication sharedApplication] delegate];
    [gameManager doStateChange:[MPMainMenuGameState class]];
}
@end
