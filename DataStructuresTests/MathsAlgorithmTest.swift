//
//  MathsAlgorithmTest.swift
//  DataStructuresTests
//
//  Created by Mithlesh Kumar Jha on 4/2/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import XCTest
@testable import DataStructures

class MathsAlgorithmTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBitsRepresentation() {
        XCTAssertEqual(3.bitsRepresentation, "0000000000000000000000000000000000000000000000000000000000000011")
    }
}
