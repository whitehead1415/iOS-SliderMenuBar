//
//  SliderMenuBarTests.m
//  SliderMenu
//
//  Created by michael whitehead on 10/3/13.
//  Copyright (c) 2013 michael whitehead. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SliderMenuBar.h"
#import "SliderViewController.h"
#import <OCMock/OCMock.h>

@interface SliderMenuBarTests : XCTestCase {

    SliderViewController *view1;
    SliderViewController *view2;
    SliderMenuItem *item1;
    SliderMenuItem *item2;
}

@end

@implementation SliderMenuBarTests

- (void)setUp
{
    [super setUp];
    view1 = [[SliderViewController alloc] init];
    view2 = [[SliderViewController alloc] init];
    item1 = [[SliderMenuItem alloc] initWithImage:nil title:@"foo" color:nil];
    item2 = [[SliderMenuItem alloc] initWithImage:nil title:@"foo" color:nil];
    view1.sliderMenuItem = item1;
    view2.sliderMenuItem = item2;
}

- (void)tearDown
{
    view1 = nil;
    view2 = nil;
    item1 = nil;
    item2 = nil;
    [super tearDown];
}

- (void)testHasSameAmountOfSliderMenuItemsAsLengthOfViewControllerArray {
    NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:view1, view2, nil];
    SliderMenuBar *menuBar = [[SliderMenuBar alloc] initWithFrame:CGRectZero viewControllers: viewControllersArray];
    XCTAssertTrue(menuBar.sliderMenuItems.count == viewControllersArray.count, @"The sliderMenuItems array should be the same as the number of view controllers");
    
}

- (void)testSetsTheSliderMenuItemsArrayProperty {
    NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:view1, view2, nil];
    SliderMenuBar *menuBar = [[SliderMenuBar alloc] initWithFrame:CGRectZero viewControllers: viewControllersArray];
    XCTAssertTrue([menuBar.sliderMenuItems objectAtIndex:0] == item1, @"The sliderMenuItems array should contain the sliderMenuItem");
}

- (void)testCreatesASliderMenuItemIfViewControllerDoesNotHaveOne {
    NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:view1, nil];
    SliderMenuBar *menuBar = [[SliderMenuBar alloc] initWithFrame:CGRectZero viewControllers: viewControllersArray];
    XCTAssertNotNil(menuBar.sliderMenuItems, @"sliderMenuItems should be created even if view in array does not have an item");
}

- (void)testSetsTheFrameOfViewControllersSliderMenuItemWhenThereAreTwoItems {
    NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:view1,view2, nil];
    SliderMenuBar *menuBar = [[SliderMenuBar alloc] initWithFrame:CGRectMake(0, 0, 300, 60) viewControllers: viewControllersArray];
    XCTAssertEqual([[menuBar.sliderMenuItems objectAtIndex:0] frame], CGRectMake(0, 0, 300 * .75, 60), @"The item height should be the same as the menubar height");
    XCTAssertEqual([[menuBar.sliderMenuItems objectAtIndex:1] frame], CGRectMake(300 * .75, 0, 300 - (300 *.75), 60), @"The item height should be the same as the menubar height");
}

- (void)testItemBecomesSubViewOfMenuBar {
    NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:view1, nil];
    SliderMenuBar *menuBar = [[SliderMenuBar alloc] initWithFrame:CGRectZero viewControllers: viewControllersArray];
    XCTAssertTrue([menuBar.subviews containsObject:item1], @"The item height should be the same as the menubar height");
}

- (void)testInitSetsTheDelegateOfTheSliderMenuItem {
    id mockItem = [OCMockObject partialMockForObject:item1];
    [[mockItem expect] setDelegate:[OCMArg any]];
    NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:view1, nil];
    SliderMenuBar *menuBar = [[SliderMenuBar alloc] initWithFrame:CGRectZero viewControllers: viewControllersArray];
    [menuBar addSubview:nil];
    XCTAssertNoThrow([mockItem verify], @"Should set the delegate in initialization");
}

- (void)testInitSetsTheTagOfTheSliderMenuItem {
    NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:view1, view2, nil];
    SliderMenuBar *menuBar = [[SliderMenuBar alloc] initWithFrame:CGRectZero viewControllers: viewControllersArray];
    XCTAssertEqual([[menuBar.sliderMenuItems objectAtIndex:0] tag], 1, @"The first item should have tag of 1");
    XCTAssertEqual([[menuBar.sliderMenuItems objectAtIndex:1] tag], 2, @"The second item should have tag of 2");

}

@end
