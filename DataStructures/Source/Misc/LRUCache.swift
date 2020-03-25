//
//  LRUCache.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 3/15/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

protocol LRUCacheInterface {
    func get(_ key: Int) -> Int
    func put(_ key: Int, _ value: Int)
}
