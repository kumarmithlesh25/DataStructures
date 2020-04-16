//
//  Strings.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/6/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

public class StringAlgorithm {

    static func findAllSubstringsOf(string: String?) -> [String] {
        guard let string = string, !string.isEmpty else { return [] }
        for char in string {
            print(char)
        }

        return []
    }

    static func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
        let dashCharacter: Character = "-"
        var result = S.replacingOccurrences(of: String(dashCharacter), with: "")
        let count = result.count

        guard count > 0 else {
            return ""
        }
        
        var separatorsCount = count / K

        var firstSubsequenceLength = count % K
        if firstSubsequenceLength == 0 {
            firstSubsequenceLength = K
            separatorsCount -= 1
        }

        for i in 0 ..< separatorsCount {
            if (i == 0) {
                result.insert(dashCharacter, at: result.index(result.startIndex, offsetBy: firstSubsequenceLength))
            } else {
                result.insert(dashCharacter, at: result.index(result.startIndex, offsetBy: firstSubsequenceLength + i + (i * K)))
            }
        }

        return result.uppercased()
    }
}

