//
//  35.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/02.
//

import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count-1
        while left <= right {
            let mid = (left + right) / 2
            let num = nums[mid]
            
            if target == num {
                return mid
            } else if target > num {
                left = mid + 1
            } else if target < num {
                right = mid - 1
            }
        }
        
        return left
    }
}
