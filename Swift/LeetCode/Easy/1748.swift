//
//  1748.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/02.
//

import Foundation

class Solution {
    func sumOfUnique(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        
        for num in nums {
            dict[num, default: 0] += 1
        }
        
        var sum: Int = 0
        for (key, value) in dict {
            if value == 1 {
                sum += key
            }
        }
        
        return sum
    }
}
