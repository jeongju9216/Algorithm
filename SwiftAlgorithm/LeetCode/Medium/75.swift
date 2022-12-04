//
//  75.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/03.
//

import Foundation

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var count0 = 0, count1 = 0, count2 = 0
        for num in nums {
            if num == 0 {
                count0 += 1
            } else if num == 1 {
                count1 += 1
            } else if num == 2 {
                count2 += 1
            }
        }
        
        for i in 0..<nums.count {
            if count0 > 0 {
                nums[i] = 0
                count0 -= 1
            } else if count1 > 0 {
                nums[i] = 1
                count1 -= 1
            } else {
                nums[i] = 2
                count2 -= 1
            }
        }
    }
}
