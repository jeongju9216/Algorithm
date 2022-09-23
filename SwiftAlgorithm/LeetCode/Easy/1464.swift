//
//  1464.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        let nums = nums.sorted(by: >)
        return (nums[0]-1) * (nums[1]-1)
    }
}
