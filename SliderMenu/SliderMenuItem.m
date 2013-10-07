//
//  SliderMenuItem.m
//  SliderMenu
//
//  Created by michael whitehead on 10/3/13.
//  Copyright (c) 2013 michael whitehead. All rights reserved.
//

#import "SliderMenuItem.h"
#import "SliderMenuItemDelegate.h"

@implementation SliderMenuItem

@synthesize delegate;

- (id)initWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color {

    self = [super init];
    if (self) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
        [self setBackgroundColor:color];
        [self addTarget:delegate action:@selector(sliderMenuItemWasTouched:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}

@end
