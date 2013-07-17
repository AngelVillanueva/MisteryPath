//
//  MPLevel.h
//  MisteryPath
//
//  Created by Angel Villanueva Pérez on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPLevel : NSObject

@property (strong, nonatomic) NSArray *movimientos;

- (id)initWithLevel:(int)level;

@end
