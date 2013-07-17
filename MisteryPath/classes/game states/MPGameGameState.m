//
//  MPGameGameState.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPGameGameState.h"
#import "MPMainMenuGameState.h"

@implementation MPGameGameState

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)update {
    //NSLog(@"Updating from Game");
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
