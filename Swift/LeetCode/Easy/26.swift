//
//  26.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/04.
//

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        var count: Int = 0
        for i in 0..<nums.count {
            if count > 0 && nums[i] == nums[count-1] {
                continue
            }
            
            nums[count] = nums[i]
            count += 1
        }
        
        return count
    }
}
