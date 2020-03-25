//
//  SinglyLinkedListTests.swift
//  DataStructuresTests
//
//  Created by Mithlesh Kumar Jha on 3/8/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import XCTest
@testable import DataStructures

class SinglyLinkedListTests: XCTestCase {

    func createListWithArray<T>(array: [T]) -> SinglyLinkedList<T> {
        let list = SinglyLinkedList<T>()
        array.forEach { element in
            list.appendElement(element)
        }
        return list
    }

    func testConvertListToArray() {
        // Empty Array

        let emptyArray = [Int]()
        var list = createListWithArray(array: emptyArray)
        var resultArray = list.toArray()
        XCTAssertEqual(emptyArray, resultArray)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
        XCTAssertTrue(list.count == 0)
        print(list)


        // List with 1 node
        let singleValueArray = [10]
        list = createListWithArray(array: singleValueArray)
        resultArray = list.toArray()
        XCTAssertEqual(singleValueArray, resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head === list.tail)
        XCTAssertTrue(list.count == 1)
        print(list)


        // List with multiple nodes
        let multipleValuesArray = [10, 20, 30, 40]
        list = createListWithArray(array: multipleValuesArray)
        resultArray = list.toArray()
        XCTAssertEqual(multipleValuesArray, resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 4)
        print(list)
    }

    func testAppendElement() {
        // Start with empty Array
        let emptyArray = [Int]()
        let list = createListWithArray(array: emptyArray)
        var resultArray = list.toArray()
        XCTAssertEqual(emptyArray, resultArray)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
        XCTAssertTrue(list.count == 0)
        print(list)

        // Now append an element to the list
        list.appendElement(100)

        resultArray = list.toArray()
        XCTAssertEqual([100], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head === list.tail)
        XCTAssertTrue(list.count == 1)
        print(list)

        // Now append another element
        list.appendElement(200)
        resultArray = list.toArray()
        XCTAssertEqual([100, 200], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 2)
        XCTAssertEqual(list.head?.element, 100)
        XCTAssertEqual(list.tail?.element, 200)
        print(list)
    }

    func testAddNodeToHead() {
        // Start with empty Array
        let inputArray = [Int]()
        let list = createListWithArray(array: inputArray)

        let node = SingleListNode<Int>(element: 11)
        list.addToHead(node)

        var resultArray = list.toArray()
        XCTAssertEqual([11], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head === list.tail)
        XCTAssertTrue(list.count == 1)
        print(list)

        let secondNode = SingleListNode<Int>(element: 12)
        list.addToHead(secondNode)

        resultArray = list.toArray()
        XCTAssertEqual([12, 11], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 2)
        XCTAssertEqual(list.head?.element, 12)
        XCTAssertEqual(list.tail?.element, 11)
        print(list)
    }

    func testAddNodeToTail() {
        // Start with empty Array
        let inputArray = [Int]()
        let list = createListWithArray(array: inputArray)

        let node = SingleListNode<Int>(element: 11)
        list.addToTail(node)

        var resultArray = list.toArray()
        XCTAssertEqual([11], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head === list.tail)
        XCTAssertTrue(list.count == 1)
        print(list)

        let secondNode = SingleListNode<Int>(element: 12)
        list.addToTail(secondNode)

        resultArray = list.toArray()
        XCTAssertEqual([11, 12], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 2)
        XCTAssertEqual(list.head?.element, 11)
        XCTAssertEqual(list.tail?.element, 12)
        print(list)
    }

    func testAddListToHead() {
        // Start with empty List
        let firstList = createListWithArray(array: [Int]())
        let secondList = createListWithArray(array: [Int]())

        // Add empty list to the firstList. Nothing should change and the list should still be empty
        firstList.addToHead(secondList)

        var resultArray = firstList.toArray()
        XCTAssertEqual([], resultArray)
        XCTAssertNil(firstList.head)
        XCTAssertNil(firstList.tail)
        XCTAssertTrue(firstList.count == 0)
        print(firstList)

        let singleElementList = createListWithArray(array: [120])
        firstList.addToHead(singleElementList)

        // Now the firstList should have 1 element

        resultArray = firstList.toArray()
        XCTAssertEqual([120], resultArray)
        XCTAssertNotNil(firstList.head)
        XCTAssertNotNil(firstList.tail)
        XCTAssertTrue(firstList.head === firstList.tail)
        XCTAssertTrue(firstList.count == 1)
        print(firstList)

        // Now add empty list again to the firstList which now has 1 element
        firstList.addToHead(secondList)
        resultArray = firstList.toArray()
        XCTAssertEqual([120], resultArray)
        XCTAssertNotNil(firstList.head)
        XCTAssertNotNil(firstList.tail)
        XCTAssertTrue(firstList.head === firstList.tail)
        XCTAssertTrue(firstList.count == 1)
        print(firstList)

        let multipleElementsList = createListWithArray(array: [111, 112, 113])
        firstList.addToHead(multipleElementsList)

        resultArray = firstList.toArray()
        XCTAssertEqual([111, 112, 113, 120], resultArray)
        XCTAssertNotNil(firstList.head)
        XCTAssertNotNil(firstList.tail)
        XCTAssertTrue(firstList.head !== firstList.tail)
        XCTAssertTrue(firstList.count == 4)
        XCTAssertEqual(firstList.head?.element, 111)
        XCTAssertEqual(firstList.tail?.element, 120)
        print(firstList)
    }

    func testAddListToTail() {
        // Start with empty List
        let firstList = createListWithArray(array: [Int]())
        let secondList = createListWithArray(array: [Int]())

        // Add empty list to the firstList. Nothing should change and the list should still be empty
        firstList.addToTail(secondList)

        var resultArray = firstList.toArray()
        XCTAssertEqual([], resultArray)
        XCTAssertNil(firstList.head)
        XCTAssertNil(firstList.tail)
        XCTAssertTrue(firstList.count == 0)
        print(firstList)

        let singleElementList = createListWithArray(array: [120])
        firstList.addToTail(singleElementList)

        // Now the firstList should have 1 element

        resultArray = firstList.toArray()
        XCTAssertEqual([120], resultArray)
        XCTAssertNotNil(firstList.head)
        XCTAssertNotNil(firstList.tail)
        XCTAssertTrue(firstList.head === firstList.tail)
        XCTAssertTrue(firstList.count == 1)
        print(firstList)

        // Now add empty list again to the firstList which now has 1 element
        firstList.addToTail(secondList)
        resultArray = firstList.toArray()
        XCTAssertEqual([120], resultArray)
        XCTAssertNotNil(firstList.head)
        XCTAssertNotNil(firstList.tail)
        XCTAssertTrue(firstList.head === firstList.tail)
        XCTAssertTrue(firstList.count == 1)
        print(firstList)

        let multipleElementsList = createListWithArray(array: [111, 112, 113])
        firstList.addToTail(multipleElementsList)

        resultArray = firstList.toArray()
        XCTAssertEqual([120, 111, 112, 113], resultArray)
        XCTAssertNotNil(firstList.head)
        XCTAssertNotNil(firstList.tail)
        XCTAssertTrue(firstList.head !== firstList.tail)
        XCTAssertTrue(firstList.count == 4)
        XCTAssertEqual(firstList.head?.element, 120)
        XCTAssertEqual(firstList.tail?.element, 113)
        print(firstList)
    }

    func testRemove() {
        let multipleValuesArray = [10, 20, 30, 40]
        let list = createListWithArray(array: multipleValuesArray)
        var resultArray = list.toArray()
        XCTAssertEqual(multipleValuesArray, resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 4)
        print(list)

        // Remove Second node
        guard let nodeToRemove = list.head?.next else {
            XCTFail()
            return
        }

        list.remove(nodeToRemove)
        resultArray = list.toArray()
        XCTAssertEqual([10,30,40], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 3)
        XCTAssertEqual(list.head?.element, 10)
        XCTAssertEqual(list.tail?.element, 40)
        print(list)

        // Remove the node again. Should be no op as its already removed from the list.
        list.remove(nodeToRemove)

        // Remove Head node
        guard let headNode = list.head else {
            XCTFail()
            return
        }

        list.remove(headNode)
        resultArray = list.toArray()
        XCTAssertEqual([30,40], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 2)
        XCTAssertEqual(list.head?.element, 30)
        XCTAssertEqual(list.tail?.element, 40)
        print(list)

        // Remove Tail node
        guard let tailNode = list.tail else {
            XCTFail()
            return
        }

        list.remove(tailNode)
        resultArray = list.toArray()
        XCTAssertEqual([30], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head === list.tail)
        XCTAssertTrue(list.count == 1)
        XCTAssertEqual(list.head?.element, 30)
        XCTAssertEqual(list.tail?.element, 30)
        print(list)

        // Remove Last node
        guard let last = list.head else {
            XCTFail()
            return
        }

        list.remove(last)
        resultArray = list.toArray()
        XCTAssertEqual([], resultArray)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
        XCTAssertTrue(list.count == 0)
        print(list)

    }

    func testInsertBeforeElement() {
        let testElement = 10
        let elementToInsert = 100
        var insertedNode: SingleListNode<Int>?

        var list = createListWithArray(array: [Int]())

        // Try to insert before an element in empty list. Should be a no op.
        insertedNode = list.insert(element: elementToInsert, before: testElement)

        var resultArray = list.toArray()
        XCTAssertEqual([], resultArray)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
        XCTAssertNil(insertedNode)
        XCTAssertTrue(list.count == 0)
        print(list)

        // Now add an element to the list but not equal to testElement
        list.appendElement(20)
        insertedNode = list.insert(element: elementToInsert, before: testElement)

        resultArray = list.toArray()
        XCTAssertEqual([20], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNil(insertedNode)
        XCTAssertTrue(list.head === list.tail)
        XCTAssertTrue(list.count == 1)
        print(list)

        // Append testElement
        list.appendElement(10)
        insertedNode = list.insert(element: elementToInsert, before: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([20, 100, 10], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 20)
        XCTAssertEqual(list.tail?.element, 10)
        XCTAssertTrue(list.count == 3)
        print(list)

        // Append a new tail element
        list.appendElement(1000)
        insertedNode = list.insert(element: elementToInsert, before: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([20, 100, 100, 10, 1000], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 20)
        XCTAssertEqual(list.tail?.element, 1000)
        XCTAssertTrue(list.count == 5)
        print(list)

        // Insert before head in single element list
        list = createListWithArray(array: [10])
        insertedNode = list.insert(element: elementToInsert, before: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([100, 10], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 100)
        XCTAssertEqual(list.tail?.element, 10)
        XCTAssertTrue(list.count == 2)
        print(list)

        // Insert before Head in multiple elements list
        list = createListWithArray(array: [10, 20, 10, 39])
        insertedNode = list.insert(element: elementToInsert, before: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([100, 10, 20, 10, 39], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 100)
        XCTAssertEqual(list.tail?.element, 39)
        XCTAssertTrue(list.count == 5)
        print(list)

        // Insert before intermediate element in multiple elements list
        list = createListWithArray(array: [110, 20, 10, 12, 10, 20, 39])
        insertedNode = list.insert(element: elementToInsert, before: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([110, 20, 100, 10, 12, 10, 20, 39], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 110)
        XCTAssertEqual(list.tail?.element, 39)
        XCTAssertTrue(list.count == 8)
        print(list)
    }

    func testInsertAfterElement() {
        let testElement = 10
        let elementToInsert = 100
        var insertedNode: SingleListNode<Int>?

        var list = createListWithArray(array: [Int]())

        // Try to insert before an element in empty list. Should be a no op.
        insertedNode = list.insert(element: elementToInsert, after: testElement)

        var resultArray = list.toArray()
        XCTAssertEqual([], resultArray)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
        XCTAssertNil(insertedNode)
        XCTAssertTrue(list.count == 0)
        print(list)

        // Now add an element to the list but not equal to testElement
        list.appendElement(20)
        insertedNode = list.insert(element: elementToInsert, after: testElement)

        resultArray = list.toArray()
        XCTAssertEqual([20], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNil(insertedNode)
        XCTAssertTrue(list.head === list.tail)
        XCTAssertTrue(list.count == 1)
        print(list)

        // Append testElement
        list.appendElement(10)
        insertedNode = list.insert(element: elementToInsert, after: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([20, 10, 100], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 20)
        XCTAssertEqual(list.tail?.element, 100)
        XCTAssertTrue(list.count == 3)
        print(list)

        // Append a new tail element
        list.appendElement(1000)
        insertedNode = list.insert(element: elementToInsert, after: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([20, 10, 100, 100, 1000], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 20)
        XCTAssertEqual(list.tail?.element, 1000)
        XCTAssertTrue(list.count == 5)
        print(list)

        // Insert before head in single element list
        list = createListWithArray(array: [10])
        insertedNode = list.insert(element: elementToInsert, after: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([10, 100], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 10)
        XCTAssertEqual(list.tail?.element, 100)
        XCTAssertTrue(list.count == 2)
        print(list)

        // Insert before Head in multiple elements list
        list = createListWithArray(array: [10, 20, 10, 39])
        insertedNode = list.insert(element: elementToInsert, after: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([10, 100, 20, 10, 39], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 10)
        XCTAssertEqual(list.tail?.element, 39)
        XCTAssertTrue(list.count == 5)
        print(list)

        // Insert before intermediate element in multiple elements list
        list = createListWithArray(array: [110, 20, 10, 12, 10, 20, 39])
        insertedNode = list.insert(element: elementToInsert, after: testElement)
        resultArray = list.toArray()
        XCTAssertEqual([110, 20, 10, 100, 12, 10, 20, 39], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertNotNil(insertedNode)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertEqual(list.head?.element, 110)
        XCTAssertEqual(list.tail?.element, 39)
        XCTAssertTrue(list.count == 8)
        print(list)

        XCTAssertFalse(list.isCyclic())
    }

    func testCycle() {
        let multipleValuesArray = [10, 20, 30, 40]
        var list = createListWithArray(array: multipleValuesArray)
        let resultArray = list.toArray()

        XCTAssertEqual(multipleValuesArray, resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 4)
        print(list)

        list.addCycle(position: 0)
        XCTAssertTrue(list.isCyclic())
        print(list)

        list.addCycle(position: 1)
        XCTAssertTrue(list.isCyclic())
        print(list)

        list.addCycle(position: 3)
        XCTAssertTrue(list.isCyclic())
        print(list)

        list = createListWithArray(array: [10])
        XCTAssertFalse(list.isCyclic())
        // Negative index doesn't add cycle
        list.addCycle(position: -1)
        XCTAssertFalse(list.isCyclic())

        // Index greater than count of nodes doesn't add cycle
        list.addCycle(position: 1)
        XCTAssertFalse(list.isCyclic())

        list.addCycle(position: 0)
        XCTAssertTrue(list.isCyclic())
        print(list)
    }

    func testNodeAtIndexFromEnd() {
        var array: [Int] = []
        var list = createListWithArray(array: array)

        // Node at index 0 for empty array is nil
        XCTAssertNil(list.nodeAtIndexFromEnd(0))

        array = [1]
        list = createListWithArray(array: array)

        // Node at index greater than count of list elements is nil
        XCTAssertNil(list.nodeAtIndexFromEnd(1))

        var node = list.nodeAtIndexFromEnd(0)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 1)

        array = [2,3,4,5]
        list = createListWithArray(array: array)
        node = list.nodeAtIndexFromEnd(3)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 2)

        node = list.nodeAtIndexFromEnd(2)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 3)

        node = list.nodeAtIndexFromEnd(1)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 4)

        node = list.nodeAtIndexFromEnd(0)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 5)
    }

    func testRemoveNodeAtIndexFromEnd() {
        var array: [Int] = []
        var list = createListWithArray(array: array)

        // Node at index 0 for empty array is nil
        XCTAssertNil(list.removeNodeAtIndexFromEnd(0))

        array = [1]
        list = createListWithArray(array: array)

        // Node at index greater than count of list elements is nil
        XCTAssertNil(list.removeNodeAtIndexFromEnd(1))
        print(list)

        var node = list.removeNodeAtIndexFromEnd(0)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 1)
        print(list)

        array = [2,3,4,5]
        list = createListWithArray(array: array)
        node = list.removeNodeAtIndexFromEnd(3)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 2)
        print(list)

        array = [2,3,4,5]
        list = createListWithArray(array: array)
        node = list.removeNodeAtIndexFromEnd(2)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 3)
        print(list)

        array = [2,3,4,5]
        list = createListWithArray(array: array)
        node = list.removeNodeAtIndexFromEnd(1)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 4)
        print(list)

        array = [2,3,4,5]
        list = createListWithArray(array: array)
        node = list.removeNodeAtIndexFromEnd(0)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.element, 5)
        print(list)
    }

    func testReverse() {
        // Empty Array
        let emptyArray = [Int]()
        var list = createListWithArray(array: emptyArray)
        list.reverse()
        var resultArray = list.toArray()
        XCTAssertEqual(emptyArray, resultArray)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
        XCTAssertTrue(list.count == 0)
        print(list)


        // List with 1 node
        let singleValueArray = [10]
        list = createListWithArray(array: singleValueArray)
        list.reverse()
        resultArray = list.toArray()
        XCTAssertEqual(singleValueArray, resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head === list.tail)
        XCTAssertTrue(list.count == 1)
        print(list)

        list = createListWithArray(array: [10, 20])
        list.reverse()
        resultArray = list.toArray()
        XCTAssertEqual([20, 10], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 2)
        print(list)

        list = createListWithArray(array: [10, 20, 30, 40, 50])
        list.reverse()
        resultArray = list.toArray()
        XCTAssertEqual([50, 40, 30, 20, 10], resultArray)
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
        XCTAssertTrue(list.head !== list.tail)
        XCTAssertTrue(list.count == 5)
    }

    func testMiddle() {
        // Empty Array
        let emptyArray = [Int]()
        var list = createListWithArray(array: emptyArray)
        XCTAssertNil(list.middleNode())
        print(list)


        // List with 1 node
        let singleValueArray = [10]
        list = createListWithArray(array: singleValueArray)
        var middle = list.middleNode()
        XCTAssertNotNil(middle)
        XCTAssertEqual(middle?.element, 10)
        print(list)

        list = createListWithArray(array: [10, 20])
        middle = list.middleNode()
        XCTAssertNotNil(middle)
        XCTAssertEqual(middle?.element, 10)
        print(list)

        list = createListWithArray(array: [10, 20, 30, 40, 50])
        middle = list.middleNode()
        XCTAssertNotNil(middle)
        XCTAssertEqual(middle?.element, 30)
        print(list)
    }
}
