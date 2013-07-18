//
//  MPMovimiento.m
//  MisteryPath
//
//  Created by Angel Villanueva Admin on 17/07/13.
//  Copyright (c) 2013 Sinapse Consulting SL. All rights reserved.
//

#import "MPMovimiento.h"

@implementation MPMovimiento

+ (UIButton *) forKey:(NSString *)key andXpos:(CGFloat)x andYpos:(CGFloat)y {
    
    NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Movimientos" ofType:@"plist"]];
    NSString *movimientoKey = [NSString stringWithFormat:@"%@", key];
    NSDictionary *movimientoDictionary = [mainDictionary objectForKey:movimientoKey];
    
    NSString *title = [movimientoDictionary objectForKey:@"title"];
    //CGFloat x = [[movimientoDictionary objectForKey:@"posX"] floatValue];
    //CGFloat y = [[movimientoDictionary objectForKey:@"posY"] floatValue];
    CGFloat w = [[movimientoDictionary objectForKey:@"width"] floatValue];
    CGFloat h = [[movimientoDictionary objectForKey:@"height"] floatValue];
    NSInteger tag = [[movimientoDictionary objectForKey:@"tag"] integerValue];
    UIImage *image = [UIImage imageNamed:[movimientoDictionary objectForKey:@"image"]];
    
    UIButton *new_button = [UIButton buttonWithType:(UIButtonType) UIButtonTypeCustom];
    [new_button setTitle:title forState:UIControlStateNormal];
    new_button.frame = CGRectMake(x, y, w, h);
    new_button.tag = tag;
    [new_button setImage:image forState:UIControlStateNormal];
    
    return new_button;
    
}

@end
