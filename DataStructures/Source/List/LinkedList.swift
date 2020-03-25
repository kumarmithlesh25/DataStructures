//
//  LinkedList.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 3/8/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

// TODO: Redefine the protocol and nodes to use a single protocol for all kinds of linked lists.

protocol SinglyLinkedListInterface: class {
    associatedtype LLElement: Equatable
    
    var count: Int { get }
    var head: SingleListNode<LLElement>? { get }
    var tail: SingleListNode<LLElement>? { get }

    func appendElement(_ element: LLElement)
    func toArray() -> [LLElement]
    func addToHead(_ node: SingleListNode<LLElement>)
    func addToTail(_ node: SingleListNode<LLElement>)

    func addToHead<List: SinglyLinkedListInterface>(_ list: List) where List.LLElement == LLElement
    func addToTail<List: SinglyLinkedListInterface>(_ list: List) where List.LLElement == LLElement
    func remove(_ node: SingleListNode<LLElement>)

    @discardableResult func insert(element: LLElement, before: LLElement) -> SingleListNode<LLElement>?
    @discardableResult func insert(element: LLElement, after: LLElement) -> SingleListNode<LLElement>?

    // Operations
    // Adds a cycle whre last node starts pointing to the node at given position. If position is < 0 or greater than maximum index for the linked list, no cycle is added
    func addCycle(position: Int)

    // The index is 0 based. If the list has less nodes than index, the function returns nil
    func nodeAtIndexFromEnd(_ index: Int) -> SingleListNode<LLElement>?

    // Check whether a cycle (loop) exists in the list
    func isCyclic() -> Bool

    //
    func middleNode() -> SingleListNode<LLElement>?

    //
    func reverse()

    //
    func removeNodeAtIndexFromEnd(_ index: Int) -> SingleListNode<LLElement>?
}

// This class implements a singly linked list

public class SinglyLinkedList<T>: SinglyLinkedListInterface where T: Equatable {
    public typealias LLElement = T
    var head: SingleListNode<T>?
    var tail: SingleListNode<T>?

    public private(set) var count: Int = 0

    public init() {}

    func appendElement(_ element: T) {
        let node = SingleListNode(element: element)
        addToTail(node)
    }

    func toArray() -> [T] {
        guard let start = head else {
            return []
        }

        var array = [T](repeating: start.element, count: count)
        var index = 0
        var node: SingleListNode<T>? = start
        while let unwrappedNode = node {
            array[index] = unwrappedNode.element
            index += 1
            node = unwrappedNode.next
        }

        return array
    }

    // Add the node as first node
    func addToHead(_ node: SingleListNode<T>) {
        if let head = self.head {
            node.next = head
            self.head = node
        } else {
            self.head = node
            self.tail = node
        }

        self.count += 1
    }

    // Add the node as last node
    func addToTail(_ node: SingleListNode<T>) {
        if let tail = self.tail {
            tail.next = node
            self.tail = node
        } else {
            self.tail = node
            self.head = node
        }

        self.count += 1
    }

    func addToHead<List>(_ list: List) where List : SinglyLinkedListInterface, List.LLElement == T {
        guard let listHead = list.head else {
            return
        }

        if let head = self.head {
            list.tail?.next = head
            self.head = listHead
        } else {
            self.head = listHead
            self.tail = list.tail
        }

        self.count += list.count
    }

    func addToTail<List>(_ list: List) where List : SinglyLinkedListInterface, List.LLElement == T {
        guard let listTail = list.tail else {
            return
        }

        if let tail = self.tail {
            tail.next = list.head
            self.tail = listTail
        } else {
            self.head = list.head
            self.tail = list.tail
        }

        self.count += list.count
    }

    func remove(_ nodeToRemove: SingleListNode<T>) {
        guard let parentNode = self.first(where: { (node) -> Bool in
            node === nodeToRemove || node.next === nodeToRemove
        }) else {
            return
        }

        if nodeToRemove === head, head !== tail {
            self.head = nodeToRemove.next
            // Remove head
        } else if nodeToRemove === tail, head !== tail {
            // Remove tail
            parentNode.next = self.tail?.next
            self.tail = parentNode
        } else if nodeToRemove === head, head === tail {
            // Remove head and tail. List has single node to be removed
            self.head = nil
            self.tail = nil
        } else {
            // Remove intermediate node
            parentNode.next = nodeToRemove.next
        }

        count -= 1
    }

    @discardableResult func insert(element: T, before: T) -> SingleListNode<T>? {
        // First check if before element exists
        guard let parentNode = self.first(where: { (node) -> Bool in
            node.element == before || node.next?.element == before
        }) else {
            return nil
        }

        // We need reference to the parent node of target node before which new node is to be added
        // if parentNode contains the value then its the head of the list
        let newNode = SingleListNode(element: element)
        if parentNode.element == before {
            newNode.next = parentNode
            head = newNode
        } else {
            newNode.next = parentNode.next
            parentNode.next = newNode
        }
        count += 1

        return newNode
    }

    @discardableResult func insert(element: T, after: T) -> SingleListNode<T>? {
        // First check if the element after which new element is to be added exists
        guard let afterNode = self.first(where: { (node) -> Bool in
            node.element == after
        }) else {
            return nil
        }

        let newNode = SingleListNode(element: element)
        newNode.next = afterNode.next
        afterNode.next = newNode

        if afterNode === tail {
            tail = newNode
        }

        count += 1

        return newNode
    }

    func addCycle(position: Int) {
        guard position >= 0, position < count else { return }

        var node = head
        var index = 0
        while node != nil {
            guard position != index else {
                tail?.next = node
                return
            }
            index += 1
            node = node?.next
        }
    }

    private func nodeAtIndexFromStart(_ index: Int) -> SingleListNode<T>? {
        guard index >= 0 else { return nil }
        var node = head
        var localIndex = 0

        while let unwrappedNode = node {
            guard localIndex != index else {
                return unwrappedNode
            }

            localIndex += 1
            node = node?.next
        }

        return nil
    }

    func nodeAtIndexFromEnd(_ index: Int) -> SingleListNode<T>? {
        // Start with two nodes, one pointing to head and second pointing to index from head.
        var first = head
        // The linked list has fewer than index nodes
        guard let second = nodeAtIndexFromStart(index) else {
            return nil
        }

        var secondNode: SingleListNode<T>? = second

        while secondNode !== tail {
            first = first?.next
            secondNode = secondNode?.next
        }

        return first
    }

    func isCyclic() -> Bool {
        var first = head
        var second = head

        while first != nil && second != nil {
            first = first?.next

            second = second?.next
            if second == nil {
                return false
            }
            second = second?.next

            if first === second {
                return true
            }
        }
        
        return false
    }

    func middleNode() -> SingleListNode<T>? {
        guard head != nil else { return nil }
        // We'll use two pointers - a slow pointer that increments 1 step and a fast pointers that increment twice
        // To find the middle node, we increment both the pointers and when the fast pointer reaches the far end, the slow pointer points to the middle node
        var slow: SingleListNode<T>? = head
        var fast: SingleListNode<T>? = head?.next

        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return slow
    }

    func reverse() {
        var previous: SingleListNode<T>?
        var current = head
        var temp: SingleListNode<T>?

        while current !== nil {
            temp = current?.next
            current?.next = previous
            previous = current
            current = temp
        }
        // Swap head and tail
        // We don't handle cyclic loops in the list in the process of reverse
        temp = head
        head = tail
        tail = temp
    }

    func removeNodeAtIndexFromEnd(_ index: Int) -> SingleListNode<T>? {
        guard let node = nodeAtIndexFromEnd(index) else { return nil }
        remove(node)
        return node
    }
}

extension SinglyLinkedList: CustomStringConvertible {
    public var description: String {
        let prefix = "*** Printing list *** \n Total nodes = \(count)\n"
        let content = self.map({ [weak self] in
            var content = ""
            if let head = self?.head, head === $0 {
                content.append("(HEAD)")
            }
            content.append("|\($0.element)|")

            if let tail = self?.tail, tail === $0 {
                content.append("(TAIL)")

                if let tailNext = tail.next {
                    content.append("(\(tailNext.element))")
                }
            }

            return  content

        }).joined(separator: "--")
        return prefix + content
    }
}

extension SinglyLinkedList: Sequence {
    public typealias Iterator = SinglyLinkedListIterator

    public __consuming func makeIterator() -> SinglyLinkedListIterator<T> {
        return SinglyLinkedListIterator(self)
    }
}

public struct SinglyLinkedListIterator<T: Equatable>: IteratorProtocol {
    public typealias Element = SingleListNode<T>
    let linkedList: SinglyLinkedList<T>
    var current: SingleListNode<T>?

    public init(_ list: SinglyLinkedList<T>) {
        self.linkedList = list
        self.current = linkedList.head
    }

    public mutating func next() -> SingleListNode<T>? {
        guard let current = self.current else { return nil }
        self.current = current !== linkedList.tail ? current.next : nil // Break if the list has a cycle
        return current
    }
}

