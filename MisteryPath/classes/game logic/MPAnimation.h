//
//  MPAnimation.h
//  MisteryPath
//
//  Created by Angel Villanueva Pérez on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPAnimation : NSObject

@property UIImageView *movie;
@property UIImage *stopImage;

- (id)initWithPath:(NSString *)path andLevel:(int)level;
- (NSMutableArray *)findMovieFromPath:(NSString *)animation_key andLevel:(NSInteger)level;

@end
