//
//  MPAnimation.m
//  MisteryPath
//
//  Created by Angel Villanueva Pérez on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPAnimation.h"

@implementation MPAnimation

- (id)initWithPath:(NSString *)path andLevel:(int)level {
    if (self = [super init]) {
        NSLog(@"p %@ and l %d", path, level);
        // read animacion properties from Levels plist
        NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Levels" ofType:@"plist"]];
        NSString *levelKey = [NSString stringWithFormat:@"%d", level];
        NSDictionary *levelDictionary = [mainDictionary objectForKey:levelKey];
        NSDictionary *animacionDictionary = [levelDictionary objectForKey:@"animacion"];
        // assign position and measures
        CGFloat x = [[animacionDictionary objectForKey:@"xPos"] floatValue];
        CGFloat y = [[animacionDictionary objectForKey:@"yPos"] floatValue];
        CGFloat w = [[animacionDictionary objectForKey:@"width"] floatValue];
        CGFloat h = [[animacionDictionary objectForKey:@"height"] floatValue];
        self.movie = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        // assign images and duration
        self.movie.animationImages = [self findMovieFromPath:path andLevel:level];
        self.stopImage = [self.movie.animationImages objectAtIndex:0];
        self.movie.animationDuration = self.movie.animationImages.count / (double)30;
        self.movie.animationRepeatCount = 1;
    }
    return self;
}

- (NSMutableArray *)findMovieFromPath:(NSString *)animation_key andLevel:(NSInteger)level {
    // select the right Level and animation path from Animaciones plist
    NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Animaciones" ofType:@"plist"]];
    NSString *levelKey = [NSString stringWithFormat:@"Level %d", level];
    NSDictionary *animacionDictionary = [mainDictionary objectForKey:levelKey];
    // Load images
    NSArray *imageNames = [animacionDictionary objectForKey:animation_key];
    // if there is no specific animation for that path then read the images for the default animation
    if (!imageNames || !imageNames.count) {
        imageNames = [animacionDictionary objectForKey:@"default"];
    }
    // build the images array for the animation
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    return images;
}

@end
