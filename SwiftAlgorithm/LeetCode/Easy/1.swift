//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for i in 0..<nums.count {
            if let number = dict[target-nums[i]] {
                return [number, i]
            }
            
            dict[nums[i]] = i
        }
        
        return []
    }
}

// Runtime: 41 ms, faster than 98.50% of Swift online submissions for Two Sum.
// Memory Usage: 14.7 MB, less than 8.08% of Swift online submissions for Two Sum.

