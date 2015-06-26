//
//  NSArrayExtensionsSpec.m
//  DSLibCore
//
//  Created by Alexander Belyavskiy on 6/26/15.
//  Copyright (c) 2015 Alexander Belyavskiy. All rights reserved.
//

#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

#import <DSLibCore/NSArray+ObjectsQuery.h>

SpecBegin(NSArrayExtensions)
describe(@"ObjectsQueary", ^{
  describe(@"objectsFromIndex:count:", ^{
    it(@"should check for valid inputs", ^{
      NSArray *oneObjectArray = @[@"one"];
      expect([oneObjectArray objectsFromIndex:1 count:1]).to.beNil();
      expect([oneObjectArray objectsFromIndex:0 count:2]).to.beNil();
      expect([oneObjectArray objectsFromIndex:0 count:1]).notTo.beNil();
      expect([oneObjectArray objectsFromIndex:-1 count:1]).to.beNil();
      expect([oneObjectArray objectsFromIndex:-1 count:2]).to.beNil();
      expect([oneObjectArray objectsFromIndex:-1 count:3]).to.beNil();
    });
  });
});
SpecEnd
