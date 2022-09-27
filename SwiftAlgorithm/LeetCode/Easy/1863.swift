//
//  1863.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    
    func subsetXORSum(_ nums: [Int]) -> Int {
        
        var subsets: [[Int]] = [[]]
        for num in nums {
            for subset in subsets {
                subsets.append(subset + [num])
            }
        }
        
        var result: Int = 0
        
        for subset in subsets {
            let xor = subset.reduce(0, ^)
            result += xor
        }
        
        return result
    }
}
