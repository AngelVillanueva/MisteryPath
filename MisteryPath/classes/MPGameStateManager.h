//
//  MPGameStateManager.h
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 16/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPGameStateManager : NSObject

@property NSInteger current_level;

- (void)doStateChange:(Class)state;

@end
