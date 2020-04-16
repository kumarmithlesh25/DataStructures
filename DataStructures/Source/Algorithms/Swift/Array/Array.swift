//
//  Array.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 3/9/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation


public class ArrayAlgorithm {
    /*
     Given an array of integers, return indices of the two numbers such that they add up to a specific target.
     You may assume that each input would have exactly one solution, and you may not use the same element twice.
     Given nums = [2, 7, 11, 15], target = 9,

     Because nums[0] + nums[1] = 2 + 7 = 9,
     return [0, 1].
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // One pass Hash table method
        // We'll use complementStore to store value and its index in the input array.
        var complementStore: [Int:Int] = [:]

        for (index, value) in nums.enumerated() {
            let complement = target - value

            // We can't take same value twice, E.g. If the store has a value 4 and current value is also 4, even though the sum comes to be 8, we can't use that pair as per the requirements of the problem
            guard value != complement else { continue }

            guard let savedComplementIndex = complementStore[target - value] else {
                complementStore[value] = index
                continue
            }

            return [savedComplementIndex, index]
        }

        return []
    }

    /*
     Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
     */

    // TODO: Make the algo efficient to work for large data set.
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var returnArray: [[Int]] = []
        var complementStoreForPairSum: [Int: [[Int]]] = [:]
        var complementStoreForSum: [Int: Int] = [:]

        // Remove duplicates from the array
        let inputArray = Array(Set(nums))

        for i in 0..<inputArray.count-2 {
            // If complement for this element already exists, don't repeat
            guard complementStoreForPairSum[inputArray[i]] == nil else {
                continue
            }

            // if a + b + c = 0, target = -a
            let target = -1 * inputArray[i]

            for j in i+1..<inputArray.count {
                // Find two numbers, b and C whose sum = target
                let value = inputArray[j]
                
                let complement = target - value
                //check if complementStore contains a value for complement
                guard let index = complementStoreForSum[complement], index > i, index != j else {
                    complementStoreForSum[value] = j
                    continue
                }

                if let pairArray = complementStoreForPairSum[inputArray[i]] {
                    complementStoreForPairSum[inputArray[i]] = pairArray + [[value, inputArray[index]]]
                } else {
                    complementStoreForPairSum[inputArray[i]] = [[value, inputArray[index]]]
                }
            }

            if let pairArray = complementStoreForPairSum[inputArray[i]] {
                pairArray.forEach { pair in
                    returnArray.append([nums[i], pair[0], pair[1]])
                }
            }
        }
        return returnArray
    }

    /**
            Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

                Minimum count of heights array is 2
     */

    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1, maxArea = 0
        var leftHeight = 0, rightHeight = 0, newMaxArea = 0, width = 0

        while left < right {
            leftHeight = height[left]
            rightHeight = height[right]
            width = right - left

            if leftHeight < rightHeight {
                newMaxArea = leftHeight * width
            } else {
                newMaxArea = rightHeight * width
            }

            if newMaxArea > maxArea {
                maxArea = newMaxArea
            }

            if leftHeight < rightHeight {
                left += 1
            } else {
                right -= 1
            }
        }

        return maxArea
    }
}

public extension Array where Element == Int {
    func subarrayWithMaximumSum(length: Int) -> Array? {
        guard self.count >= length else { return nil }

        var currentSum = 0
        var currentIndex = 0

        while currentIndex < length {
            currentSum += self[currentIndex]
            currentIndex += 1
        }

        var maximumSum = currentSum
        var range = NSRange(location: 0, length: length)

        for (index, value) in self.enumerated() {
            let windowEndIndex = index + length
            guard windowEndIndex < self.count else { break }
            currentSum -= value
            currentSum += self[windowEndIndex]

            if currentSum > maximumSum {
                maximumSum = currentSum
                range.location = index + 1
            }
        }
        //var currentSum
        return Array(self[range.lowerBound..<range.upperBound])
    }

    func minimumSubarrayWithTargetSumGreaterThanOrEqualTo(_ targetSum: Int) -> Array {

        var currentSum = 0
        var windowStart = 0
        var range = NSRange(location: 0, length: Int.max)
        for (index, value) in self.enumerated() {
            currentSum += value

            while(currentSum >= targetSum) {
                let currentWindowLength = index - windowStart + 1
                if range.length > currentWindowLength {
                    range.location = windowStart
                    range.length = currentWindowLength
                }
                currentSum -= self[windowStart]
                windowStart += 1
            }
        }

        guard range.length > 0, range.length <= self.count else { return [] }
        return Array(self[range.lowerBound..<range.upperBound])
    }
}

