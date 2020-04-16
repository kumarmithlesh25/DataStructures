//
//  StringAlgorithmTests.swift
//  DataStructuresTests
//
//  Created by Mithlesh Kumar Jha on 2/6/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

import XCTest
@testable import DataStructures

class StringAlgorithmTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testLicenseKeyFormatting() {
       var result = StringAlgorithm.licenseKeyFormatting("2-5g-3-J", 2)
       XCTAssertEqual(result, "2-5G-3J")

        result = StringAlgorithm.licenseKeyFormatting("5F3Z-2e-9-w", 4)
        XCTAssertEqual(result, "5F3Z-2E9W")
        result = StringAlgorithm.licenseKeyFormatting("---", 3)
        XCTAssertEqual(result, "")
    }

    func testLongestSubstringWithDistinctCharacters() {
        var string = "AAAHHIBC"
        XCTAssertEqual(string.longestSubstringWithDistinctCharacters(2), "AAAHH")

        string = "aabbccdd"
        XCTAssertEqual(string.longestSubstringWithDistinctCharacters(2), "aabb")
        XCTAssertEqual(string.longestSubstringWithDistinctCharacters(4), "aabbccdd")
        XCTAssertNil(string.longestSubstringWithDistinctCharacters(5))

        XCTAssertNil("".longestSubstringWithDistinctCharacters(2))

        string = "ccédu 🌍"
        XCTAssertEqual(string.longestSubstringWithDistinctCharacters(3), "ccéd")
    }

    func testRemoveInvalidParenthesis() {
        let input = "()())()"
        XCTAssert(input.removeInvalidParenthesis().count == 2)
    }
}
