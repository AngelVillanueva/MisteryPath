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
#import "MPGameOverGameState.h"
#import "MPWinLevelGameState.h"
#import "MPMovimiento.h"

@implementation MPGameGameState

- (void)update {
    // assigns gameManager instance
    gameManager = gameManager ? gameManager : [[UIApplication sharedApplication] delegate];
    
    // If new state initialize Game
    if (self.current_level == 0) {
        self.current_level = gameManager.current_level;
        self.isNewLevel = YES;
    }
    
    // If this is a new level we need to initialized it
    if (self.isNewLevel == YES) {
        self.isNewLevel = NO;
        // If there are no more levels to load then load the WinGame state: kudos, you Won the Game! (except if this is the first level, which is always loaded)
        if (self.current_level != 1 && self.current_level > MAXIMUM_LEVEL) {
            gameManager.current_level = INITIAL_LEVEL;
            [gameManager doStateChange:[MPWinGameState class]];
        } else {
        // Load new level
            self.level = [[MPLevel alloc] initWithLevel:self.current_level];
            self.isNewAnimation = YES;
            self.areButtonsAdded = NO;
            self.current_path = [[NSMutableArray alloc] initWithCapacity:self.level.movimientos.count];
            self.active_buttons = self.level.movimientos.count;
            self.isReadyToFinishLevel = YES;
            self.animation_key = @"0";
        }
    }
    
    // create animation movie if needed
    if (self.isNewAnimation == YES) {
        self.isReadyToFinishLevel = NO;
        self.animation_to_play = [[MPAnimation alloc] initWithPath:self.animation_key andLevel:self.current_level];
    }
    
    // if no active_buttons you win the level or the the game is over
    if (self.active_buttons == 0 && self.isReadyToFinishLevel == YES) {
        // GAME OVER if no active buttons and no winning path
        if (![self.current_path isEqualToArray:self.level.camino_misterioso]) {
            // go back to Level 1
            gameManager.current_level = INITIAL_LEVEL;
            [gameManager doStateChange:[MPGameOverGameState class]];
        } else {
            // if winning path then go to Next level
            gameManager.current_level++;
            [gameManager doStateChange:[MPWinLevelGameState class]];
        }
    }
    
    // add active buttons if not added yet
    if (self.areButtonsAdded == NO) {
        for (int i = 0; i < self.level.movimientos.count; i++) {
            // create button based on Level plist --> Movimiento plist
            NSString *movimientoKey = [ NSString stringWithFormat:@"%@", self.level.movimientos[i] ];
            CGFloat x = [self.level.posiciones[i][0] floatValue];
            CGFloat y = [self.level.posiciones[i][1] floatValue];
            UIButton *button = [MPMovimiento forKey:movimientoKey andXpos:x andYpos:y];
            // link button to action
            [ button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside ];
            // add button to View
            [self addSubview:button];
            // not draw the buttons again
            self.areButtonsAdded = YES;
        }
    }
    
}

- (void)render {
    // show Animation if required
    if (self.isNewAnimation == YES) {
        [self addSubview:self.animation_to_play.movie];
        self.isNewAnimation = NO;
        // remove stopImage from previous Animation
        [[self viewWithTag:999] removeFromSuperview];
        // start animation
        [self.animation_to_play.movie startAnimating];
        // callback to show a fix image at the end
        [NSTimer scheduledTimerWithTimeInterval:self.animation_to_play.movie.animationDuration target:self
                                       selector:@selector(animationDone:)
                                       userInfo:nil repeats:NO];
    }
}

- (void)animationDone:(NSTimer *)inTimer {
    [inTimer invalidate];
    inTimer = nil;
    // recover stopImage for a given animation
    UIImageView *stopImageView = [ [UIImageView alloc] initWithImage:self.animation_to_play.stopImage];
    stopImageView.frame = self.animation_to_play.movie.frame;
    // set tag to stopImage to pave the road for its future removal
    stopImageView.tag = 999;
    // add stopImage to view
    [self addSubview:stopImageView];
    // allow the level to finish if no active buttons left
    self.isReadyToFinishLevel = YES;
}

- (IBAction)buttonPressed:(id)sender {
    // substracts one from active_button to check if the game is over
    self.active_buttons--;
    // inactive already pressed button
    UIButton *thisButton = (UIButton *)sender;
    thisButton.enabled = NO;
    // add the button action to the current path, looking for the Camino Misterioso
    NSString *path = thisButton.titleLabel.text;
    [self.current_path addObject:path];
    // concatenate the button tag with the previous chain to build the animation key to select the right frames in plist
    self.animation_key = [ NSString stringWithFormat:@"%@%@", self.animation_key, [@(thisButton.tag)  stringValue]];
    // trigger new animation
    self.isNewAnimation = YES;
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
