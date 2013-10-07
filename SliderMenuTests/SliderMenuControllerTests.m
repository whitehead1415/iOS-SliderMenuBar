//
//  SliderMenuControllerTests.m
//  SliderMenu
//
//  Created by michael whitehead on 10/6/13.
//  Copyright (c) 2013 michael whitehead. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SliderMenuController.h"
#import "SliderViewController.h"
#import "SliderMenuItem.h"
#import <OCMock/OCMock.h>

@interface SliderMenuControllerTests : XCTestCase {
    NSArray *sliderViewControllers;
    SliderMenuController *controller;
    SliderMenuItem *item1;
    SliderMenuItem *item2;
    SliderViewController *view1;
    SliderViewController *view2;

}

@end

@interface UIDevice (MethodsThatAppleWillHitMeWithTheBanStickForUsing)
-(void)setOrientation:(UIInterfaceOrientation)orientation animated:(BOOL)animated;
-(void)setOrientation:(UIInterfaceOrientation)orientation;

@end

@implementation SliderMenuControllerTests

- (void)setUp {
    item1 = [[SliderMenuItem alloc] initWithImage:nil title:nil color:nil];
    item2 = [[SliderMenuItem alloc] initWithImage:nil title:nil color:nil];
    view1 = [[SliderViewController alloc] init];
    view2 = [[SliderViewController alloc] init];
    view1.sliderMenuItem = item1;
    view2.sliderMenuItem = item2;
    sliderViewControllers = [[NSArray alloc] initWithObjects:view1, view2, nil];
    
    controller = [[SliderMenuController alloc] initWithSliderViewControllers:sliderViewControllers];

    [super setUp];
}

- (void)tearDown {
    controller = nil;
    sliderViewControllers = nil;
    [super tearDown];
}

- (void)testInitReturnsASliderMenuControllerInstance {
    XCTAssertTrue([controller isKindOfClass:[SliderMenuController class]], @"Should be instance of SliderMenuController");
}

- (void)testInitAddsMenuBarInstanceAsSubView {
    id subview = [[controller.view subviews] objectAtIndex:0];
    XCTAssertTrue([subview isKindOfClass:[SliderMenuBar class]], @"Should call addSubview Method");
}

- (void)testSliderMenuBarHasCorrectDimmensions {
    SliderMenuBar *subview = [[controller.view subviews] objectAtIndex:0];
    XCTAssertEqual(subview.frame.size.width, controller.view.frame.size.width, @"Width should be the same as  containing view");
    XCTAssertEqual(subview.frame.size.height, (CGFloat)80, @"Height should be 80");
}

- (void)testInitSetsFirstSliderViewControllerAsSubView {
    XCTAssertTrue([[controller.view subviews] containsObject:view1.view], @"First SliderView in the sliderViews array should be set as a subview");
}

- (void)testsliderMenuItemWasTouchedCangesViewControllerToCorospondingItem {
    SliderMenuBar *subview = [[controller.view subviews] objectAtIndex:0];
    [[subview.sliderMenuItems objectAtIndex:1] sendActionsForControlEvents:UIControlEventTouchUpInside];
    XCTAssertTrue([[controller.view subviews] containsObject:view2.view], @"Second SliderView in the sliderViews array should be set as a subview");
}

- (void)testSliderMenuBarItemsResizesOnOrientationChange {
    SliderMenuBar *menuBar = [[controller.view subviews] objectAtIndex:0];
    menuBar.frame = CGRectMake(0, 0, 100, 80);
    [controller didRotateFromInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
    XCTAssertEqual([[menuBar.subviews objectAtIndex:0] frame], CGRectMake(0, 0, 75, 80), @"item should be half the size after changing orientation");
    XCTAssertEqual([[menuBar.subviews objectAtIndex:1] frame], CGRectMake(75, 0, 25, 80), @"item should be half the size after changing orientation");

}

@end
