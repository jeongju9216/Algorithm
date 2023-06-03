//
//  2160.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/21.
//

import Foundation

class Solution {
    func minimumSum(_ num: Int) -> Int {
        let nums: [Int] = String(num).map { Int(String($0))! }.sorted(by: <)
        print(nums)
        
        let newNum1: Int = nums[0] * 10 + nums[2]
        let newNum2: Int = nums[1] * 10 + nums[3]
        
        return newNum1 + newNum2
    }
}
