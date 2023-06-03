//
//  1844.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/12.
//

import Foundation

class Solution {
    func replaceDigits(_ s: String) -> String {
        var chars: [Character] = Array(s)
        var result: String = ""

        var evenChar: String = ""
        var oddNum: Int = 0
        for i in 0..<chars.count {
            if i % 2 == 0 { //even
                evenChar = String(chars[i])

                result += evenChar
            } else { //odd
                oddNum = Int(String(chars[i]))!

                let newChar = UnicodeScalar(Int(UnicodeScalar(evenChar)!.value) + oddNum)!
                result += String(newChar)
            }
        }

        return result
    }
}
