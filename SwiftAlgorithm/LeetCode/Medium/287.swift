//
//  287.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/03.
//

import Foundation

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow: Int = nums[0]
        var fast: Int = nums[nums[slow]]
        
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        
        slow = 0
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        
        return slow
    }
}
