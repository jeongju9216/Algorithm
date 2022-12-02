//
//  3.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/02.
//

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dict: [Character: Int] = [:]
        var left = 0, right = 0
        var result: Int = 0

        var chars: [Character] = Array(s)
        while left < chars.count && right < chars.count {
            let rightChar = chars[right]
            let leftChar = chars[left]
            
            if let num = dict[rightChar], num > 0 {
                dict[leftChar, default: 0] -= 1
                left += 1
            } else {
                dict[rightChar, default: 0] += 1
                right += 1
            }
            
            result = max(result, right - left)
        }
        
        return result
    }
}
