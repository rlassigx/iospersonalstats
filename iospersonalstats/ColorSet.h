/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import <UIKit/UIKit.h>

@interface ColorSet : NSObject

@property (strong) UIColor* backgroundColor;
@property (strong) UIColor* selectedBackgroundColor;
@property (strong) UIColor* buttonColor;
@property (strong) UIColor* iconColor;
@property (strong) UIColor* textColor;
@property (strong) UIColor* selectedIconColor;
@property (strong) UIColor* selectedTextColor;

@end
