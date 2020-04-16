//
//  Bitswise.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 4/2/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//


extension Int {
    static func reverseBits(_ n: Int) -> Int {
        let bitwidth = n.bitWidth
        let half = bitwidth / 2
        var result = n

        for k in 0..<half {
            let rightBit = result & (1 << k) != 0 ? 1 : 0
            let leftBit = result & (1 << (bitwidth - (k + 1))) != 0 ? 1 : 0

            if rightBit == 1 {
                result |= (1 << (bitwidth - (k + 1)))
            } else {
                result &= ~(1 << (bitwidth - (k + 1)))
            }

            if leftBit == 1 {
                result |= (1 << k)
            } else {
                result &= ~(1 << k)
            }
        }

        return result
    }

    var bitsRepresentation: String {
        var result = ""

        for k in (1...bitWidth).reversed() {
            if (self & (1 << (k-1))) != 0 {
                result.append(Character("1"))
            } else {
                result.append("0")
            }
        }

        return result
    }

    var countOfSetBits: Int8 {
        var count: Int8 = 0
        for k in 0..<bitWidth {
            if (self & (1 << k)) != 0 {
                count += 1
            }
        }

        return count
    }
}

