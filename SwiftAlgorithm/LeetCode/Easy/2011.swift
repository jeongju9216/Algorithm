//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        var result: Int = 0
        operations.map {
            if $0.first! == "+" || $0.last! == "+" {
                result += 1
            } else {
                result -= 1
            }
        }
        
        return result
    }
}
// Runtime: 31 ms, faster than 78.20% of Swift online submissions for Final Value of Variable After Performing Operations.
// Memory Usage: 14.3 MB, less than 80.77% of Swift online submissions for Final Value of Variable After Performing Operations.

