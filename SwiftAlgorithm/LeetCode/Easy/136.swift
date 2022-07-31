//
//  136.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/31.
//

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        let nums: [Int] = nums.sorted()
        
        var i: Int = 0
        while i < nums.count-1 {
            if nums[i] == nums[i+1] {
                i += 2
                continue
            }
            
            break
        }
        
        return nums[i]
    }
}
