//
//  283.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/03.
//

import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroCount: Int = 0
        var array: [Int] = []
        for num in nums {
            if num == 0 {
                zeroCount += 1
            } else {
                array.append(num)
            }
        }
        
        array.append(contentsOf: Array(repeating: 0, count: zeroCount))
        
        nums = array
    }
}
