//
//  Stack.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 3/7/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

protocol StackInterface {
    associatedtype Element: Equatable
    mutating func push(element: Element)
    mutating func pop() -> Element?
    func peek() throws -> Element
    func count() -> Int
    subscript(index: Int) -> Element { get }
}

public enum StackError: Error {
    case Empty(message: String)
}

// Concrete implementation of StackInterface protocol using Array
public struct Stack<T: Equatable>: StackInterface {
    public typealias Element = T

    var array: [T] = []

    init(capacity: Int) {
        array.reserveCapacity(capacity)
    }

    public mutating func push(element: T) {
        array.append(element)
    }

    public mutating func pop() -> T? {
        return array.popLast()
    }

    private func isEmpty() -> Bool {
        return array.isEmpty
    }

    public func peek() throws -> T {
        guard !isEmpty(), let lastElement = array.last else {
            throw StackError.Empty(message: "Array is empty")
        }
        return lastElement
    }

    func count() -> Int {
        return array.count
    }
}

extension Stack: Collection {
    public subscript(index: Int) -> T {
        return array[index]
    }

    public var startIndex: Int {
        return array.startIndex
    }

    public var endIndex: Int {
        return array.endIndex
    }

    public func index(after i: Int) -> Int {
        return array.index(after: i)
    }

    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator { curr.pop() }
    }
}

// Make Stack variables type printable
extension Stack: CustomStringConvertible {
    public var description: String {
        let header = "** Stack operation starts **"
        let footer = "** Stack operation ends **"
        let elements = array.map { "\($0)" }.joined(separator: "\n")
        return header + elements + footer
    }
}

extension Stack {
    func isTop(_ item: T) -> Bool {
        guard let topItem = array.last else {
            return false
        }
        return topItem == item
    }
}

extension Stack {
    var topItem: T? {
        return isEmpty() ? nil : array[array.count - 1]
    }
}

func testStack() {
    var stack = Stack<Int>(capacity: 10)
    stack.push(element: 1)
    stack.push(element: 2)

    print(stack)
    _ = stack.pop()
    _ = stack.pop()

    stack.push(element: 5)
    stack.push(element: 12)
    stack.push(element: 3)
    print(stack)

    let stack2 = stack

    print(stack[0] == stack2[0])
}
