//
//  MPMainMenuGameState.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPMainMenuGameState.h"
#import "MPExtrasGameState.h"
#import "MPGameGameState.h"

@implementation MPMainMenuGameState

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)update {
    //NSLog(@"Updating from Main Menu");
}

- (void)render {
   // NSLog(@"Rendering from Main Menu with %@", [[UIApplication sharedApplication] delegate]);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)goExtras:(id)sender {
    gameManager = [[UIApplication sharedApplication] delegate];
    [gameManager doStateChange:[MPExtrasGameState class]];
}

- (IBAction)goGame:(id)sender {
    gameManager = [[UIApplication sharedApplication] delegate];
    [gameManager doStateChange:[MPGameGameState class]];
}
@end
