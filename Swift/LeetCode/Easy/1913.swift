//
//  1913.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func maxProductDifference(_ nums: [Int]) -> Int {
        var result: Int = 0
        
        //큰값의 곱 - 작은값끼리의 곱
        let nums: [Int] = nums.sorted(by: >)
        
        result = (nums[0] * nums[1]) - (nums[nums.count-1] * nums[nums.count-2])
        
        return result
    }
}
