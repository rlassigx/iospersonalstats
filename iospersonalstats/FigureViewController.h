/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

#import "OpengLView.h"
#import "UIExtendedViewController.h"

@interface FigureViewController : UIExtendedViewController

@property (strong) UILabel* contextLabel;
@property (atomic) OpenGLView* glView;
@property (strong) UIButton* backButton;
@property (strong) UIButton* menuButton;
@property (nonatomic) SEL selectAction;
@property (nonatomic,assign) id selectTarget;
@property (nonatomic,assign) id changeViewTarget;
@property (nonatomic) SEL bodySelectionAction;
@property (nonatomic) SEL tabularSelectionAction;
@property (nonatomic) SEL graphSelectionAction;

@end
