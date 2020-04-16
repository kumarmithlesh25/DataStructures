//
//  Dictionary + Extensions.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 4/13/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

public extension Dictionary where Key == Character, Value == Int {
    mutating func incrementOrAddValueForKey(_ key: Key) {
        if let count = self[key] {
            self[key] = count + 1
        } else {
            self[key] = 1
        }
    }

    mutating func decrementOrRemoveValueForKey(_ key: Key) {
        guard var count = self[key] else { return }
        count = count - 1

        guard count > 1 else {
            removeValue(forKey: key)
            return
        }

        self[key] = count
    }
}
