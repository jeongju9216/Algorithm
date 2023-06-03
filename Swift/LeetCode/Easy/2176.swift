//
//  2176.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/22.
//

import Foundation

class Solution {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        var count: Int = 0
        for i in 0..<(nums.count-1) {
            for j in (i+1)..<nums.count {
                if nums[i] == nums[j] && (i * j) % k == 0 {
                    count += 1
                }
            }
        }
        
        return count
    }
}
