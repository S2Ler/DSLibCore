//
//  DSDataDetectorTests.m
//  DSLibCore
//
//  Created by Alexander Belyavskiy on 5/14/16.
//  Copyright © 2016 Alexander Belyavskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
@import DSLibCore;

@interface DSDataDetectorTests : XCTestCase

@end

@implementation DSDataDetectorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmptyURLs {
  XCTAssertNil([DSDataDetector urlFromString:@""]);
  XCTAssertNil([DSDataDetector urlFromString:@"asdf"]);
  XCTAssertNil([DSDataDetector urlFromString:@"http:/"]);
  XCTAssertNil([DSDataDetector urlsFromString:@""]);
  XCTAssertNil([DSDataDetector urlsFromString:@"asdf"]);
  XCTAssertNil([DSDataDetector urlsFromString:@"http:/"]);
}

- (void)testWithURLs {
  XCTAssertTrue([[DSDataDetector urlFromString:@"http://www.google.by"] isEqualToString:@"http://www.google.by"]);
  XCTAssertTrue([[DSDataDetector urlFromString:@"https://www.google.by"] isEqualToString:@"https://www.google.by"]);
  XCTAssertTrue([[DSDataDetector urlFromString:@"https://www.google.by https://www.google.com"] isEqualToString:@"https://www.google.by"]);
  NSArray<NSURL*> *urls = [DSDataDetector urlsFromString:@"https://www.google.by https://www.google.com"];
  XCTAssertEqual(urls.count, 2);
  XCTAssertTrue([urls[0].absoluteString isEqualToString:[NSURL URLWithString:@"https://www.google.by"].absoluteString]);
  XCTAssertTrue([urls[1].absoluteString isEqualToString:[NSURL URLWithString:@"https://www.google.com"].absoluteString]);
}

@end
