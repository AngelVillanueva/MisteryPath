//
//  MPWinLevelGameState.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPWinLevelGameState.h"
#import "MPGameGameState.h"

@implementation MPWinLevelGameState

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)goNextLevel:(id)sender {
    gameManager = gameManager ? gameManager : [[UIApplication sharedApplication] delegate];
    [gameManager doStateChange:[MPGameGameState class]];
}
@end
