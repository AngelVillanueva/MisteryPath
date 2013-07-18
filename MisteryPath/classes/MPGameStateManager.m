//
//  MPGameStateManager.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPGameStateManager.h"

@implementation MPGameStateManager

- (id)init {
    self.current_level = INITIAL_LEVEL;
    return self;
}

- (void)doStateChange:(Class)state {
    // to be overriden in AppDelegate
}

@end
