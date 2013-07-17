//
//  MPMainMenuGameState.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPMainMenuGameState.h"
#import "MPExtrasGameState.h"

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
    NSLog(@"Updating");
}

- (void)render {
    NSLog(@"Rendering");
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
    
    NSLog(@"click");
    [gameManager doStateChange:[MPExtrasGameState class]];
}

@end
