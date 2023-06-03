//
//  268.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/09.
//

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var inputSum = nums.reduce(0, +)
        var sum = (1...nums.count).reduce(0, +)
        
        return sum - inputSum
    }
}
