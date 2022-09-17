//
//  2396.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/17.
//

import Foundation

class Solution {
    func isStrictlyPalindromic(_ n: Int) -> Bool {
        for time in 2...n-2 {
            let binary: [Character] = Array(String(n, radix: time))

            let length: Int = binary.count
            for i in 0..<(length/2) {
                if binary[i] != binary[length-i-1] {
                    return false
                }
            }
        }
        
        return true
    }
}
