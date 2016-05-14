//
//  DSCFunctionsTests.m
//  DSLibCore
//
//  Created by Alexander Belyavskiy on 5/14/16.
//  Copyright © 2016 Alexander Belyavskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
@import DSLibCore;

@interface DSCFunctionsTests : XCTestCase

@end

@implementation DSCFunctionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParamsInSelector {
  XCTAssertEqual(DSNumberOfParamsInSelector(@selector(testParamsInSelector)), 0);
  XCTAssertEqual(DSNumberOfParamsInSelector(@selector(exampleSelectorWithOneParams:)), 1);
  XCTAssertEqual(DSNumberOfParamsInSelector(@selector(exampleSelectorWithThreeParams:param2:param3:)), 3);
}

@end
