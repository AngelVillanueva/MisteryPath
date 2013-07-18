//
//  MPGameState.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPGameState.h"
#import "MPMainMenuGameState.h"

@implementation MPGameState

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)update {
    // to be overriden in each state
}

- (void)render {
    // to be overriden in each state
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    NSUInteger numTaps = [touch tapCount];
    // todo: implement touch code
    if (numTaps > 1) {
        gameManager = gameManager ? gameManager : [[UIApplication sharedApplication] delegate];
        [gameManager doStateChange:[MPMainMenuGameState class]];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
