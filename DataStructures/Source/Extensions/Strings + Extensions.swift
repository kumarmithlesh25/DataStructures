//
//  Strings + Extension.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 4/13/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

public extension String {
    func longestSubstringWithDistinctCharacters(_ distinctCount: UInt) -> Substring? {
        guard distinctCount > 0 else { return nil }
        guard self.count >= distinctCount else { return nil }

        var startIndex = 0, endIndex = 0
        var charactersMap: [Character: Int] = [:]
        var largestRange: NSRange = NSRange(location: 0, length: 0)

        for (index, character) in self.enumerated() {

            // Update hash map with current character
            charactersMap.incrementOrAddValueForKey(character)

            // Use sliding window to shift start index towards right and keep shrinking the sliding window until we arrive at required distinct characters.
            while charactersMap.count > distinctCount {
                startIndex += 1
                charactersMap.decrementOrRemoveValueForKey(character)
            }

            // Once our hashmap has exactly k distinct characters, check if current window is the largest and if so, replace current window with previous window
            if charactersMap.count == distinctCount {
                endIndex = index
                let length = endIndex - startIndex + 1
                if largestRange.length < length {
                    largestRange.location = startIndex
                    largestRange.length = length
                }
            }
        }

        guard largestRange.length > 0 else { return nil }
        return self[largestRange]
    }

    func smallestSubstringContainingCharactersInString(_ substring: String) -> Substring {
        return ""
    }
}

// MARK: Extension to add support for accessing parts of string using subscripts

public extension String {
    func index(at offset: Int) -> String.Index {
        return index(startIndex, offsetBy: offset)
    }
    subscript(x: Int) -> Character {
        self[index(at: x)]
    }

    subscript(x: NSRange) -> Substring {
        self[x.lowerBound..<x.upperBound]
    }

    subscript(value: CountableClosedRange<Int>) -> Substring {
      self[index(at: value.lowerBound)...index(at: value.upperBound)]
    }

    subscript(value: CountableRange<Int>) -> Substring {
      self[index(at: value.lowerBound)..<index(at: value.upperBound)]
    }

    subscript(value: PartialRangeUpTo<Int>) -> Substring {
      self[..<index(at: value.upperBound)]
    }

    subscript(value: PartialRangeThrough<Int>) -> Substring {
      self[...index(at: value.upperBound)]
    }

    subscript(value: PartialRangeFrom<Int>) -> Substring {
      self[index(at: value.lowerBound)...]
    }
}
