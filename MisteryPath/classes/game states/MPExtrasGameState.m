//
//  MPExtrasGameState.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPExtrasGameState.h"
#import "MPMainMenuGameState.h"

@implementation MPExtrasGameState

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)update {
    //NSLog(@"Updating from Extras");
}

- (void)render {
    //NSLog(@"Rendering from Extras");
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
