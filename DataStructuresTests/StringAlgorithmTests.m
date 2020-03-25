//
//  StringAlgorithmTests.m
//  DataStructuresTests
//
//  Created by Mithlesh Kumar Jha on 2/9/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Strings.h"

@interface StringAlgorithmTests : XCTestCase

@end

@implementation StringAlgorithmTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testLicenseKeyFormatting {
    NSString *result = [Strings formattedLicenseKey:@"2-5g-3-J" subsequentFragmentLength:2 insertingCharacter:'-'];
    XCTAssertEqualObjects(result, @"2-5G-3J");
    result = [Strings formattedLicenseKey:@"5F3Z-2e-9-w" subsequentFragmentLength:4 insertingCharacter:'-'];
    XCTAssertEqualObjects(result, @"5F3Z-2E9W");
    result = [Strings formattedLicenseKey:@"---" subsequentFragmentLength:2 insertingCharacter:'-'];
    XCTAssertEqualObjects(result, @"");
}

@end
