//
//  BinaryTreeTestsSwift.swift
//  DataStructuresTests
//
//  Created by Mithlesh Kumar Jha on 2/4/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

import XCTest
@testable import DataStructures

class BinaryTreeTestsSwift: XCTestCase {

    func testInvalidTree() {
        let binaryTree = BinaryTree(key: NSNull())
        XCTAssertTrue(binaryTree.preorderTraversal().isEmpty)
        binaryTree.insertKey("2")
        XCTAssertEqual(binaryTree.preorderTraversal() as? [String], ["2"])

        let binaryTree2 = BinaryTree(keys: [])
        XCTAssertTrue(binaryTree2.preorderTraversal().isEmpty)
    }

    func testRandom() {
        let arr: [Any] = ["37", "34", "100", NSNull(), "-100"]
        let binaryTree = BinaryTree(keys: arr)
        let preorderArray = binaryTree.preorderTraversal() as? [String]
        let expectedArray = ["37", "34", "-100", "100"]
        XCTAssertEqual(preorderArray, expectedArray)
    }

    func testLarge() {
        let arr: [Any] = ["37", "-34", "-48", NSNull(), "-100", "-100", "48", NSNull(), NSNull(), NSNull(), NSNull(), "-54", NSNull(), "-71", "-22", NSNull(), NSNull(), NSNull(), "8"]
        let binaryTree = BinaryTree(keys: arr)
        let preorderArray = binaryTree.preorderTraversal() as? [String]
        let expectedArray = ["37","-34","-100","-48","-100","48","-54","-71","-22","8"]
        XCTAssertEqual(preorderArray, expectedArray)

        let inorderArray = binaryTree.inorderTraversal() as? [String]
        let expectedInorderArray = ["-34","-100","37","-100","-48","-71","-54","-22","8","48"]
        XCTAssertEqual(inorderArray, expectedInorderArray)

        let postOrderArray = binaryTree.postorderTraversal() as? [String]
        let expectedPostorderArray = ["-100","-34","-100","-71","8","-22","-54","48","-48","37"]
        XCTAssertEqual(postOrderArray, expectedPostorderArray)
    }

    func testRecursive() {
        let arr: [Any] = ["37", "-34", "-48", NSNull(), "-100", "-100", "48", NSNull(), NSNull(), NSNull(), NSNull(), "-54", NSNull(), "-71", "-22", NSNull(), NSNull(), NSNull(), "8"]
        let binaryTree = BinaryTree(keys: arr)
        let preorderArray = binaryTree.preorderTraversal(method: .iterative) as? [String]
        let expectedArray = ["37","-34","-100","-48","-100","48","-54","-71","-22","8"]
        XCTAssertEqual(preorderArray, expectedArray)
    }


}
