//
//  5.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/02.
//

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var chars: [Character] = Array(s)
        var isPalindromic: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        var left = 0, right = 0
        
        for i in 0..<chars.count {
            for j in 0..<i {
                if chars[i] == chars[j] && (i - j <= 2 || isPalindromic[i-1][j+1]) {
                    isPalindromic[i][j] = true
                    
                    if right - left < i - j {
                        right = i
                        left = j
                    }
                }
            }
        }
        
        
        return String(chars[left...right])
    }
}
