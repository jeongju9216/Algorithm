//
//  1512.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var count: Int = 0
        for i in 0..<nums.count-1 {
            for j in (i+1)..<nums.count {
                if nums[i] == nums[j] {
                    count += 1
                }
            }
        }
        
        return count
    }
}
