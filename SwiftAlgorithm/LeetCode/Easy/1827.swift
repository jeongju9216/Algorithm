//
//  1827.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/21.
//

import Foundation

class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        var nums = nums
        var result: Int = 0
        
        for i in 1..<nums.count {
            if nums[i] <= nums[i-1] { //지금 숫자가 이전 숫자보다 작거나 같으면
                result += (nums[i-1] - nums[i] + 1)
                nums[i] = nums[i-1] + 1
            }
        }
        
        return result
    }
}
