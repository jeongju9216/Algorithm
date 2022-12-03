//
//  384.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/03.
//

import Foundation


class Solution {
    var nums: [Int]
    var original: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
        original = nums
    }
    
    func reset() -> [Int] {
        nums = original
        return original
    }
    
    func shuffle() -> [Int] {
        nums.shuffle()
        return nums
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
