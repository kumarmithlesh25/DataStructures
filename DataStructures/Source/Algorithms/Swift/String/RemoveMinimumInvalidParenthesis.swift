//
//  RemoveMinimumInvalidParenthesis.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 4/15/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

public extension String {
    func removeInvalidParenthesis() -> [String] {
        var left = 0, right = 0

        for (_, value) in self.enumerated() {
            if value == "(" {
                left += 1
            } else if value == ")" {
                right = left == 0 ? right + 1 : right

                left = left > 0 ? left - 1 : left
            }
        }

        var expression = String()
        var validExpressions = [String]()
        recurse(
            index: 0,
            leftCount: 0,
            rightCount: 0,
            leftRemaining: left,
            rightRemaining: right,
            expression: &expression,
            validExpressions: &validExpressions)

        return validExpressions
    }

    private func recurse(
        index: Int,
        leftCount: Int,
        rightCount: Int,
        leftRemaining: Int,
        rightRemaining: Int,
        expression: inout String,
        validExpressions: inout [String]) {

        guard index != self.count else {
            if leftRemaining == 0, rightRemaining == 0 {
                validExpressions.append(expression)
            }
            return
        }

        let character = self[index]
        let length = expression.count

        if (character == "(" && leftRemaining > 0) || (character == ")" && rightRemaining > 0) {
            print("Start")
            recurse(
                index: index + 1,
                leftCount: leftCount,
                rightCount: rightCount,
                leftRemaining: leftRemaining - (character == "(" ? 1 : 0),
                rightRemaining: rightRemaining - (character == ")" ? 1 : 0),
                expression: &expression,
                validExpressions: &validExpressions)
        }

        expression.append(character)

        // Simply recurse one step further if the current character is not a parenthesis.
        if (character != "(" && character != ")") {
            recurse(
               index: index + 1,
               leftCount: leftCount,
               rightCount: rightCount,
               leftRemaining: leftRemaining,
               rightRemaining: rightRemaining,
               expression: &expression,
               validExpressions: &validExpressions)

        } else if (character == "(") {

          // Consider an opening bracket.
            recurse(
             index: index + 1,
             leftCount: leftCount + 1,
             rightCount: rightCount,
             leftRemaining: leftRemaining,
             rightRemaining: rightRemaining,
             expression: &expression,
             validExpressions: &validExpressions)

        } else if (rightCount < leftCount) {

          // Consider a closing bracket.
            recurse(
             index: index + 1,
             leftCount: leftCount,
             rightCount: rightCount + 1,
             leftRemaining: leftRemaining,
             rightRemaining: rightRemaining,
             expression: &expression,
             validExpressions: &validExpressions)
        }

        // Delete for backtracking.
        expression.remove(at: expression.index(expression.startIndex, offsetBy: length))
    }
}
