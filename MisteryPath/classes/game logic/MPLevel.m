//
//  MPLevel.m
//  MisteryPath
//
//  Created by Angel Villanueva Pérez on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPLevel.h"
#import "NSMutableArray_Shuffling.h"

@implementation MPLevel

- (id)initWithLevel:(int)level {
    if (self = [super init]) {
        // Load the file content and read the data into arrays
        NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Levels" ofType:@"plist"]];
        NSString *levelKey = [NSString stringWithFormat:@"%d", level];
        NSDictionary *levelDictionary = [mainDictionary objectForKey:levelKey];
        
        self.movimientos = [levelDictionary objectForKey:@"movimientos"];
        self.camino_misterioso = [levelDictionary objectForKey:@"camino_misterioso"];
        // random assignment of button position on canvas
        NSMutableArray *posArray = [[NSMutableArray alloc] initWithArray:[levelDictionary objectForKey:@"posiciones"]];
        [posArray shuffle];
        self.posiciones = [[NSMutableArray alloc] initWithArray:posArray];
    }
    return self;
}

@end
