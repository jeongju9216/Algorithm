//
//  27.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var count: Int = 0
        for num in nums {
            if num != val {
                nums[count] = num
                count += 1
            }
        }
        
        return count
    }
}
