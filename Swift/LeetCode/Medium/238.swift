//
//  238.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/18.
//

import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var last: Int = 1
        var result: [Int] = []
        for num in nums {
            result.append(last)
            last *= num
        }
        // print("result: \(result)")
        
        last = 1
        for i in stride(from: nums.count-1, to: 0, by: -1) {
            result[i] *= last
            last *= nums[i]
        }
        result[0] *= last
        // print("result: \(result)")
        
        return result
    }
}
