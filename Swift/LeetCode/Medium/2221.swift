//
//  2221.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/28.
//

import Foundation

class Solution {
    func triangularSum(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var result: [Int] = nums
        for time in 0..<result.count {
            for i in 1..<(result.count - time) {
                result[i-1] = (result[i] + result[i-1]) % 10
            }
        }
        
        return result[0]
    }
}
