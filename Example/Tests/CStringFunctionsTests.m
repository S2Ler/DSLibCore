//
//  CStringFunctionsTests.m
//  DSLibCore
//
//  Created by Alexander Belyavskiy on 5/14/16.
//  Copyright © 2016 Alexander Belyavskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
@import DSLibCore;

@interface CStringFunctionsTests : XCTestCase

@end

@implementation CStringFunctionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRemoveChars {
  char *emptyTest = removeChars("", "");
  XCTAssertTrue(strcmp(emptyTest, "") == 0);
  free(emptyTest);
  
  char *emptyTest2 = removeChars("a", "aaaaa");
  XCTAssertTrue(strcmp(emptyTest2, "") == 0);
  free(emptyTest2);
  
  char *normalTest1 = removeChars("ab", "aaabbaabbbccc");
  XCTAssertTrue(strcmp(normalTest1, "ccc") == 0);
  free(normalTest1);
}

@end
