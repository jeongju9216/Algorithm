//
//  22.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/30.
//

import Foundation

class Solution {
    var result: [String] = []
        
    func generateParenthesis(_ n: Int) -> [String] {
        makeResult("", 0, 0, n)
        
        return result
    }
    
    func makeResult(_ current: String, _ leftCount: Int, _ rightCount: Int, _ n: Int) {
        if leftCount + rightCount == n * 2 {
            result.append(current)
            return
        }
        
        if leftCount < n {
            makeResult(current + "(", leftCount + 1, rightCount, n)
        }
        
        if rightCount < leftCount {
            makeResult(current + ")", leftCount, rightCount + 1, n)
        }
    }
}
