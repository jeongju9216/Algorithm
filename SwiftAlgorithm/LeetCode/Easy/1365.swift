//
//  1365.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/28.
//

import Foundation

class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var sortedArr = nums.sorted()
        
        var arr: [Int] = []
        for num in nums {
            var count: Int = 0
            for sortNum in sortedArr {
                if num > sortNum {
                    count += 1
                } else {
                    break
                }
            }
            arr.append(count)
        }
        
        return arr
    }
}
