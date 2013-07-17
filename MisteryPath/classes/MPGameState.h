//
//  MPGameState.h
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPGameStateManager.h"

@interface MPGameState : UIView {
    MPGameStateManager *gameManager;
}

- (id)initWithManager:(MPGameStateManager *)manager;
- (void)update;
- (void)render;

@end
