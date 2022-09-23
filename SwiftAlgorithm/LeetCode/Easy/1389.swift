//
//  1389.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
        var result: [Int] = []
        
        for i in 0..<nums.count {
            result.insert(nums[i], at: index[i])
        }
        
        print(result)
        return result
    }
}
