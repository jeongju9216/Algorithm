//
//  39.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/31.
//

import Foundation

class Solution {
    var result: [[Int]] = []
    var candidates: [Int] = []
    var target: Int = 0
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        self.candidates = candidates
        self.target = target
        
        backtracking([], 0, 0)
        
        return result
    }
    
    func backtracking(_ arr: [Int], _ index: Int, _ total: Int) {
        if total == target {
            result.append(arr)
            return
        }
        
        guard total < target, index < candidates.count else { return }
        
        let currentNum = candidates[index]
        
        backtracking(arr + [currentNum], index, total + currentNum)
        backtracking(arr, index+1, total)
    }
}
