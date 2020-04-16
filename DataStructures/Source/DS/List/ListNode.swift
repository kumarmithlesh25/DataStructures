//
//  ListNode.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 3/8/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

public class SingleListNode<T> {
    var next: SingleListNode<T>?
    public let element: T

    public init(element: T) {
        self.element = element
    }
}

public class DoubleListNode<T> {
    var next: DoubleListNode<T>?

    // We need to make either next or previous var weak to avoid retain cycle
    weak var previous: DoubleListNode<T>?

    public let element: T

    public init(element: T) {
        self.element = element
    }
}

internal struct TrackedString {
    var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}


