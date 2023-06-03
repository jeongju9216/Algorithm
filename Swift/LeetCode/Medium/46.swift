//
//  46.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/28.
//

import Foundation

class Solution {
    
    var result: [[Int]] = []
    
    func backtracking(_ list: inout [Int], _ nums: [Int]) {
        if list.count == nums.count {
            result.append(list)
            return
        }
        
        for num in nums {
            if list.contains(num) {
                continue
            }
            
            list.append(num)
            backtracking(&list, nums)
            list.removeLast()
        }
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var list: [Int] = []
        backtracking(&list, nums)
        
        return result
    }
}
