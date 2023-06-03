//
//  169.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/01.
//

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        let count: Int = Int(floor(Double(nums.count) / 2.0))
        var result: Int = 0
        
        var dict: [Int: Int] = [:]
        for num in nums {
            dict[num, default: 0] += 1
            
            if dict[num]! > count {
                result = num
                break
            }
        }
        
        return result
    }
}
