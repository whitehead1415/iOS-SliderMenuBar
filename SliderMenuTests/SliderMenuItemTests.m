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
#import "UIImage+ColorImage.h"

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
    XCTAssertEqualObjects(item.image, image, @"The image property should be set");
    XCTAssertEqualObjects([item titleForState:UIControlStateSelected], @"foobar", @"The tag property should be set");
    XCTAssertEqualObjects(item.backgroundColor, [UIColor redColor], @"The background color property should be set");
}

- (void)testInitAddsMethodToItemTouchUpInsideEvent {
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:nil title:nil color:nil];
    NSArray *buttonActions = [item actionsForTarget:NULL forControlEvent:UIControlEventTouchUpInside];
    XCTAssertTrue([buttonActions containsObject:@"sliderMenuItemWasTouched:"], @"The sliderMenuItemWasTouched should be connected to the button");
}

- (void)testIfImageIsNilThenTextIsSetForUIControlStateNormal {
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:nil title:@"foobar" color:[UIColor redColor]];
    XCTAssertEqualObjects([item titleForState:UIControlStateNormal], @"foobar", @"Should be default when image is not set");
}

- (void)testIfImageIsNotNilThenTextIsSetForUIControlStateSelected {
    UIImage *image = [UIImage imageNamed:@"arrow_right.png"];
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:image title:@"foobar" color:[UIColor redColor]];
    XCTAssertEqualObjects([item titleForState:UIControlStateSelected], @"foobar", @"Should not be default when image is set");
}

- (void)testIfImageIsNotNilThenImageIsSetForUiControlStateNormal {
    UIImage *image = [UIImage imageNamed:@"arrow_right.png"];
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:image title:@"foobar" color:[UIColor redColor]];
    XCTAssertEqualObjects(item.image, image, @"Should be default when image is set");
}

- (void)testIfImageIsSetThenTextAlphaGoesToZeroWhenSelected {
    UIImage *image = [UIImage imageNamed:@"arrow_right.png"];
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:image title:@"foobar" color:[UIColor redColor]];
    [item setSelected:YES];
    XCTAssertEqual(item.titleLabel.alpha, 1.0f, @"Should be at zero when the image is present");
}

- (void)testIfImageIsNotSetThenTextAlphaGoesToOneWhenUnSelected {
    UIImage *image = [UIImage imageNamed:@"arrow_right.png"];
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:image title:@"foobar" color:[UIColor redColor]];
    [item setSelected:YES];
    XCTAssertEqual(item.titleLabel.alpha, 1.0f, @"Should be at zero when the image is present");
    [item setSelected:NO];
    XCTAssertEqual(item.titleLabel.alpha, 0.0f, @"should be visible when not selected and image is present");
}

- (void)testSetSelectedSetsItemAsSelected {
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:nil title:@"foobar" color:[UIColor redColor]];
    [item setSelected:YES];
    XCTAssertTrue(item.isSelected, @"Should be selected");
}

- (void)testSetSelectedSetsItemAsUnSelected {
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:nil title:@"foobar" color:[UIColor redColor]];
    [item setSelected:YES];
    [item setSelected:NO];
    XCTAssertFalse(item.isSelected, @"Should not be selected");
}

- (void)testTitleReapearsWhenSelectedWhenImageIsNil {
    SliderMenuItem *item = [[SliderMenuItem alloc] initWithImage:nil title:@"foobar" color:[UIColor redColor]];
    [item setSelected:NO];
    XCTAssertEqual(item.titleLabel.alpha, 1.0f, @"Should be at zero when the image is present");
}

@end
