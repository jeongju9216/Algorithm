//
//  1877.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func minPairSum(_ nums: [Int]) -> Int {
        
        //큰거 + 작은거
        var nums = nums.sorted()
        var result: Int = 0
        for i in 0..<(nums.count/2) {
            if result < (nums[i] + nums[nums.count-i-1]) {
                result = nums[i] + nums[nums.count-i-1]
            }
        }
        
        return result
    }
}
