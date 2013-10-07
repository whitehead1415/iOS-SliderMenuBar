//
//  SliderMenuItemTests.m
//  SliderMenu
//
//  Created by michael whitehead on 10/3/13.
//  Copyright (c) 2013 michael whitehead. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SliderMenuItem.h"
#import <OCMock/OCMock.h>

@interface SliderMenuItemTests : XCTestCase

@end

@implementation SliderMenuItemTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInitWithImageAndTitleReturnsSliderMenuItem {
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:nil title:nil color:nil];
    XCTAssertTrue([item isKindOfClass:[SliderMenuItem class]], @"Should return an instance of SliderMenu");
}

- (void)testInitWithImageAndTitleAndFrame {
    UIImage *image = [UIImage imageNamed:@"arrow_right.png"];
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:image title:@"foobar" color:[UIColor redColor]];
    XCTAssertEqualObjects([item backgroundImageForState:UIControlStateNormal], image, @"The image property should be set");
    XCTAssertEqualObjects([item titleForState:UIControlStateNormal], @"foobar", @"The tag property should be set");
    XCTAssertEqualObjects(item.backgroundColor, [UIColor redColor], @"The background color property should be set");
}

- (void)testInitAddsMethodToItemTouchUpInsideEvent {
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:nil title:nil color:nil];
    NSArray *buttonActions = [item actionsForTarget:NULL forControlEvent:UIControlEventTouchUpInside];
    XCTAssertTrue([buttonActions containsObject:@"sliderMenuItemWasTouched:"], @"The sliderMenuItemWasTouched should be connected to the button");
}

@end
