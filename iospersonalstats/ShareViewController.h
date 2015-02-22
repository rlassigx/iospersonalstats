/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController

@property (strong) UIFont* buttonFont;
@property (strong) UIColor* backgroundColor;
@property (strong) UILabel* contextLabel;
@property (strong) UIButton* cancelButton;
@property (strong) UIButton* doneButton;

@end
