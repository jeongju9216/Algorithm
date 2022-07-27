//
//  1470.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var result: [Int] = []
        for i in 0..<n {
            result.append(contentsOf: [nums[i], nums[i+n]])
        }
        
        return result
    }
}
