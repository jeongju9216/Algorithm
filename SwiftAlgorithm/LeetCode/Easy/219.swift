//
//  219.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict: [Int: Int] = [:]
        
        for i in 0..<nums.count {
            if let index = dict[nums[i]], i - index <= k {
                return true
            }
            
            dict[nums[i]] = i
        }
        
        return false
    }
}
